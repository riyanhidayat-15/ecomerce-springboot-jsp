<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.name} - Detail Produk</title>
    <link rel="stylesheet" href="/css/detailProduct.css"/>
</head>
<body>
<%@ include file="components/navbar.jsp" %>
    <div class="container">
        <div class="breadcrumb">
            <a href="/">Home</a>
            <span>›</span>
            <span>${product.name}</span>
        </div>

        <div class="product-detail">
            <!-- Product Image Section -->
            <div class="product-image-section">
                <img src="${product.imagePath}" alt="${product.name}" class="main-image">
            </div>

            <div class="product-info-section">
                <h1 class="product-title">${product.name}</h1>

                <div class="product-price">
                    Rp <fmt:formatNumber value="${product.price}" pattern="#,##0"/>
                </div>

                <c:choose>
                    <c:when test="${product.stock == 0}">
                        <span class="stock-info out-of-stock">Stok Habis</span>
                    </c:when>
                    <c:when test="${product.stock <= 10}">
                        <span class="stock-info low-stock">Stok Terbatas: ${product.stock} tersisa</span>
                    </c:when>
                    <c:otherwise>
                        <span class="stock-info">Tersedia: ${product.stock} item</span>
                    </c:otherwise>
                </c:choose>

                <div class="divider"></div>

                <div>
                    <h3 class="section-title">Deskripsi Produk</h3>
                    <p class="product-description">${product.description}</p>
                </div>

                <div class="divider"></div>

                <!-- Quantity Selection -->
                <div class="quantity-section">
                    <span class="quantity-label">Jumlah:</span>
                    <div class="quantity-control">
                        <button type="button" id="decrease">−</button>
                        <input type="number" id="quantity" value="1" min="1" max="${product.stock}" readonly>
                        <button type="button" id="increase">+</button>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="action-buttons">
                    <button class="btn btn-secondary" onclick="addToCart()" ${product.stock == 0 ? 'disabled' : ''}>
                        🛒 Tambah ke Keranjang
                    </button>
                    <button class="btn btn-primary" onclick="buyNow()" ${product.stock == 0 ? 'disabled' : ''}>
                        Beli Sekarang
                    </button>
                </div>

            </div>
        </div>
    </div>

    <script href="/js/detailProduct.js">
    </script>
</body>
</html>