package com.ecomerce.service;
import com.ecomerce.repository.OrderRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.Month;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DashboardService {

    @Autowired
    private OrderRepository orderRepository;

    private final ObjectMapper mapper = new ObjectMapper();

    public Map<String, String> getMonthlySales() {
        List<Object[]> results = orderRepository.getMonthlySales();

        List<String> labels = new ArrayList<>();
        List<BigDecimal> data = new ArrayList<>();

        for (Object[] row : results) {
            int month = ((Number) row[0]).intValue();
            BigDecimal total = (BigDecimal) row[1];

            labels.add(Month.of(month).name());
            data.add(total);
        }

        try {
            Map<String, String> response = new HashMap<>();
            response.put("labels", mapper.writeValueAsString(labels));
            response.put("data", mapper.writeValueAsString(data));
            return response;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
