package be.thomasmore.appetito.controllers.admin;


import be.thomasmore.appetito.model.Dish;
import be.thomasmore.appetito.model.DishDto;
import be.thomasmore.appetito.repositories.DishRepository;
import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Optional;


@RequestMapping("/admin")
@Controller
public class DishAdminController {

    private static final Logger logger= LoggerFactory.getLogger(DishAdminController.class);
    @Autowired
    DishRepository dishRepository;

    @ModelAttribute("dish")
    public Dish findDish(@PathVariable(required = false) Integer id){
        if (id != null) {
            Optional<Dish> dishFromDB = dishRepository.findById(id);
            return dishFromDB.orElseGet(Dish::new);
        } else {
            return new Dish();
        }
    }


    @GetMapping("/dishedit/{id}")
    public String dishEdit(Model model, @PathVariable(required = false) Integer id){

        Optional<Dish>dishOptional=dishRepository.findById(id);
        if(dishOptional.isPresent()){

            Dish dish =dishOptional.get();
            DishDto dishDto=new DishDto();
            dishDto.setName(dish.getName());
            dishDto.setDietPreferences(dish.getDietPreferences());
            dishDto.setPreparationTime(dish.getPreparationTime());
            dishDto.setOccasion(dish.getOccasion());
            dishDto.setPreparation(dish.getPreparation());

            model.addAttribute("dishDto",dishDto);
            model.addAttribute("dish",dish);

           return "admin/dishedit";
        }
        else{
            return"redirect:/dishdetail";
        }

    }

    @PostMapping("/dishedit/{id}")
    public String dishEditPost(@Valid @ModelAttribute DishDto dishDto, BindingResult result, @PathVariable int id, Model model) {

        logger.debug("posting data for id {}", id);

        if (result.hasErrors()) {
            logger.error("validation errors: {}", result.getAllErrors());

            model.addAttribute("dishDto", dishDto);
            model.addAttribute("bindingResult", result);
            return "admin/dishedit";
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

                if (!dishDto.getMultipartFile().isEmpty()) {
                    String filename = uploadImage(dishDto.getMultipartFile());
                    dish.setImgFileName(filename);
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

        return "admin/addmeal";
    }

    @PostMapping("/addmeal")
    public String createDish(@Valid @ModelAttribute DishDto dishDto, BindingResult result ) {

        Dish dish = new Dish();
        if (dishDto.getMultipartFile().isEmpty()) {
            result.addError(new FieldError("dishDto", "multipartFile", "Fotobestand mag niet leeg zijn"));
        }

        dish.setName(dishDto.getName());
        dish.setDietPreferences(dishDto.getDietPreferences());
        dish.setOccasion(dishDto.getOccasion());
        dish.setPreparation(dishDto.getPreparation());
        dish.setPreparationTime(dishDto.getPreparationTime());

        try {
            dish.setImgFileName(uploadImage(dishDto.getMultipartFile()));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


        dishRepository.save(dish);
        return "redirect:/dishes";
    }


    private String uploadImage(MultipartFile multipartFile) throws IOException {
        if (multipartFile.isEmpty()) {
            return null;
        }

        final String directoryPath = "src/main/resources/static/img/";
        File directory = new File(directoryPath.trim());
        if (!directory.exists()) {
            directory.mkdirs();
        }


        String filename = multipartFile.getOriginalFilename();
        Path path = Paths.get(directoryPath + filename);
        Files.copy(multipartFile.getInputStream(), path);

        return filename;
    }
}
