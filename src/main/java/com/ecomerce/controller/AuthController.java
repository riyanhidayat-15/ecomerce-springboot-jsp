package com.ecomerce.controller;

import com.ecomerce.model.Product;
import com.ecomerce.model.User;
import com.ecomerce.service.ProductService;
import com.ecomerce.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller

public class AuthController {
    @Autowired
    private UserService userService;
    @Autowired
    private ProductService productService;

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, HttpSession session, Model model) {
        try{
            User user = userService.authenticateUser(username, password);

            session.setAttribute("user", user);
            session.setAttribute("userId", user.getId());
            session.setAttribute("username", user.getUsername());
            session.setAttribute("role", user.getRole());

            return "redirect:/";

        } catch (RuntimeException e) {
            model.addAttribute("error", e.getMessage());
            return "login";
        }
    }

    @GetMapping("/register")
    public  String registerPage() {
        return "register";
    }

    @PostMapping("/register")
    public String register(@RequestParam String username, @RequestParam String email, @RequestParam String password, @RequestParam String confirmPassword, Model model) {
        try {
            if(!password.equals(confirmPassword)) {
                model.addAttribute("error", "Password tidak sama");
                return "register";
            }

            userService.registerUser(username, email, password, "USER");

            return "login";
        } catch (RuntimeException e) {
            model.addAttribute("error", e.getMessage());
            return "register";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    @GetMapping("/profile/edit")
    public String editProfile(HttpSession session, Model model) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }

        User user = userService.getUserById(userId);
        model.addAttribute("user", user);
        return "profile";
    }

    @PostMapping("/profile/update")
    public String updateProfile(
            @RequestParam String username,
            @RequestParam String email,
            @RequestParam(required = false) String telepon,
            @RequestParam(required = false) String address,
            HttpSession session,
            Model model
    ) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }

        try {
            User current = userService.getUserById(userId);
            userService.updateUser(userId, username, email, telepon, address, current.getRole());

            // update session username if changed
            session.setAttribute("username", username);
            model.addAttribute("success", "Profil berhasil diperbarui");
            model.addAttribute("user", userService.getUserById(userId));
            return "profile";
        } catch (RuntimeException e) {
            model.addAttribute("error", e.getMessage());
            model.addAttribute("user", userService.getUserById(userId));
            return "profile";
        }
    }


}