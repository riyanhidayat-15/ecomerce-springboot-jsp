package com.ecomerce.controller;

import com.ecomerce.model.Product;
import com.ecomerce.service.ProductService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;
import java.util.List;

@Controller
public class ProductController {
    @Autowired
    private ProductService productService;

    @GetMapping("/products")
    public String allProduct(Model model) {
        List<Product> products = productService.getAllProducts();

        model.addAttribute("products", products);
        return "products";
    }

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
            @RequestParam Integer stock,
            @RequestParam("image") MultipartFile imagefile
    ){

        productService.addProduct(name, description, price, stock, imagefile);

        return "redirect:/admin/products";
    }

    @PostMapping("/admin/products/edit/{id}")
    public  String editProduct(
            @RequestParam Long id,
            @RequestParam String name,
            @RequestParam String description,
            @RequestParam BigDecimal price,
            @RequestParam Integer stock,
            @RequestParam (value = "image", required = false) MultipartFile imagefile
    ){
        productService.editProduct(id, name, description, price, stock, imagefile);
        return "redirect:/admin/products";
    }

    @PostMapping("/admin/products/delete/{id}")
    public String deleteProduct(@PathVariable Long id) {
        productService.deleteProduct(id);
        return "redirect:/admin/products";
    }

    @GetMapping("/products/{id}")
    public String detailProduct(@PathVariable Long id, Model model) {
        Product product = productService.getById(id);
        model.addAttribute("product", product);
        return "detailProduct";
    }

}
