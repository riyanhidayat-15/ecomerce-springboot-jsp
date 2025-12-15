<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Keranjang Belanja</title>
    <link rel="stylesheet" href="/css/cart.css"/>
</head>
<body>

<%@ include file="components/navbar.jsp" %>

<div class="page">

    <!-- LEFT -->
    <div class="cart-left">
        <div class="cart-title">Keranjang</div>

        <div class="select-all-box">
            <div>
                <input type="checkbox" id="selectAll" onchange="toggleSelectAll()">
                Pilih Semua ( ${carts.size()} )
            </div>
            <div style="color:red; cursor:pointer;" onclick="deleteSelected()">Hapus</div>
        </div>

        <c:forEach var="item" items="${carts}">
            <div class="cart-card"
                 data-cart-id="${item.id}"
                 data-price="${item.product.price}">

                <input type="checkbox"
                       class="item-checkbox"
                       onchange="updateSummary()">

                <img src="${item.product.imagePath}" class="cart-img"/>

                <div class="info">
                    <div class="store-name">Toko — ${item.product.name}</div>
                    <div class="p-name">${item.product.name}</div>
                    <div class="p-price">
                        Rp <fmt:formatNumber value="${item.product.price}" pattern="#,##0"/>
                    </div>
                </div>

                <div class="qty">
                    <button onclick="decreaseQty(${item.id})">-</button>
                    <input type="text" id="qty-${item.id}" value="${item.quantity}" readonly/>
                    <button onclick="increaseQty(${item.id})">+</button>
                </div>

                <div class="p-price item-subtotal">
                    Rp <fmt:formatNumber value="${item.product.price * item.quantity}" pattern="#,##0"/>
                </div>

                <div class="delete" onclick="deleteItem(${item.id})">Hapus</div>
            </div>
        </c:forEach>
    </div>

    <!-- RIGHT SUMMARY -->
    <div class="summary">
        <div class="sum-title">Ringkasan Belanja</div>

        <div class="sum-row">
            <span>Total</span>
            <span class="sum-total" id="totalPrice">Rp 0</span>
        </div>

        <!-- CHECKOUT FORM (POST) -->
        <form action="/checkout/create-from-cart" method="post">
            <button type="submit" class="checkout-btn">
                Beli (<span id="selectedCount">0</span>)
            </button>
        </form>
    </div>

</div>

<script>
function toggleSelectAll() {
    const selectAll = document.getElementById('selectAll');
    document.querySelectorAll('.item-checkbox')
        .forEach(cb => cb.checked = selectAll.checked);
    updateSummary();
}

function updateSummary() {
    const checked = document.querySelectorAll('.item-checkbox:checked');
    let total = 0;

    checked.forEach(cb => {
        const card = cb.closest('.cart-card');
        const price = parseFloat(card.dataset.price);
        const qty = parseInt(card.querySelector('input[type="text"]').value);
        total += price * qty;
    });

    document.getElementById('totalPrice').textContent =
        'Rp ' + total.toLocaleString('id-ID');
    document.getElementById('selectedCount').textContent = checked.length;

    const all = document.querySelectorAll('.item-checkbox');
    document.getElementById('selectAll').checked =
        all.length > 0 && checked.length === all.length;
}

function increaseQty(cartId) {
    const input = document.getElementById('qty-' + cartId);
    input.value = parseInt(input.value) + 1;
    syncQty(cartId, input.value);
}

function decreaseQty(cartId) {
    const input = document.getElementById('qty-' + cartId);
    if (parseInt(input.value) > 1) {
        input.value = parseInt(input.value) - 1;
        syncQty(cartId, input.value);
    }
}

function syncQty(cartId, qty) {
    updateSubtotal(cartId, qty);
    updateSummary();

    fetch('/cart/update', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: 'cartId=' + cartId + '&quantity=' + qty
    }).then(res => {
        if (!res.ok) location.reload();
    });
}

function updateSubtotal(cartId, qty) {
    const card = document.querySelector('[data-cart-id="' + cartId + '"]');
    const price = parseFloat(card.dataset.price);
    card.querySelector('.item-subtotal').textContent =
        'Rp ' + (price * qty).toLocaleString('id-ID');
}

function deleteItem(cartId) {
    if (!confirm('Hapus item ini?')) return;
    fetch('/cart/delete/' + cartId, { method: 'POST' })
        .then(res => res.ok && location.reload());
}

function deleteSelected() {
    const ids = Array.from(document.querySelectorAll('.item-checkbox:checked'))
        .map(cb => cb.closest('.cart-card').dataset.cartId);

    if (ids.length === 0) return alert('Pilih item dulu');
    if (!confirm('Hapus ' + ids.length + ' item?')) return;

    fetch('/cart/delete-multiple', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(ids)
    }).then(res => res.ok && location.reload());
}

window.onload = updateSummary;
</script>

</body>
</html>
