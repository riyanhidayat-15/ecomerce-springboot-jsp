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
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 700px;
            margin: 80px auto;
            padding: 0 15px;
        }

        .order-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.08);
            padding: 15px;
            margin-bottom: 18px;
        }

        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
        }

        .order-header .username {
            font-weight: bold;
            font-size: 15px;
        }

        .status {
            font-weight: bold;
            color: #d65100;
        }

        .status-DIKIRIM { color: #007bff; }
        .status-DIKEMAS { color: #ff8800; }
        .status-SELESAI { color: #28a745; }

        .product-section {
            display: flex;
            gap: 12px;
            margin-bottom: 12px;
        }

        .product-img {
            width: 70px;
            height: 70px;
            border-radius: 6px;
            object-fit: cover;
            border: 1px solid #ddd;
        }

        .product-info .p-name {
            font-weight: bold;
            font-size: 14px;
        }

        .product-info .p-variant {
            font-size: 12px;
            color: gray;
        }

        .product-info .p-price {
            margin-top: 8px;
            font-weight: bold;
        }

        .order-footer {
            display: flex;
            justify-content: space-between;
            padding-top: 10px;
            border-top: 1px solid #eee;
            margin-top: 10px;
        }

        .total-label {
            font-size: 14px;
            color: #333;
        }

        .total-price {
            font-weight: bold;
            font-size: 15px;
            color: #d65100;
        }

        .btn-diterima {
            width: 100%;
            display: block;
            text-align: center;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            margin-top: 12px;
            border: none;
            outline: none;
            cursor: pointer;

        }

        .empty-state {
            text-align: center;
            margin-top: 100px;
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
                    <div class="username">${order.user.username}</div>
                    <div class="status status-${order.status}">
                        <c:choose>
                            <c:when test="${order.status == 'DIKEMAS'}">Sedang Dikemas</c:when>
                            <c:when test="${order.status == 'DIKIRIM'}">Sedang Dikirim</c:when>
                        </c:choose>
                    </div>
                </div>

                <c:forEach var="item" items="${order.orderItems}">
                    <div class="product-section">
                        <img src="${item.product.imagePath}" class="product-img"/>

                        <div class="product-info">
                            <div class="p-name">${item.product.name}</div>
                            <div class="p-variant">${item.product.description}</div>
                            <div class="p-price">
                                Rp <fmt:formatNumber value="${item.priceAtOrder}" type="number" />
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <div class="order-footer">
                    <div class="total-label">Total Pesanan:</div>
                    <div class="total-price">
                        Rp <fmt:formatNumber value="${order.totalPrice}" type="number"/>
                    </div>
                </div>

                <c:if test="${order.status == 'DIKIRIM'}">
                    <form action="/my-orders/${order.id}/selesai" method="post">
                        <button type="submit" class="btn-diterima">Pesanan Diterima</button>
                    </form>
                </c:if>

            </div>

        </c:forEach>
    </c:if>

    <c:if test="${orders == null || empty orders}">
        <div class="empty-state">
            <h3>Belum Ada Pesanan</h3>
            <p>Kamu belum membeli apapun.</p>
        </div>
    </c:if>

</div>
</body>
</html>
