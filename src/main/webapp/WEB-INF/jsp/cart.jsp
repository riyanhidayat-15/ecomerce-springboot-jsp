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

    <!-- LEFT LIST -->
    <div class="cart-left">
        <div class="cart-title">Keranjang</div>

        <div class="select-all-box">
            <div>
                <input type="checkbox" id="selectAll" onchange="toggleSelectAll()">
                Pilih Semua ( ${carts.size()} )
            </div>
            <div style="color:red; cursor:pointer;" onclick="deleteSelected()">Hapus</div>
        </div>

        <c:set var="total" value="0"/>

        <c:forEach var="item" items="${carts}" varStatus="status">
            <div class="cart-card" data-cart-id="${item.id}" data-price="${item.product.price}">

                <input type="checkbox" class="item-checkbox" onchange="updateSummary()">

                <img src="${item.product.imagePath}" class="cart-img" />

                <div class="info">
                    <div class="store-name">Toko — ${item.product.name}</div>

                    <div class="p-name">${item.product.name}</div>
                    <div class="p-price">
                        Rp <fmt:formatNumber value="${item.product.price}" pattern="#,##0"/>
                    </div>
                </div>

                <div class="qty">
                    <button onclick="decreaseQty(${item.id})">-</button>
                    <input type="text" id="qty-${item.id}" value="${item.quantity}" readonly />
                    <button onclick="increaseQty(${item.id})">+</button>
                </div>

                <div class="p-price item-subtotal">
                    Rp <fmt:formatNumber value="${item.product.price * item.quantity}" pattern="#,##0"/>
                </div>

                <div class="delete" onclick="deleteItem(${item.id})">Hapus</div>
            </div>

            <c:set var="total" value="${total + (item.product.price * item.quantity)}"/>
        </c:forEach>
    </div>

    <div class="summary">
        <div class="sum-title">Ringkasan Belanja</div>

        <div class="sum-row">
            <span>Total</span>
            <span class="sum-total" id="totalPrice">Rp 0</span>
        </div>

        <button class="checkout-btn" onclick="checkout()">
            Beli (<span id="selectedCount">0</span>)
        </button>
    </div>

</div>

<script>
function toggleSelectAll() {
    const selectAll = document.getElementById('selectAll');
    const checkboxes = document.querySelectorAll('.item-checkbox');

    checkboxes.forEach(cb => {
        cb.checked = selectAll.checked;
    });

    updateSummary();
}

function updateSummary() {
    const checkboxes = document.querySelectorAll('.item-checkbox:checked');
    let total = 0;
    let count = 0;

    checkboxes.forEach(cb => {
        const card = cb.closest('.cart-card');
        const price = parseFloat(card.dataset.price);
        const qtyInput = card.querySelector('input[type="text"]');
        const qty = parseInt(qtyInput.value);

        total += price * qty;
        count++;
    });

    document.getElementById('totalPrice').textContent =
        'Rp ' + total.toLocaleString('id-ID');
    document.getElementById('selectedCount').textContent = count;

    const allCheckboxes = document.querySelectorAll('.item-checkbox');
    const allChecked = Array.from(allCheckboxes).every(cb => cb.checked);
    document.getElementById('selectAll').checked = allChecked && allCheckboxes.length > 0;
}

function increaseQty(cartId) {
    const qtyInput = document.getElementById('qty-' + cartId);
    let qty = parseInt(qtyInput.value);
    qty++;
    qtyInput.value = qty;

    // Update to backend
    updateQuantity(cartId, qty);
}

function decreaseQty(cartId) {
    const qtyInput = document.getElementById('qty-' + cartId);
    let qty = parseInt(qtyInput.value);

    if (qty > 1) {
        qty--;
        qtyInput.value = qty;

        // Update to backend
        updateQuantity(cartId, qty);
    }
}

function updateQuantity(cartId, quantity) {
    // Update subtotal display immediately
    updateItemSubtotal(cartId, quantity);
    updateSummary();

    fetch('/cart/update', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'cartId=' + cartId + '&quantity=' + quantity
    })
    .then(response => {
        if (!response.ok) {
            alert('Gagal update quantity');
            location.reload();
        }
    });
}

function updateItemSubtotal(cartId, quantity) {
    const card = document.querySelector('[data-cart-id="' + cartId + '"]');
    const price = parseFloat(card.dataset.price);
    const subtotal = price * quantity;

    const subtotalEl = card.querySelector('.item-subtotal');
    subtotalEl.textContent = 'Rp ' + subtotal.toLocaleString('id-ID');
}

function deleteItem(cartId) {
    if (confirm('Yakin ingin menghapus item ini?')) {
        fetch('/cart/delete/' + cartId, {
            method: 'POST'
        })
        .then(response => {
            if (response.ok) {
                location.reload();
            }
        });
    }
}

function deleteSelected() {
    const checkboxes = document.querySelectorAll('.item-checkbox:checked');

    if (checkboxes.length === 0) {
        alert('Pilih item yang ingin dihapus');
        return;
    }

    if (confirm('Yakin ingin menghapus ' + checkboxes.length + ' item?')) {
        const cartIds = [];
        checkboxes.forEach(cb => {
            const card = cb.closest('.cart-card');
            cartIds.push(card.dataset.cartId);
        });

        fetch('/cart/delete-multiple', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(cartIds)
        })
        .then(response => {
            if (response.ok) {
                location.reload();
            }
        });
    }
}

// Checkout
function checkout() {
    const checkboxes = document.querySelectorAll('.item-checkbox:checked');

    if (checkboxes.length === 0) {
        alert('Pilih item yang ingin dibeli');
        return;
    }

    const cartIds = [];
    checkboxes.forEach(cb => {
        const card = cb.closest('.cart-card');
        cartIds.push(card.dataset.cartId);
    });

    // Redirect to checkout with selected items
    window.location.href = '/checkout?cartIds=' + cartIds.join(',');
}

// Initialize on page load
window.onload = function() {
    updateSummary();
};
</script>

</body>
</html>