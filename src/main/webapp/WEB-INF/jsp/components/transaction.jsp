<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="page" value="analytics"/>

<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background: #f4f6f9;
        padding-left: 240px;
        padding-top: 80px;
    }

    .dashboard-container {
        max-width: 1200px;
        margin: auto;
    }

    .dashboard-header {
        background: linear-gradient(135deg, #6366f1, #8b5cf6);
        color: white;
        padding: 2rem;
        border-radius: 12px;
        margin-bottom: 2rem;
    }

    .card {
        background: white;
        padding: 1.5rem;
        border-radius: 12px;
        box-shadow: 0 2px 10px rgba(0,0,0,.08);
    }
</style>

<%@ include file="navbar.jsp" %>
<%@ include file="../dashboard.jsp" %>

<div class="dashboard-container">
    <div class="dashboard-header">
        <h1>Transaksi</h1>
        <p>Daftar transaksi terbaru.</p>
    </div>

    <div class="card">
        <table style="width:100%;border-collapse:collapse;font-size:0.95rem;">
            <thead>
                <tr style="background:#f3f4f6;text-align:left;">
                    <th style="padding:12px;border-bottom:1px solid #e5e7eb">#</th>
                    <th style="padding:12px;border-bottom:1px solid #e5e7eb">Order No.</th>
                    <th style="padding:12px;border-bottom:1px solid #e5e7eb">User</th>
                    <th style="padding:12px;border-bottom:1px solid #e5e7eb">Total</th>
                    <th style="padding:12px;border-bottom:1px solid #e5e7eb">Status</th>
                    <th style="padding:12px;border-bottom:1px solid #e5e7eb">Tanggal</th>
                    <th style="padding:12px;border-bottom:1px solid #e5e7eb">Aksi</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td style="padding:12px;border-bottom:1px solid #f1f5f9">${order.id}</td>
                        <td style="padding:12px;border-bottom:1px solid #f1f5f9">${order.orderNumber}</td>
                        <td style="padding:12px;border-bottom:1px solid #f1f5f9">${order.user.username}</td>
                        <td style="padding:12px;border-bottom:1px solid #f1f5f9">Rp ${order.totalPrice}</td>
                        <td style="padding:12px;border-bottom:1px solid #f1f5f9">${order.status}</td>
                        <td style="padding:12px;border-bottom:1px solid #f1f5f9">${order.createdAt}</td>
                        <td style="padding:12px;border-bottom:1px solid #f1f5f9"><a href="${pageContext.request.contextPath}/admin/orders/${order.id}" style="text-decoration:none;color:#4c7fff">Detail</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    const labels = ${labels};
    const data = ${data};

    console.log(labels, data);

    new Chart(document.getElementById('salesChart'), {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: 'Total Penjualan',
                data: data,
                borderWidth: 3,
                tension: 0.4,
                fill: true
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: { position: 'top' },
                title: {
                    display: true,
                    text: 'Penjualan per Bulan'
                }
            }
        }
    });
</script>


