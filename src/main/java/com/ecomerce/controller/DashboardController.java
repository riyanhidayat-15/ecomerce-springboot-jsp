package com.ecomerce.controller;

import com.ecomerce.service.OrderService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {
    @Autowired
    private OrderService orderService;
    @GetMapping("/admin/dashboard")
    public String dashboard(Model model, HttpSession session) {
        if(!"ADMIN".equals(session.getAttribute("role"))) {
            return "redirect:/login";
        }
        model.addAttribute("orders", orderService.getAllOrders());
        return "components/analytics";
    }
}
