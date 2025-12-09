<%--html--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="page" value="dashboard" />

<style>
    /* Reset & Base */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f4f6f9;
        color: #333;
        line-height: 1.6;
        padding-left: 240px;
        padding-top: 80px;
    }

    .containerAnalytics {
        margin: 0 auto;
    }

    .header {
        background: linear-gradient(135deg, #6366f1, #8b5cf6);
        color: white;
        padding: 2rem;
        border-radius: 12px;
        margin-bottom: 2rem;
        text-align: center;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    .header h1 {
        font-size: 2.2rem;
        margin-bottom: 0.5rem;
    }

    .header p {
        opacity: 0.9;
        font-size: 1rem;
    }

    .main-content {
        background: white;
        border-radius: 12px;
        padding: 1.5rem;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }

    .chart-container {
        max-width: 700px;
        margin: 0 auto;
    }
</style>

<%@ include file="navbar.jsp" %>
<%@ include file="../dashboard.jsp" %>

<div class="containerAnalytics">
    <header class="header">
        <h1>Analytics Dashboard</h1>
        <p>Ringkasan performa dan data penjualan</p>
    </header>

    <main class="main-content">
        <div class="chart-container">
            <canvas id="salesChart"></canvas>
        </div>
    </main>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    const ctx = document.getElementById('salesChart').getContext('2d');
    const salesChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun'],
            datasets: [{
                label: 'Penjualan',
                data: [120, 150, 100, 180, 90, 200],
                backgroundColor: 'rgba(76, 127, 255, 0.2)',
                borderColor: '#4c7fff',
                borderWidth: 2,
                tension: 0.4,
                fill: true
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: true,
                    position: 'top'
                },
                title: {
                    display: true,
                    text: 'Grafik Penjualan 6 Bulan Terakhir'
                }
            },
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
