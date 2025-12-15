package com.ecomerce.controller;

import com.ecomerce.model.Order;
import com.ecomerce.model.User;
import com.ecomerce.service.DashboardService;
import com.ecomerce.service.OrderService;
import com.ecomerce.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class DashboardController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private DashboardService dashboardService;
    @Autowired
    private UserService userService;

    @GetMapping("/admin/dashboard")
    public String dashboard(Model model) {
        // redirect to reports page as main dashboard
        return "redirect:/admin/reports";
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

    @GetMapping("/admin/users")
    public String usersAdmin(HttpSession session, Model model) {
        if (!"ADMIN".equals(session.getAttribute("role"))) {
            return "redirect:/login";
        }

        List<User> users = userService.getAllUsers();
        model.addAttribute("users", users);

        String userError = (String) session.getAttribute("userError");
        if (userError != null) {
            model.addAttribute("error", userError);
            session.removeAttribute("userError");
        }

        return "components/users";
    }

    @GetMapping("/admin/reports")
    public String reportsAdmin(HttpSession session, Model model) {
        if (!"ADMIN".equals(session.getAttribute("role"))) {
            return "redirect:/login";
        }

        Map<String, String> sales = dashboardService.getMonthlySales();
        model.addAttribute("labels", sales.get("labels"));
        model.addAttribute("data", sales.get("data"));

        model.addAttribute("monthlyRows", dashboardService.getMonthlySalesRows());
        model.addAttribute("summary", dashboardService.getSummaryMetrics());

        return "components/reports";
    }

    @GetMapping("/admin/transactions")
    public String transactionsAdmin(HttpSession session, Model model) {
        if (!"ADMIN".equals(session.getAttribute("role"))) {
            return "redirect:/login";
        }

        model.addAttribute("orders", orderService.getAllOrders());
        return "components/transaction";
    }

    @GetMapping("/admin/users/{id}/edit")
    public String editUserForm(@PathVariable Long id, HttpSession session, Model model) {
        if (!"ADMIN".equals(session.getAttribute("role"))) {
            return "redirect:/login";
        }

        User user = userService.getUserById(id);
        model.addAttribute("user", user);
        return "components/editUser";
    }

    @PostMapping("/admin/users/{id}/update")
    public String updateUser(
            @PathVariable Long id,
            @RequestParam String username,
            @RequestParam String email,
            @RequestParam(required = false) String telepon,
            @RequestParam(required = false) String address,
            @RequestParam(required = false) String role,
            HttpSession session,
            Model model
    ) {
        if (!"ADMIN".equals(session.getAttribute("role"))) {
            return "redirect:/login";
        }

        try {
            userService.updateUser(id, username, email, telepon, address, role);
            return "redirect:/admin/users";
        } catch (RuntimeException e) {
            model.addAttribute("error", e.getMessage());
            model.addAttribute("user", userService.getUserById(id));
            return "components/editUser";
        }
    }

    @PostMapping("/admin/users/{id}/delete")
    public String deleteUser(@PathVariable Long id, HttpSession session) {
        if (!"ADMIN".equals(session.getAttribute("role"))) {
            return "redirect:/login";
        }

        try {
            userService.deleteUserById(id);
        } catch (RuntimeException e) {
            session.setAttribute("userError", e.getMessage());
        }

        return "redirect:/admin/users";
    }



}
