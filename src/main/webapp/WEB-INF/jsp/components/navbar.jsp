<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="/css/navbar.css"/>
<nav class="navbar">
    <div class="navbar-container">
        <a href="/" class="navbar-brand">🛍️ Jualin.com</a>

        <ul class="navbar-menu">
            <li><a href="/">Beranda</a></li>
            <li><a href="/products">Semua Produk</a></li>
        </ul>

        <div class="navbar-search">
            <form action="/products/search" method="get" style="display: flex; width: 100%;">
                <input type="text" name="keyword" placeholder="Cari produk..." />
                <button type="submit">🔍</button>
            </form>
        </div>

        <c:choose>
            <c:when test="${not empty sessionScope.username}">
                <div class="navbar-auth">
                    <button id="profileButton" class="profileButton">
                        <span style="color: white; font-weight: 500;">${sessionScope.username}</span>
                    </button>
                    <div id="dropdownMenu" class="dropdownMenu hidden">
                        <c:if test="${not empty sessionScope.username}">
                            <a href="/cart">Keranjang</a>
                            <a href="/my-orders"> Pesanan saya</a>
                            <c:if test="${sessionScope.role == 'ADMIN'}">
                                <a href="/admin/products">Dashboard</a>
                            </c:if>
                            <a href="/logout" class=" btn-login">Logout</a>
                        </c:if>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="navbar-auth">
                    <a href="/login" class="btn btn-login">Login</a>
                    <a href="/register" class="btn btn-register">Register</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</nav>

<script>
    const btn = document.getElementById("profileButton");
    const menu = document.getElementById("dropdownMenu");

    btn.onclick = () => {
      menu.classList.toggle("show");
    };
</script>