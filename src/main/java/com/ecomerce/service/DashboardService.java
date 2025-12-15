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

    public List<java.util.Map<String, Object>> getMonthlySalesRows() {
        List<Object[]> results = orderRepository.getMonthlySales();
        List<java.util.Map<String, Object>> rows = new ArrayList<>();

        for (Object[] row : results) {
            int month = ((Number) row[0]).intValue();
            java.math.BigDecimal total = (java.math.BigDecimal) row[1];

            java.util.Map<String, Object> map = new java.util.HashMap<>();
            map.put("month", java.time.Month.of(month).name());
            map.put("total", total);
            rows.add(map);
        }

        return rows;
    }

    public java.util.Map<String, Object> getSummaryMetrics() {
        java.util.Map<String, Object> summary = new java.util.HashMap<>();

        long totalTransactions = orderRepository.count();
        java.math.BigDecimal totalRevenue = orderRepository.getTotalRevenue();
        if (totalRevenue == null) totalRevenue = java.math.BigDecimal.ZERO;

        java.math.BigDecimal avg = java.math.BigDecimal.ZERO;
        if (totalTransactions > 0) {
            avg = totalRevenue.divide(java.math.BigDecimal.valueOf(totalTransactions), 2, java.math.RoundingMode.HALF_UP);
        }

        summary.put("totalTransactions", totalTransactions);
        summary.put("totalRevenue", totalRevenue);
        summary.put("avgOrderValue", avg);

        java.util.List<Object[]> counts = orderRepository.getCountsByStatus();
        java.util.Map<String, Long> countsByStatus = new java.util.HashMap<>();
        for (Object[] row : counts) {
            String status = (String) row[0];
            Long cnt = ((Number) row[1]).longValue();
            countsByStatus.put(status, cnt);
        }

        summary.put("countsByStatus", countsByStatus);

        return summary;
    }
}
