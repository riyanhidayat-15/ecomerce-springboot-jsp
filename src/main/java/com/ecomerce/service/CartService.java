package com.ecomerce.service;

import com.ecomerce.model.Cart;
import com.ecomerce.model.Product;
import com.ecomerce.model.User;
import com.ecomerce.repository.CartRepository;
import com.ecomerce.repository.ProductRepository;
import com.ecomerce.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartService {
    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private UserRepository userRepository;

    public Cart addToCart(Long userId, Long productId, int qty){
        User user = userRepository.findById(userId).orElseThrow(()-> new RuntimeException("User not found"));
        Product product = productRepository.findById(productId).orElseThrow(()-> new RuntimeException("Product not found"));
        Cart existing = cartRepository.findByUserIdAndProductId(userId, productId).orElse(null);

        if (existing != null) {
            existing.setQuantity(existing.getQuantity() + qty);
            return cartRepository.save(existing);
        }

        Cart cart = new Cart();
        cart.setUser(user);
        cart.setProduct(product);
        cart.setQuantity(qty);

        return cartRepository.save(cart);

    }

    public List<Cart> getCardByUser(Long userId) {
        return cartRepository.findByUserId(userId);
    }

    public void updateQuantity(Long cartId, int quantity) {
        Cart cart = cartRepository.findById(cartId)
                .orElseThrow(() -> new RuntimeException("Cart not found"));
        cart.setQuantity(quantity);
        cartRepository.save(cart);
    }

    public void deleteById(Long cartId) {
        cartRepository.deleteById(cartId);
    }

    public void deleteMultiple(List<Long> cartIds) {
        cartRepository.deleteAllById(cartIds);
    }
}
