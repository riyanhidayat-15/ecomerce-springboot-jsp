<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- STYLE KHUSUS ANALYTICS -->
<style>
    .analytics-wrapper {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
        margin-top: 20px;
    }

    .analytics-card {
        background: white;
        padding: 20px;
        border-radius: 12px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        text-align: center;
        border: 1px solid #eaeaea;
    }

    .analytics-card h3 {
        font-size: 18px;
        color: #555;
        margin-bottom: 8px;
    }

    .analytics-card .value {
        font-size: 28px;
        font-weight: bold;
        color: #4c7fff;
    }
</style>

<!-- ISI DASHBOARD ANALYTICS -->
<div class="analytics-wrapper">
    <div class="analytics-card">
        <h3>Total Produk</h3>
        <div class="value">120</div>
    </div>

    <div class="analytics-card">
        <h3>Pesanan Hari Ini</h3>
        <div class="value">18</div>
    </div>

    <div class="analytics-card">
        <h3>Total User</h3>
        <div class="value">340</div>
    </div>
</div>
