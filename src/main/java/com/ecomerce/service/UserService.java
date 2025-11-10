
package com.ecomerce.service;

import com.ecomerce.model.User;
import com.ecomerce.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

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
}