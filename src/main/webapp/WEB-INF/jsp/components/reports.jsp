<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="page" value="dashboard" />

<%@ include file="../dashboard.jsp" %>
<%@ include file="navbar.jsp" %>

<style>
body { font-family:'Segoe UI',sans-serif; background:#f4f6f9; padding-left:240px; padding-top:80px; }
.containerReports{margin:0 auto;}
.header{background:#10b981;color:white;padding:2rem;border-radius:12px;margin-bottom:2rem;text-align:center;box-shadow:0 4px 12px rgba(0,0,0,0.1);}
.header h1{font-size:2rem;margin-bottom:.5rem;}
.header p{opacity:.9;font-size:1rem;}
.main-content{background:white;border-radius:12px;padding:1.5rem;box-shadow:0 2px 10px rgba(0,0,0,0.05);}
</style>

<div class="containerReports">
    <header class="header">
        <h1>Reports</h1>
        <p>Halaman laporan dan ringkasan data.</p>
    </header>
    <main class="main-content">
        <div style="display:flex;gap:20px;align-items:flex-start;flex-wrap:wrap">
            <div style="width:100%;display:flex;gap:12px;margin-bottom:16px;flex-wrap:wrap">
                <div style="background:#fff;padding:12px;border-radius:10px;box-shadow:0 2px 8px rgba(0,0,0,0.06);min-width:180px;flex:1">
                    <div style="font-size:12px;color:#6b7280">Jumlah Transaksi</div>
                    <div style="font-size:20px;font-weight:700">${summary.totalTransactions}</div>
                </div>
                <div style="background:#fff;padding:12px;border-radius:10px;box-shadow:0 2px 8px rgba(0,0,0,0.06);min-width:180px;flex:1">
                    <div style="font-size:12px;color:#6b7280">Total Pendapatan</div>
                    <div style="font-size:20px;font-weight:700">Rp ${summary.totalRevenue}</div>
                </div>
                <div style="background:#fff;padding:12px;border-radius:10px;box-shadow:0 2px 8px rgba(0,0,0,0.06);min-width:180px;flex:1">
                    <div style="font-size:12px;color:#6b7280">Rata-rata Nilai Order</div>
                    <div style="font-size:20px;font-weight:700">Rp ${summary.avgOrderValue}</div>
                </div>
            </div>
            <div style="flex:2;min-width:360px;">
                <h3>Penjualan per Bulan</h3>
                <canvas id="salesChart"></canvas>
            </div>

            <div style="flex:1;min-width:280px;">
                <h3>Ringkasan Bulanan</h3>
                <table style="width:100%;border-collapse:collapse;font-size:0.95rem;">
                    <thead>
                        <tr style="background:#f3f4f6;text-align:left;">
                            <th style="padding:8px;border-bottom:1px solid #e5e7eb">Bulan</th>
                            <th style="padding:8px;border-bottom:1px solid #e5e7eb">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="row" items="${monthlyRows}">
                            <tr>
                                <td style="padding:8px;border-bottom:1px solid #f1f5f9">${row.month}</td>
                                <td style="padding:8px;border-bottom:1px solid #f1f5f9">${row.total}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <c:if test="${not empty summary.countsByStatus}">
                    <h4 style="margin-top:12px">Status Pesanan</h4>
                    <table style="width:100%;border-collapse:collapse;font-size:0.95rem;">
                        <thead>
                            <tr style="background:#f3f4f6;text-align:left;">
                                <th style="padding:8px;border-bottom:1px solid #e5e7eb">Status</th>
                                <th style="padding:8px;border-bottom:1px solid #e5e7eb">Jumlah</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="entry" items="${summary.countsByStatus}">
                                <tr>
                                    <td style="padding:8px;border-bottom:1px solid #f1f5f9">${entry.key}</td>
                                    <td style="padding:8px;border-bottom:1px solid #f1f5f9">${entry.value}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        const labels = ${labels};
        const data = ${data};

        new Chart(document.getElementById('salesChart'), {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Total Penjualan',
                    data: data,
                    backgroundColor: 'rgba(60,130,255,0.7)'
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { position: 'top' },
                    title: { display: true, text: 'Penjualan per Bulan' }
                }
            }
        });
    </script>
</div>
