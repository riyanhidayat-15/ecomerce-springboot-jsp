package com.ecomerce.controller;

import com.ecomerce.model.Order;
import com.ecomerce.service.DashboardService;
import com.ecomerce.service.OrderService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Map;

@Controller
public class DashboardController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private DashboardService dashboardService;

    @GetMapping("/admin/dashboard")
    public String dashboard(Model model) {
        Map<String, String> sales = dashboardService.getMonthlySales();

        model.addAttribute("labels", sales.get("labels"));
        model.addAttribute("data", sales.get("data"));

        return "/components/analytics";
    }

    @GetMapping("/admin/orders/{id}")
    public String orderDetailAdmin(
            @PathVariable Long id,
            HttpSession session,
            Model model
    ) {
        if (!"ADMIN".equals(session.getAttribute("role"))) {
            return "redirect:/login";
        }

        Order order = orderService.getOrderById(id);
        model.addAttribute("order", order);

        return "components/detailOrder";
    }



}
