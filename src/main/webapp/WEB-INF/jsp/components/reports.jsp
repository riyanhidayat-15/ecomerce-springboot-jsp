<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="page" value="reports" />

<%@ include file="/WEB-INF/jsp/components/sidebar.jsp" %>
<%@ include file="/WEB-INF/jsp/navbar.jsp" %>

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
        <p>Konten laporan bisa ditambahkan di sini.</p>
    </main>
</div>
