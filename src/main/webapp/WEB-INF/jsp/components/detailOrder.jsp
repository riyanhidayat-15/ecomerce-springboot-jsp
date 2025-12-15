<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="page" value="orders" />

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f4f6f9;
        color: #333;
        padding-left: 240px;
        padding-top: 80px;
    }

    .containerProduct {
        margin: 0 auto;
    }

    .main-content {
        background: white;
        border-radius: 12px;
        padding: 1.5rem;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }

    .header {
        margin-bottom: 1.5rem;
    }

    .header h2 {
        font-size: 1.6rem;
        margin-bottom: 5px;
    }

    .header p {
        color: #6b7280;
        font-size: 0.9rem;
    }

    .info-box {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 1rem;
        margin-bottom: 1.5rem;
    }

    .info-card {
        background: #f9fafb;
        border-radius: 8px;
        padding: 12px;
        border: 1px solid #e5e7eb;
    }

    .info-card span {
        display: block;
        font-size: 0.8rem;
        color: #6b7280;
    }

    .info-card strong {
        font-size: 1rem;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        font-size: 0.95rem;
    }

    thead {
        background-color: #f8fafc;
    }

    th, td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #e5e7eb;
    }

    th {
        text-transform: uppercase;
        font-size: 0.8rem;
        color: #374151;
    }

    tfoot td {
        font-weight: bold;
    }

    .btn-back {
        display: inline-block;
        margin-top: 20px;
        padding: 8px 14px;
        background: #333;
        color: white;
        border-radius: 6px;
        text-decoration: none;
        font-size: 0.9rem;
    }

    .btn-back:hover {
        background: #111;
    }

    .btn-edit {
                padding: 0.4rem 0.8rem;
                font-size: 0.8rem;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: all 0.2s;
                color: white;
                background: #2563eb;
    }
</style>

<%@ include file="navbar.jsp" %>

<div class="containerProduct">
    <%@ include file="../dashboard.jsp" %>

    <main class="main-content">

        <!-- HEADER -->
        <div class="header">
            <h2>Detail Pesanan</h2>
            <p>Informasi lengkap pesanan customer</p>
        </div>

        <!-- INFO ORDER -->
        <div class="info-box">
            <div class="info-card">
                <span>No Order</span>
                <strong>${order.orderNumber}</strong>
            </div>
            <div class="info-card">
                <span>Customer</span>
                <strong>${order.user.username}</strong>
            </div>
            <div class="info-card">
                <span>Status</span>
                <strong>${order.status}</strong>
            </div>
        </div>

        <!-- TABLE ITEM -->
        <table>
            <thead>
                <tr>
                    <th>Gambar</th>
                    <th>Produk</th>
                    <th>Qty</th>
                    <th>Harga</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${order.orderItems}">
                    <tr>
                        <td><img src="${item.product.imagePath}" width="40"/></td>
                        <td>${item.product.name}</td>
                        <td>${item.quantity}</td>
                        <td>Rp ${item.priceAtOrder}</td>
                        <td>Rp ${item.priceAtOrder * item.quantity}</td>

                    </tr>
                </c:forEach>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="3">Total</td>
                    <td>Rp ${order.totalPrice}</td>
                    <td class="action">
                                            <c:if test="${order.status == 'DIKEMAS'}">
                                                 <form action="/admin/orders/${order.id}/kirim" method="post" style="margin-top:6px;">
                                                     <button type="submit" class="btn-edit">Kirim</button>
                                                 </form>
                                            </c:if>

                                            <c:if test="${order.status == 'DIKIRIM'}">
                                                  <span style="color: gray;">Sedang Dikirim</span>
                                            </c:if>
                                            </td>
                </tr>
            </tfoot>
        </table>

        <a href="/admin/orders" class="btn-back">← Kembali</a>
    </main>
</div>
