package com.daribangkubelakang.campus.belajar_jsp.controller;

import com.daribangkubelakang.campus.belajar_jsp.model.User;
import com.daribangkubelakang.campus.belajar_jsp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserRepository userRepository;

    @GetMapping("/add-user")
    public String showForm() {
        return "form";
    }

    @PostMapping("/save")
    public String saveUser(@RequestParam String name, @RequestParam String email, Model model) {
        User user = new User(name, email);

        userRepository.save(user);

        List<User> users = userRepository.findAll();

        model.addAttribute("users", users);

        return "redirect:/users";
    }

    @GetMapping("/users")
    public String getAllUsers (Model model) {
        List<User> users = userRepository.findAll();
        model.addAttribute("users", users);
        return "result";
    }
}
