package com.ecomerce.controller;

import com.ecomerce.model.Product;
import com.ecomerce.service.ProductService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.util.List;

@Controller
public class ProductController {
    @Autowired
    private ProductService productService;

    @GetMapping("/admin/products")
    public String admin(HttpSession session, Model model) {
        if(!"ADMIN".equals(session.getAttribute("role"))) {
            return "redirect:/login";
        }

        List<Product> products = productService.getAllProducts();
        model.addAttribute("products", products);

        return "dashboard";
    }

    @PostMapping("/admin/products/add")
    public  String adProduct(
            @RequestParam String name,
            @RequestParam String description,
            @RequestParam BigDecimal price,
            @RequestParam Integer stock) {

        productService.addProduct(name, description, price, stock);

        return "redirect:/admin/products";
    }
}
