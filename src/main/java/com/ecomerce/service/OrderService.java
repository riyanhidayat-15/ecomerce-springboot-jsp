package com.ecomerce.service;

import com.ecomerce.model.Order;
import com.ecomerce.model.OrderItem;
import com.ecomerce.model.Product;
import com.ecomerce.model.User;
import com.ecomerce.repository.OrderItemRepository;
import com.ecomerce.repository.OrderRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class OrderService {
    @Autowired
    private ProductService productService;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderItemRepository orderItemRepository;

    public OrderItem createOrderItem (Long productId, int qty) {
        Product product = productService.getById(productId);
        OrderItem  orderItem = new OrderItem();
        orderItem.setProduct(product);
        orderItem.setQuantity(qty);
        orderItem.setPriceAtOrder(product.getPrice());

        return orderItem;
    }

    public Order createOrder(User user, List<OrderItem> items) {
        String orderNumber = "ORD"+System.currentTimeMillis();

        BigDecimal total = items.stream().map(item -> item.getPriceAtOrder().multiply(BigDecimal.valueOf(item.getQuantity()))).reduce(BigDecimal.ZERO, BigDecimal::add);

        Order order = new Order(user, orderNumber, total, "DIKEMAS");

        orderRepository.save(order);

        for (OrderItem item : items) {
            item.setOrder(order);
            orderItemRepository.save(item);
        }

        return order;
    }

    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    public List<Order> getOrderByStatus(String status) {
        return orderRepository.findByStatus(status);
    }

    public List<Order> getOrderByStatuses(List<String> statuses) {
        return orderRepository.findByStatusIn(statuses);
    }

    public Order getOrderById(Long orderId) {
        Order order = orderRepository.findById(orderId).orElseThrow(()-> new RuntimeException("data not found"));

        return order;
    }

    public List<Order> getOrdersByUserId(Long userId) {
       return orderRepository.findByUserIdOrderByIdDesc(userId);
    }

    @Transactional
    public void updateStatusOrder(Long orderId, String status) {
        Order order = orderRepository.findById(orderId).orElseThrow(()-> new RuntimeException("Data not found"));

        order.setStatus(status);
    }
}
