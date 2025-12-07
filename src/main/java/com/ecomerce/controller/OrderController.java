package com.ecomerce.controller;

import com.ecomerce.model.Order;
import com.ecomerce.model.OrderItem;
import com.ecomerce.model.User;
import com.ecomerce.service.OrderService;
import com.ecomerce.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class OrderController {
    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;

    @PostMapping("/checkout/create-direct")
    public String createOrder (@RequestParam Long productId, @RequestParam int qty, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }
        User user = userService.getUserById(userId);
        OrderItem orderItem = orderService.createOrderItem(productId, qty);

        Order order = orderService.createOrder(user, List.of(orderItem));

        return "redirect:/checkout/" + order.getId();
    }

    @GetMapping("/checkout/{orderId}")
    public String showCheckout (@PathVariable Long orderId, Model model) {
        Order order = orderService.getOrderById(orderId);
        model.addAttribute("order", order);
        return "checkout";
    }

    @GetMapping("/checkout/success")
    public String successPage() {
        return "success";
    }

    @GetMapping("/my-orders")
    public String lihatPesanan(Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }

        List<Order> orders = orderService.getOrdersByUserId(userId);
        model.addAttribute("orders", orders);

        return "pesanan";
    }
}
