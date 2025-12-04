<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link rel="stylesheet" href="/css/card.css"/>

<div class="product-grid" style="margin-top: 1.5rem;">
    <c:forEach var="product" varStatus="status" items="${products}" begin="0" end="9">
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
        <c:if test="${fn:length(products) > 10}">
            <div style="text-align: center; margin-top: 20px;">
                <a href="${pageContext.request.contextPath}/products">
                    Lihat Semua Produk (${fn:length(products)})
                </a>
            </div>
        </c:if>
</div>
