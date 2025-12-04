<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
</head>
<body style="font-family: Arial, sans-serif;">
<%@ include file="components/navbar.jsp" %>
<link rel="stylesheet" href="/css/card.css"/>

<div class="product-grid" style="padding: 2rem; margin-top:4rem;">
    <c:forEach var="product" items="${products}">
    <a href="/products/${product.id}">
        <div class="product-card">
            <!-- Product Image -->
            <div class="product-image">
                <img src="${product.imagePath}" alt="${product.name}">
            </div>

            <div class="product-info">
                <h3 class="product-name">${product.name}</h3>

                <div class="price-section">
                    <span class="product-price">Rp <fmt:formatNumber value="${product.price}" pattern="#,##0"/></span>
                    <span class="product-stock">Tersedia: ${product.stock}</span>
                </div>

            </div>
        </div>
    </a>
    </c:forEach>
</div>

</body>
</html>
