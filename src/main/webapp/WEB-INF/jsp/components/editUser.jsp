<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="page" value="users" />

<%@ include file="../dashboard.jsp" %>
<%@ include file="navbar.jsp" %>

<style>
    body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;background-color: #f4f6f9;color: #333;line-height: 1.6; }
.main-content { background:white;border-radius:12px;padding:1.5rem;box-shadow:0 2px 10px rgba(0,0,0,0.05); }
.form-row { display:flex; gap:12px; margin-bottom:12px; }
.form-row > div { flex:1 }
label { display:block; font-weight:600; margin-bottom:6px }
input, select, textarea { width:100%; padding:8px; border:1px solid #e5e7eb; border-radius:6px }
.btn { padding:10px 14px; border-radius:8px; border:none; cursor:pointer }
.btn-primary{ background:#4c7fff; color:#fff }
.btn-secondary{ background:#e5e7eb; color:#333 }
</style>

<div style="padding-left:240px; padding-top:80px;">
    <main class="main-content">
        <h2>Edit User</h2>
        <c:if test="${not empty error}">
            <div style="color:#b91c1c;margin-bottom:12px">${error}</div>
        </c:if>

        <form method="post" action="${pageContext.request.contextPath}/admin/users/${user.id}/update">
            <div class="form-row">
                <div>
                    <label>Username</label>
                    <input type="text" name="username" value="${user.username}" required />
                </div>
                <div>
                    <label>Email</label>
                    <input type="email" name="email" value="${user.email}" required />
                </div>
            </div>

            <div class="form-row">
                <div>
                    <label>Telepon</label>
                    <input type="text" name="telepon" value="${user.telepon}" />
                </div>
                <div>
                    <label>Alamat</label>
                    <input type="text" name="address" value="${user.address}" />
                </div>
            </div>

            <div style="margin-bottom:12px">
                <label>Role</label>
                <select name="role">
                    <option value="USER" ${user.role == 'USER' ? 'selected' : ''}>USER</option>
                    <option value="ADMIN" ${user.role == 'ADMIN' ? 'selected' : ''}>ADMIN</option>
                </select>
            </div>

            <div style="display:flex;gap:8px">
                <button class="btn btn-primary" type="submit">Simpan</button>
                <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-secondary" style="display:inline-block;text-decoration:none;padding:10px 14px;">Batal</a>
            </div>
        </form>
    </main>
</div>
