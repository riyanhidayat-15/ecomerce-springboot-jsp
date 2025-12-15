package com.ecomerce.controller;

import com.ecomerce.model.Cart;
import com.ecomerce.model.Order;
import com.ecomerce.service.CartService;
import com.ecomerce.service.OrderService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private CartService cartService;

    @Autowired
    private OrderService orderService;

    @PostMapping("/add")
    public String addToCart(@RequestParam Long productId, @RequestParam int qty, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");

        if(userId == null) {
            return "redirect:/login";
        }

        cartService.addToCart(userId, productId, qty);

        return "redirect:/cart";
    }

    @GetMapping
    public String viewCart(Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");

        if (userId == null) {
            return "redirect:/login";
        }

        List<Cart> carts = cartService.getCardByUser(userId);
        model.addAttribute("carts", carts);
        return "cart";
    }

    @PostMapping("/update")
    @ResponseBody
    public ResponseEntity<?> updateQuantity(@RequestParam Long cartId,
                                            @RequestParam int quantity) {
        try {
            cartService.updateQuantity(cartId, quantity);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @PostMapping("/delete/{cartId}")
    @ResponseBody
    public ResponseEntity<?> deleteItem(@PathVariable Long cartId) {
        try {
            cartService.deleteById(cartId);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @PostMapping("/delete-multiple")
    @ResponseBody
    public ResponseEntity<?> deleteMultiple(@RequestBody List<Long> cartIds) {
        try {
            cartService.deleteMultiple(cartIds);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }



}
