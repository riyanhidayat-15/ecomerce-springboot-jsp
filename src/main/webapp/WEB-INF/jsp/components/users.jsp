<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="page" value="users" />

<%@ include file="/WEB-INF/jsp/components/sidebar.jsp" %>
<%@ include file="/WEB-INF/jsp/navbar.jsp" %>

<style>
body { font-family:'Segoe UI',sans-serif; background:#f4f6f9; padding-left:240px; padding-top:80px; }
.containerUsers{margin:0 auto;}
.header{background:#f59e0b;color:white;padding:2rem;border-radius:12px;margin-bottom:2rem;text-align:center;box-shadow:0 4px 12px rgba(0,0,0,0.1);}
.header h1{font-size:2rem;margin-bottom:.5rem;}
.header p{opacity:.9;font-size:1rem;}
.main-content{background:white;border-radius:12px;padding:1.5rem;box-shadow:0 2px 10px rgba(0,0,0,0.05);}
</style>

<div class="containerUsers">
    <header class="header">
        <h1>Users</h1>
        <p>Daftar pengguna dan manajemen akun.</p>
    </header>
    <main class="main-content">
        <p>Konten daftar users akan tampil di sini.</p>
    </main>
</div>
