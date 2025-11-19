<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="/css/card.css"/>

<div class="product-grid">
    <c:forEach var="product" items="${products}">
        <div class="product-card">
            <!-- Product Image -->
            <div class="product-image">
                <img src="${product.imagePath}" alt="${product.name}">
            </div>

            <!-- Product Info -->
            <div class="product-info">
                <h3 class="product-name">${product.name}</h3>

                <div class="price-section">
                    <span class="product-price">Rp <fmt:formatNumber value="${product.price}" pattern="#,##0"/></span>
                    <span class="product-stock">Tersedia: ${product.stock}</span>
                </div>

            </div>
        </div>
    </c:forEach>
</div>