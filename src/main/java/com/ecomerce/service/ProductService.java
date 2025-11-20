package com.ecomerce.service;

import com.ecomerce.model.Product;
import com.ecomerce.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    public Product addProduct(String name, String description, BigDecimal price, Integer stock, MultipartFile imageFile) {
        String uploadDir = "uploads"; // root project

        try {
            Path uploadPath = Paths.get(uploadDir);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            String fileName = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename();
            Files.copy(imageFile.getInputStream(), uploadPath.resolve(fileName));

            Product product = new Product();
            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);
            product.setStock(stock);
            product.setImagePath("/uploads/" + fileName);

            return productRepository.save(product);

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Gagal upload file");
        }

    }

    public Product editProduct(Long id, String name, String description, BigDecimal price, Integer stock, MultipartFile imageFile) {
        Product product = productRepository.findById(id).orElseThrow(() -> new RuntimeException("Produk tidak ditemukan"));

        product.setName(name);
        product.setDescription(description);
        product.setPrice(price);
        product.setStock(stock);

        if (imageFile != null && !imageFile.isEmpty()) {
            String uploadDir = "uploads"; // root project

            try {
                Path uploadPath = Paths.get(uploadDir);
                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }

                String fileName = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename();
                Files.copy(imageFile.getInputStream(), uploadPath.resolve(fileName));

                product.setImagePath("/uploads/" + fileName);

            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException("Gagal upload file");
            }
        }

        return productRepository.save(product);
    }

    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }
}