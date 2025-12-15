package com.ecomerce.repository;

import com.ecomerce.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByUserIdOrderByIdDesc(Long userId);
    List<Order> findByStatus(String status);
    List<Order> findByStatusIn(List<String> statuses);

    @Query("""
        SELECT MONTH(o.createdAt), SUM(o.totalPrice)
        FROM Order o
        GROUP BY MONTH(o.createdAt)
        ORDER BY MONTH(o.createdAt)
    """)
    List<Object[]> getMonthlySales();

    @Query("SELECT SUM(o.totalPrice) FROM Order o")
    java.math.BigDecimal getTotalRevenue();

    @Query("SELECT o.status, COUNT(o) FROM Order o GROUP BY o.status")
    List<Object[]> getCountsByStatus();
}
