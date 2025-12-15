
package com.ecomerce.service;

import com.ecomerce.model.User;
import com.ecomerce.repository.UserRepository;
import com.ecomerce.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private OrderRepository orderRepository;

    public User registerUser(String username, String email, String password, String role) {
        if(userRepository.existsByUsername(username)) {
            throw new RuntimeException("Username sudah terdaftar");
        }
        if(userRepository.existsByEmail(email)) {
            throw new RuntimeException("Email sudah terdaftar");
        }

        User user = new User(username, email, password, role);
        return userRepository.save(user);
    }

    public User authenticateUser(String username, String password) {
        Optional<User> userOpt = userRepository.findByUsername(username);

        if(userOpt.isPresent()) {
            User user = userOpt.get();
            if(user.getPassword().equals(password)) {
                return user;
            }
        }
        throw new RuntimeException("Username atau password salah");
    }

    public Optional<User> findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
    public Optional<User> findByEmail(String email) {
        return userRepository.findByEmail(email);
    }
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }
    public User getUserById(Long userId) {
        return userRepository.findById(userId).orElseThrow(()-> new RuntimeException("User not found"));
    }

    public User updateUser(Long userId, String username, String email, String telepon, String address, String role) {
        User user = getUserById(userId);
        if (username != null && !username.isBlank() && !username.equals(user.getUsername())) {
            if (userRepository.existsByUsername(username)) {
                throw new RuntimeException("Username sudah terdaftar");
            }
            user.setUsername(username);
        }
        if (email != null && !email.isBlank() && !email.equals(user.getEmail())) {
            if (userRepository.existsByEmail(email)) {
                throw new RuntimeException("Email sudah terdaftar");
            }
            user.setEmail(email);
        }
        user.setTelepon(telepon);
        user.setAddress(address);
        if (role != null && !role.isBlank()) {
            user.setRole(role);
        }

        return userRepository.save(user);
    }

    public void deleteUserById(Long userId) {
        if (!userRepository.existsById(userId)) {
            throw new RuntimeException("User not found");
        }

        // Prevent deleting user who has orders to avoid FK constraint errors
        if (!orderRepository.findByUserIdOrderByIdDesc(userId).isEmpty()) {
            throw new RuntimeException("Tidak bisa menghapus user: terdapat transaksi terkait.");
        }

        userRepository.deleteById(userId);
    }
}