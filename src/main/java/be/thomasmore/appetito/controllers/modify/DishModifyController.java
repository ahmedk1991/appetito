package be.thomasmore.appetito.controllers.modify;


import be.thomasmore.appetito.model.*;
import be.thomasmore.appetito.repositories.BeverageRepository;
import be.thomasmore.appetito.repositories.DishRepository;
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

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

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
    BeverageRepository beverageRepository;

    @ModelAttribute("dish")
    public Dish findDish(@PathVariable(required = false) Integer id) {
        if (id != null) {
            Optional<Dish> dishFromDB = dishRepository.findById(id);
            return dishFromDB.orElseGet(Dish::new);
        } else {
            return new Dish();
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
            dishDto.setPreparation(dish.getPreparation());

            model.addAttribute("dishDto", dishDto);
            model.addAttribute("dish", dish);

            return "modify/dishedit";
        } else {
            return "redirect:/dishdetail";
        }

    }

    @PostMapping("/dishedit/{id}")
    public String dishEditPost(@Valid @ModelAttribute DishDto dishDto,
                               @RequestParam(required = false) MultipartFile image,
                               BindingResult result, @PathVariable int id, Model model) {

        logger.debug("posting data for id {}", id);

        if (result.hasErrors()) {
            logger.error("validation errors: {}", result.getAllErrors());

            model.addAttribute("dishDto", dishDto);
            model.addAttribute("bindingResult", result);
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
                dish.setPreparation(dishDto.getPreparation());
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


    @GetMapping("/addmeal")
    public String showCreateDish(Model model) {
        DishDto dishDto = new DishDto();
        model.addAttribute("dishDto", dishDto);

        return "modify/addmeal";
    }

    @PostMapping("/addmeal")
    public String createDish(Model model,
                             @Valid DishDto dishDto,
                             @RequestParam(required = false) MultipartFile image,
                             @RequestParam("beverageNames[]") List<String> beverageNames,
                             @RequestParam("beverageImages[]") List<MultipartFile> beverageImages,
                             BindingResult bindingResult) throws IOException {

        Dish dish = new Dish();
        // Set dish properties using dishDto...

        // Save dish image if provided...
        if (image != null && !image.isEmpty()) {
            dish.setImgFileName(uploadImage(image));
        }

        // Process beverage inputs...
        List<Beverage> beverages = new ArrayList<>();

        for (int i = 0; i < beverageNames.size(); i++) {
            String beverageName = beverageNames.get(i);
            MultipartFile beverageImage = beverageImages.get(i);

            Beverage beverage = new Beverage();
            beverage.setName(beverageName);

            // Save beverage image if provided...
            if (beverageImage != null && !beverageImage.isEmpty()) {
                beverage.setImgFile(uploadBevImage(beverageImage));
            }

            // Add beverage to the list...
            beverages.add(beverage);
        }

        // Save all beverages
        beverageRepository.saveAll(beverages);

        // Associate beverages with the dish
        dish.setBeverages(beverages);

        // Save the dish
        dishRepository.save(dish);

        return "redirect:/dishes";
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
                                  Model model) {
        Optional<Dish> optionalDish = dishRepository.findById(id);
        if (!optionalDish.isPresent()) {
            model.addAttribute("error", "Dish not found with id: " + id);
            return "/error";
        }

        Dish dish = optionalDish.get();
        List<Ingredient> currentIngredients = new ArrayList<>(wrapper.getIngredients());


        dish.getIngredients().clear();

        currentIngredients.forEach(ingredient -> {
            ingredient.setDish(dish);
            dish.getIngredients().add(ingredient);

        });


        dishRepository.save(dish);

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
            return "/error";
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
    public String saveAllBeverages(@RequestParam("id") Integer id,
                                   @RequestParam("name") List<String> names,
                                   @RequestParam("image") List<MultipartFile> imageFiles) {
        Optional<Dish> optionalDish = dishRepository.findById(id);
        if (optionalDish.isPresent()) {
            Dish dish = optionalDish.get();
            List<Beverage> beverages = new ArrayList<>(dish.getBeverages());
            for (int i = 0; i < beverages.size(); i++) {
                Beverage beverage = beverages.get(i);
                beverage.setName(names.get(i));
                MultipartFile imageFile = imageFiles.get(i);
                if (!imageFile.isEmpty()) {
                    try {
                        String imageUrl = uploadBevImage(imageFile);
                        beverage.setImgFile(imageUrl);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
            beverageRepository.saveAll(beverages);
            dishRepository.save(dish);
        }
        return "redirect:/modify/dishedit/" + id;
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