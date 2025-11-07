<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Daftar User</title>
    <link rel="stylesheet" href="/css/result.css"/>
</head>
<body>
    <h1>📋 Daftar User</h1>

    <div class="success">✅ Data berhasil disimpan!</div>

    <c:choose>
        <c:when test="${not empty users}">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nama</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.name}</td>
                            <td>${user.email}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <div class="empty">Belum ada data user</div>
        </c:otherwise>
    </c:choose>

    <div class="link">
        <a href="/add-user">➕ Tambah User Baru</a>
    </div>
</body>
</html>