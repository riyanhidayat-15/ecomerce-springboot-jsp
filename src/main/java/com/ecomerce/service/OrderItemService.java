package com.ecomerce.service;

import com.ecomerce.model.Order;
import com.ecomerce.model.OrderItem;
import com.ecomerce.model.Product;
import com.ecomerce.repository.OrderItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderItemService {
    @Autowired
    private OrderService orderService;
    @Autowired
    private ProductService productService;
    @Autowired
    private OrderItemRepository orderItemRepository;

    public OrderItem createOrderItem(Long orderId, Long productId, int qty) {
        Order order = orderService.getOrderById(orderId);
        Product product = productService.getById(productId);

        OrderItem orderItem = new OrderItem();
        orderItem.setOrder(order);
        orderItem.setProduct(product);
        orderItem.setQuantity(qty);

        return orderItemRepository.save(orderItem);
    }
}
