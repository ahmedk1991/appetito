package be.thomasmore.appetito.controllers.modify;


import be.thomasmore.appetito.model.*;
import be.thomasmore.appetito.repositories.*;
import be.thomasmore.appetito.services.GoogleService;


import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.naming.Binding;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import java.sql.Wrapper;
import java.util.*;


@RequestMapping("/modify")
@Controller
public class DishModifyController {

    private static final Logger logger = LoggerFactory.getLogger(DishModifyController.class);
    @Autowired
    DishRepository dishRepository;

    @Autowired
    GoogleService googleService;

    @Autowired
    StepRepository stepRepository;

    @Autowired
    BeverageRepository beverageRepository;

    @Autowired
    IngredientRepository ingredientRepository;

    @Autowired
    GroceryRepository groceryRepository;

    @ModelAttribute("dish")
    public Dish findDish(@PathVariable(required = false) Integer id) {
        if (id != null) {
            Optional<Dish> dishFromDB = dishRepository.findById(id);
            return dishFromDB.orElseGet(Dish::new);
        } else {
            return new Dish();
        }
    }

    @GetMapping("/addnutritions/{dishId}")
    public String showAddNutritionsForm(@PathVariable("dishId") Integer dishId, Model model, nutritionListWrapper nutritionListWrapper) {
        Dish dish = dishRepository.findById(dishId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid dish Id:" + dishId));
        model.addAttribute("dish", dish);
        model.addAttribute("nutritionsListWrapper", nutritionListWrapper);
        return "modify/addnutritions";
    }

    @PostMapping("/addnutritions/{dishId}")
    public String addNutritions(@PathVariable("dishId") Integer dishId, @ModelAttribute nutritionListWrapper nutritionsListWrapper, Model model) {
        Optional<Dish> optionalDish = dishRepository.findById(dishId);
        if (optionalDish.isPresent()) {
            Dish dish = optionalDish.get();
            nutritionListWrapper wrapper = new nutritionListWrapper();
            wrapper.setNutritions(new ArrayList<>(dish.getNutritions()));

            model.addAttribute("dish", dish);
            model.addAttribute("nutritionsListWrapper", wrapper);
            return "redirect:/dishdetails/" + dishId;
        } else {
            return "redirect:/dishdetails/" + dishId;
        }
    }


    @GetMapping("/dishedit/{id}")
    public String dishEdit(Model model, @PathVariable(required = false) Integer id) {

        Optional<Dish> dishOptional = dishRepository.findById(id);


        if (dishOptional.isPresent()) {

            Dish dish = dishOptional.get();

            DishDto dishDto = new DishDto();
            dishDto.setName(dish.getName());
            dishDto.setDietPreferences(dish.getDietPreferences());
            dishDto.setPreparationTime(dish.getPreparationTime());
            dishDto.setOccasion(dish.getOccasion());

            model.addAttribute("dishDto", dishDto);
            model.addAttribute("dish", dish);

            return "modify/dishedit";
        } else {
            return "redirect:/dishdetail";
        }

    }

    @PostMapping("/dishedit/{id}")
    public String dishEditPost(@Valid @ModelAttribute DishDto dishDto, BindingResult result,
                               @RequestParam(required = false) MultipartFile image,
                               @PathVariable int id, Model model) {

        logger.debug("posting data for id {}", id);

        if (result.hasErrors()) {
            logger.error("validation errors: {}", result.getAllErrors());

            model.addAttribute("dishDto", dishDto);
            return "modify/dishedit";
        }

        try {
            Optional<Dish> optionalDish = dishRepository.findById(id);

            if (optionalDish.isPresent()) {
                Dish dish = optionalDish.get();


                dish.setName(dishDto.getName());
                dish.setDietPreferences(dishDto.getDietPreferences());
                dish.setPreparationTime(dishDto.getPreparationTime());
                dish.setOccasion(dishDto.getOccasion());
                if (image != null && !image.isEmpty()) {
                    dish.setImgFileName(uploadImage(image));
                }
                dishRepository.save(dish);

                return "redirect:/dishdetails/" + id;
            }
        } catch (Exception ex) {
            logger.error("Error: {}", ex.getMessage());
        }
        return "redirect:/dishdetails/" + id;
    }


    @GetMapping("/addsteps/{dishId}")
    public String showAddStepsForm(@PathVariable("dishId") Integer dishId, Model model, RedirectAttributes redirectAttributes) {
        if (dishId == null || dishId <= 0) {
            redirectAttributes.addFlashAttribute("error", "Invalid dish Id!");
            return "redirect:/";
        }

        Dish dish = dishRepository.findById(dishId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid dish Id:" + dishId));
        StepListWrapper wrapper = new StepListWrapper();
        model.addAttribute("dish", dish);
        model.addAttribute("stepListWrapper", wrapper);
        return "modify/addsteps";
    }


    @GetMapping("/addingredients/{dishId}")
    public String showAddIngredientsForm(@PathVariable("dishId") Integer dishId, Model model) {
        Dish dish = dishRepository.findById(dishId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid dish Id:" + dishId));
        model.addAttribute("dish", dish);
        return "modify/addingredients";
    }

    @PostMapping("/addingredients/{dishId}")
    public String addIngredients(@PathVariable("dishId") Integer dishId, @ModelAttribute IngredientListWrapper ingredientListWrapper,
                                 BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("dish", dishRepository.findById(dishId)
                    .orElseThrow(() -> new IllegalArgumentException("Invalid dish Id:" + dishId)));
            model.addAttribute("error", "Er moet minimaal één ingrediënt worden toegevoegd");
            return "modify/addingredients";
        }

        Dish dish = dishRepository.findById(dishId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid dish Id:" + dishId));
        for (Ingredient ingredient : ingredientListWrapper.getIngredients()) {
            ingredient.setDish(dish);
            ingredientRepository.save(ingredient);
        }
        return "redirect:/modify/addnutritions/" + dishId;
    }

    @GetMapping("/addmeal")
    public String showCreateDish(Model model) {
        DishDto dishDto = new DishDto();
        model.addAttribute("dishDto", dishDto);
        return "modify/addmeal";
    }

    @PostMapping("/addmeal")
    public String createDish(Model model,
                             @Valid @ModelAttribute DishDto dishDto,
                             BindingResult bindingResult,
                             @RequestParam("beverageNames[]") List<String> beverageNames,
                             @RequestParam("beverageImages[]") List<MultipartFile> beverageImages) throws IOException {


        if (bindingResult.hasErrors()) {
            model.addAttribute("dishDto", dishDto);
            return "modify/addmeal";
        }

        Dish dish = new Dish();
        dish.setName(dishDto.getName());
        dish.setDietPreferences(dishDto.getDietPreferences());
        dish.setOccasion(dishDto.getOccasion());
        dish.setPreparationTime(dishDto.getPreparationTime());

        if (dishDto.getImage() != null && !dishDto.getImage().isEmpty()) {
            dish.setImgFileName(uploadImage(dishDto.getImage()));
        }

        List<Beverage> beverages = new ArrayList<>();

        for (int i = 0; i < beverageNames.size(); i++) {
            String beverageName = beverageNames.get(i);
            MultipartFile beverageImage = beverageImages.get(i);

            Beverage beverage = new Beverage();
            beverage.setName(beverageName);

            if (beverageImage != null && !beverageImage.isEmpty()) {
                beverage.setImgFile(uploadBevImage(beverageImage));
            }

            beverages.add(beverage);
        }

        beverageRepository.saveAll(beverages);
        dish.setBeverages(beverages);
        dishRepository.save(dish);

        return "redirect:/modify/addsteps/" + dish.getId();
    }


    @DeleteMapping("/editingredients/delete/{id}")
    public ResponseEntity<Void> deleteIngredientDb(@PathVariable Integer id) {
        Optional<Ingredient> optionalIngredient = ingredientRepository.findById(id);
        if (optionalIngredient.isPresent()) {
            Ingredient ingredient = optionalIngredient.get();

            List<Grocery> groceries = groceryRepository.findByIngredients(ingredient);
            logger.info("Groceries: {}", groceries);

            for (Grocery grocery : groceries) {
                grocery.getIngredients().remove(ingredient);
                groceryRepository.save(grocery);
            }

            Dish dish = ingredient.getDish();
            dish.getIngredients().remove(ingredient);
            ingredientRepository.delete(ingredient);
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }


    @GetMapping("/editingredients/{id}")
    public String showIngredients(Model model, @PathVariable("id") Integer id) {
        Optional<Dish> optionalDish = dishRepository.findById(id);
        if (optionalDish.isPresent()) {
            Dish dish = optionalDish.get();
            IngredientListWrapper wrapper = new IngredientListWrapper();
            wrapper.setIngredients(new ArrayList<>(dish.getIngredients()));

            model.addAttribute("dish", dish);
            model.addAttribute("ingredientListWrapper", wrapper);
            return "modify/editingredients";
        } else {
            return "redirect:/modify/dishedit/" + id;
        }
    }


    @PostMapping("/editingredients/{id}")
    @Transactional
    public String editIngredients(@PathVariable("id") Integer id,
                                  @ModelAttribute("ingredientListWrapper") IngredientListWrapper wrapper,
                                  Dish dish,
                                  Model model) {
        Optional<Dish> optionalDish = dishRepository.findById(id);
        if (!optionalDish.isPresent()) {
            model.addAttribute("error", "Dish not found with id: " + id);
            return "error";
        }

        Dish currentDish = optionalDish.get();
        List<Ingredient> ingredientsFromWrapper = wrapper.getIngredients();

        currentDish.getIngredients().removeIf(ingredient -> !ingredientsFromWrapper.contains(ingredient));

        ingredientsFromWrapper.forEach(ingredient -> {
            ingredient.setDish(currentDish);
            currentDish.getIngredients().add(ingredient);
            ingredientRepository.save(ingredient);
        });

        dishRepository.save(currentDish);

        return "redirect:/modify/dishedit/" + id;
    }

    @GetMapping("/editnutritions/{id}")
    public String showNutritions(Model model, @PathVariable("id") Integer id) {
        Optional<Dish> optionalDish = dishRepository.findById(id);
        if (optionalDish.isPresent()) {
            Dish dish = optionalDish.get();
            nutritionListWrapper wrapper = new nutritionListWrapper();
            wrapper.setNutritions(new ArrayList<>(dish.getNutritions()));

            model.addAttribute("dish", dish);
            model.addAttribute("nutritionsListWrapper", wrapper);
            return "modify/editnutritions";
        } else {
            return "redirect:/modify/dishedit/" + id;
        }
    }


    @PostMapping("/editnutritions/{id}")
    @Transactional
    public String editIngredients(@PathVariable("id") Integer id,
                                  @ModelAttribute("nutritionsListWrapper") nutritionListWrapper wrapper,
                                  Model model) {
        Optional<Dish> optionalDish = dishRepository.findById(id);
        if (!optionalDish.isPresent()) {
            model.addAttribute("error", "Dish not found with id: " + id);
            return "error";
        }

        Dish dish = optionalDish.get();
        List<Nutrition> currentNutritions = new ArrayList<>(wrapper.getNutritions());


        dish.getNutritions().clear();

        currentNutritions.forEach(nutrition -> {
            nutrition.setDish(dish);
            dish.getNutritions().add(nutrition);

        });


        dishRepository.save(dish);

        return "redirect:/modify/dishedit/" + id;
    }

    @GetMapping("/editsteps/{id}")
    public String showSteps(Model model, @PathVariable("id") Integer id) {
        Optional<Dish> optionalDish = dishRepository.findById(id);

        if (optionalDish.isPresent()) {
            Dish dish = optionalDish.get();
            Iterable<Step> steps = stepRepository.findByDishId(id);
            StepListWrapper wrapper = new StepListWrapper();
            wrapper.setSteps((List<Step>) steps);

            model.addAttribute("dish", dish);
            model.addAttribute("stepListWrapper", wrapper);
            return "modify/editsteps";
        } else {
            return "redirect:/modify/dishedit/" + id;
        }
    }


    @PostMapping("/editsteps/{id}")
    @Transactional
    public String editSteps(@PathVariable("id") Integer id,
                            @ModelAttribute("stepListWrapper") StepListWrapper wrapper,
                            Model model) throws IOException {
        List<Step> currentSteps = wrapper.getSteps();

        if (currentSteps == null || currentSteps.isEmpty()) {
            model.addAttribute("error", "Er moet minimaal één stap worden toegevoegd.");
            return "modify/editsteps";
        }

        for (Step step : currentSteps) {
            MultipartFile imageFile = step.getImageFile();

            if (step.getId() == null) {
                Step newStep = new Step();
                newStep.setDish(dishRepository.findById(id).get());
                newStep.setDescription(step.getDescription());
                if (imageFile != null && !imageFile.isEmpty()) {
                    newStep.setImage(uploadImage(imageFile));
                }
                stepRepository.save(newStep);
            } else {
                Optional<Step> optionalStep = stepRepository.findById(step.getId());
                if (optionalStep.isPresent()) {
                    Step existingStep = optionalStep.get();
                    existingStep.setDish(dishRepository.findById(id).get());
                    existingStep.setDescription(step.getDescription());
                    if (imageFile != null && !imageFile.isEmpty()) {
                        existingStep.setImage(uploadImage(imageFile));
                    }
                    stepRepository.save(existingStep);
                }
            }
        }

        return "redirect:/modify/dishedit/" + id;
    }

    @PostMapping("/addsteps/{id}")
    @Transactional
    public String addSteps(@PathVariable("id") Integer id,
                           @ModelAttribute("stepListWrapper") StepListWrapper wrapper,
                           Model model) throws IOException {
        List<Step> currentSteps = wrapper.getSteps();

        if (currentSteps == null || currentSteps.isEmpty()) {
            model.addAttribute("error", "Er moet minimaal één stap worden toegevoegd.");
            return "modify/addsteps";
        }

        for (Step step : currentSteps) {
            MultipartFile imageFile = step.getImageFile();

            if (step.getId() == null) {
                Step newStep = new Step();
                newStep.setDish(dishRepository.findById(id).get());
                newStep.setDescription(step.getDescription());
                if (imageFile != null && !imageFile.isEmpty()) {
                    newStep.setImage(uploadImage(imageFile));
                }
                stepRepository.save(newStep);
            } else {
                Optional<Step> optionalStep = stepRepository.findById(step.getId());
                if (optionalStep.isPresent()) {
                    Step existingStep = optionalStep.get();
                    existingStep.setDish(dishRepository.findById(id).get());
                    existingStep.setDescription(step.getDescription());
                    if (imageFile != null && !imageFile.isEmpty()) {
                        existingStep.setImage(uploadImage(imageFile));
                    }
                    stepRepository.save(existingStep);
                }
            }
        }
        return "redirect:/modify/addingredients/" + id;
    }


    @DeleteMapping("/step/{id}")
    public ResponseEntity<Void> deleteStep(@PathVariable Integer id) {
        Optional<Step> optionalStep = stepRepository.findById(id);
        if (optionalStep.isPresent()) {
            stepRepository.delete(optionalStep.get());
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping("/deletebeverage/{dishId}/{beverageId}")
    public String delteBeverage(@PathVariable("dishId") Integer dishId, @PathVariable("beverageId") Integer beverageId) {
        Optional<Dish> optionalDish = dishRepository.findById(dishId);

        if (optionalDish.isPresent()) {
            Dish dish = optionalDish.get();
            Beverage beverageToRemove = null;


            for (Beverage beverage : dish.getBeverages()) {
                if (beverage.getId().equals(beverageId)) {
                    beverageToRemove = beverage;
                    break;
                }
            }

            if (beverageToRemove != null) {
                dish.getBeverages().remove(beverageToRemove);
                dishRepository.save(dish);

            }
        }

        return "redirect:/modify/editbeverage/" + dishId;
    }


    private String uploadImage(MultipartFile multipartFile) throws IOException {
        final String filename = multipartFile.getOriginalFilename();
        final File fileToUpload = new File(filename);
        FileOutputStream fos = new FileOutputStream(fileToUpload);
        fos.write(multipartFile.getBytes());
        final String urlInFirebase = googleService.toFirebase(fileToUpload, filename);
        fileToUpload.delete();
        return urlInFirebase;
    }

    @GetMapping("/editbeverage/{id}")
    public String editBeverages(Model model, @PathVariable("id") Integer id) {
        Optional<Dish> optionalDish = dishRepository.findById(id);
        Collection<Beverage> beverage = optionalDish.get().getBeverages();
        model.addAttribute("beverage", beverage);

        if (optionalDish.isPresent()) {
            Dish dish = optionalDish.get();

            model.addAttribute("dish", dish);
            return "modify/editbeverage";
        } else {
            return "redirect:/modify/dishedit/" + id;
        }
    }


    @PostMapping("/editbeverage/saveAll")
    @Transactional
    public String saveAllBeverages(
            @RequestParam("id") Integer id,
            @RequestParam(value = "names", required = false) List<String> names,
            @RequestParam(value = "imageFiles", required = false) List<MultipartFile> imageFiles,
            @RequestParam(value = "beverageNames", required = false) List<String> beverageNames,
            @RequestParam(value = "beverageImages", required = false) List<MultipartFile> beverageImages) {
        Optional<Dish> optionalDish = dishRepository.findById(id);

        if (optionalDish.isPresent()) {
            Dish dish = optionalDish.get();
            List<Beverage> beverages = new ArrayList<>(dish.getBeverages());

            if (names != null && imageFiles != null) {
                for (int i = 0; i < beverages.size(); i++) {
                    Beverage beverage = beverages.get(i);
                    beverage.setName(names.get(i));

                    MultipartFile imageFile = imageFiles.get(i);

                    try {
                        if (imageFile != null && !imageFile.isEmpty()) {
                            beverage.setImgFile(uploadBevImage(imageFile));
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                    }

                    beverageRepository.save(beverage);
                }
            }

            if (beverageNames != null && beverageImages != null) {
                for (int i = 0; i < beverageNames.size(); i++) {
                    String beverageName = beverageNames.get(i);
                    MultipartFile beverageImage = beverageImages.get(i);

                    Beverage newBeverage = new Beverage();
                    newBeverage.setName(beverageName);

                    try {
                        if (beverageImage != null && !beverageImage.isEmpty()) {
                            newBeverage.setImgFile(uploadBevImage(beverageImage));
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                    }

                    beverages.add(newBeverage);
                    beverageRepository.save(newBeverage);
                }
            }

            dish.setBeverages(beverages);
            dishRepository.save(dish);

            return "redirect:/modify/dishedit/" + id;
        } else {
            return "redirect:/error";
        }
    }


    private String uploadBevImage(MultipartFile multipartFile) throws IOException {
        final String filename = multipartFile.getOriginalFilename();
        final File fileToUpload = new File(filename);
        FileOutputStream fos = new FileOutputStream(fileToUpload);
        fos.write(multipartFile.getBytes());
        final String urlInFirebase = googleService.toFirebase(fileToUpload, filename);
        fileToUpload.delete();
        return urlInFirebase;
    }
}
