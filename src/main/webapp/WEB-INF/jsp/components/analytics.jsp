<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="page" value="dashboard"/>

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

        <h1>Analytics Dashboard</h1>
        <p>Ringkasan penjualan berdasarkan data real</p>
    </div>

    <div class="card">
        <canvas id="salesChart"></canvas>
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


