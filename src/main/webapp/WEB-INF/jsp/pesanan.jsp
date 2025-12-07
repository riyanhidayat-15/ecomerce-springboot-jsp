<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pesanan Saya</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 900px;
            margin: 80px auto;
            padding: 0 20px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .order-card {
            background: #fff;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }
        .order-header, .order-footer {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        .status-badge {
            padding: 5px 10px;
            border-radius: 12px;
            font-weight: bold;
            color: white;
        }
        .status-DIKEMAS { background-color: orange; }
        .status-DIKIRIM { background-color: blue; }
        .status-SELESAI { background-color: green; }
        .product-item {
            display: flex;
            justify-content: space-between;
            padding: 8px 0;
            border-top: 1px solid #ddd;
        }
        .product-info {
            flex: 1;
            margin-left: 10px;
        }
        .product-name {
            font-weight: bold;
        }
        .product-qty {
            font-size: 0.9em;
            color: #666;
        }
        .product-price, .total-price {
            font-weight: bold;
        }
        .btn-detail {
            display: inline-block;
            padding: 5px 12px;
            background-color: #333;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .empty-state {
            text-align: center;
            padding: 50px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }
        .btn-shop {
            display: inline-block;
            padding: 8px 15px;
            background-color: #333;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 15px;
        }
    </style>
</head>
<body>
<div class="container">
    <%@ include file="components/navbar.jsp" %>
    <c:if test="${orders != null && not empty orders}">
        <c:forEach var="order" items="${orders}">
            <div class="order-card">
                <div class="order-header">
                    <div>Order: ${order.orderNumber}</div>
                    <div class="status-badge status-${order.status}">${order.status}</div>
                </div>

                <c:forEach var="item" items="${order.orderItems}">
                    <div class="product-item">
                        <div class="product-info">
                            <div class="product-name">${item.product.name}</div>
                            <div class="product-qty">Jumlah: ${item.quantity}</div>
                        </div>
                        <div class="product-price">
                            Rp <fmt:formatNumber value="${item.priceAtOrder}" type="number"/>
                        </div>
                    </div>
                </c:forEach>

                <div class="order-footer">
                    <div>Total:</div>
                    <div class="total-price">
                        Rp <fmt:formatNumber value="${order.totalPrice}" type="number"/>
                    </div>
                </div>

                <a href="/my-orders/${order.id}" class="btn-detail">Lihat Detail</a>
            </div>
        </c:forEach>
    </c:if>

    <c:if test="${orders == null || empty orders}">
        <div class="empty-state">
            <h3>Belum Ada Pesanan</h3>
            <p>Anda belum memiliki pesanan. Yuk mulai belanja sekarang!</p>
            <a href="/products" class="btn-shop">Mulai Belanja</a>
        </div>
    </c:if>
</div>
</body>
</html>
