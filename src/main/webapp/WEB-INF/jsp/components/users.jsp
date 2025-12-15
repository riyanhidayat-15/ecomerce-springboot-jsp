<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="page" value="users" />

<%@ include file="../dashboard.jsp" %>
<%@ include file="navbar.jsp" %>

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
        <c:if test="${not empty error}">
            <div style="color:#b91c1c;margin-bottom:12px">${error}</div>
        </c:if>

        <c:if test="${empty users}">
            <p>Tidak ada pengguna.</p>
        </c:if>

        <c:if test="${not empty users}">
            <div style="overflow-x:auto;">
                <table style="width:100%;border-collapse:collapse;font-size:0.95rem;">
                    <thead>
                        <tr style="background:#f3f4f6;text-align:left;">
                            <th style="padding:12px;border-bottom:1px solid #e5e7eb">ID</th>
                            <th style="padding:12px;border-bottom:1px solid #e5e7eb">Username</th>
                            <th style="padding:12px;border-bottom:1px solid #e5e7eb">Email</th>
                            <th style="padding:12px;border-bottom:1px solid #e5e7eb">Telepon</th>
                            <th style="padding:12px;border-bottom:1px solid #e5e7eb">Alamat</th>
                            <th style="padding:12px;border-bottom:1px solid #e5e7eb">Role</th>
                            <th style="padding:12px;border-bottom:1px solid #e5e7eb">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td style="padding:12px;border-bottom:1px solid #f1f5f9">${user.id}</td>
                                <td style="padding:12px;border-bottom:1px solid #f1f5f9">${user.username}</td>
                                <td style="padding:12px;border-bottom:1px solid #f1f5f9">${user.email}</td>
                                <td style="padding:12px;border-bottom:1px solid #f1f5f9">${user.telepon}</td>
                                <td style="padding:12px;border-bottom:1px solid #f1f5f9">${user.address}</td>
                                <td style="padding:12px;border-bottom:1px solid #f1f5f9">${user.role}</td>
                                <td style="padding:12px;border-bottom:1px solid #f1f5f9">
                                    <a href="${pageContext.request.contextPath}/admin/users/${user.id}/edit" style="margin-right:8px;padding:6px 10px;background:#4c7fff;color:#fff;border-radius:6px;text-decoration:none;">Edit</a>

                                    <form method="post" action="${pageContext.request.contextPath}/admin/users/${user.id}/delete" style="display:inline" onsubmit="return confirm('Hapus user ini?');">
                                        <button type="submit" style="padding:6px 10px;background:#ef4444;color:#fff;border:none;border-radius:6px;cursor:pointer;">Hapus</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
    </main>
</div>
