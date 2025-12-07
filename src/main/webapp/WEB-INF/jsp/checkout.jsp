<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - Toko Online</title>
    <link rel="stylesheet" href="/css/checkout.css">

</head>
<body>

    <%@ include file="components/navbar.jsp" %>

<div class="checkout-container">
    <div>
        <div class="card">
            <h2 class="section-title">📦 Produk yang Dibeli</h2>
            <c:forEach var="item" items="${order.orderItems}">
                <div class="product-item">
                    <img src="${item.product.imagePath}" alt="${item.product.name}" class="product-img">
                    <div class="product-details">
                        <div class="product-name">${item.product.name}</div>
                        <div class="product-qty">Jumlah: ${item.quantity}x</div>
                    </div>
                    <div class="product-price">
                        Rp <fmt:formatNumber value="${item.priceAtOrder}" pattern="#,##0"/>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="card" style="margin-top: 25px;">
            <h2 class="section-title">📍 Alamat Pengiriman</h2>
            <div class="info-row">
                <div class="info-label">Nama:</div>
                <div class="info-value">${order.user.username}</div>
            </div>
            <div class="info-row">
                <div class="info-label">Alamat:</div>
                <div class="info-value">${order.user.address}</div>
            </div>
            <div class="info-row">
                <div class="info-label">Telepon:</div>
                <div class="info-value">${order.user.telepon}</div>
            </div>
        </div>
    </div>

    <div>
        <form action="/checkout/success" method="GET">
            <div class="card">
                <h2 class="section-title">💳 Metode Pembayaran</h2>
                <div class="payment-options">

                    <label class="payment-option">
                        <input type="radio" name="paymentMethod" value="TRANSFER" checked>
                        <div class="payment-icon">🏦</div>
                        <div class="payment-details">
                            <div class="payment-name">Transfer Bank</div>
                            <div class="payment-desc">BCA, Mandiri, BNI, BRI</div>
                        </div>
                    </label>

                    <label class="payment-option">
                        <input type="radio" name="paymentMethod" value="COD">
                        <div class="payment-icon">💵</div>
                        <div class="payment-details">
                            <div class="payment-name">Bayar di Tempat (COD)</div>
                            <div class="payment-desc">Bayar saat barang sampai</div>
                        </div>
                    </label>

                    <label class="payment-option">
                        <input type="radio" name="paymentMethod" value="EWALLET">
                        <div class="payment-icon">📱</div>
                        <div class="payment-details">
                            <div class="payment-name">E-Wallet</div>
                            <div class="payment-desc">GoPay, OVO, Dana, ShopeePay</div>
                        </div>
                    </label>

                </div>
            </div>

            <div class="card" style="margin-top: 25px;">
                <h2 class="section-title">💰 Ringkasan Pembayaran</h2>
                <div class="summary-row">
                    <span>Subtotal Produk:</span>
                    <span>Rp <fmt:formatNumber value="${order.totalPrice}" pattern="#,##0"/></span>
                </div>
                <div class="summary-row">
                    <span>Biaya Pengiriman:</span>
                    <span>Rp 15.000</span>
                </div>
                <div class="summary-row total">
                    <span>Total Bayar:</span>
                    <span>Rp <fmt:formatNumber value="${order.totalPrice + 15000}" pattern="#,##0"/></span>
                </div>

                <button type="submit" class="btn-checkout">
                    Bayar Sekarang
                </button>
            </div>
        </form>
    </div>

</div>

</body>
</html>