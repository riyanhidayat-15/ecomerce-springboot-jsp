package com.ecomerce.repository;

import com.ecomerce.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByUserIdOrderByIdDesc(Long userId);
    List<Order> findByStatus(String status);
    List<Order> findByStatusIn(List<String> statuses);
}
