<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="/css/navbar.css"/>
<nav class="navbar">
    <div class="navbar-container">
        <!-- Brand/Logo -->
        <a href="/" class="navbar-brand">MyShop</a>

        <ul class="navbar-menu">
            <li><a href="/">Home</a></li>
            <li><a href="/products">All Products</a></li>
            <li><a href="/admin/products">Dashboard</a></li>
        </ul>

        <div class="navbar-search">
            <input type="text" placeholder="Search products..." />
            <button type="button">🔍</button>
        </div>

        <c:if test="${empty sessionScope.username}">
            <div class="navbar-auth">
                <a href="/login" class="btn btn-login">Login</a>
                <a href="/register" class="btn btn-register">Register</a>
            </div>
        </c:if>


        <c:if test="${not empty sessionScope.username}">
            <div class="navbar-auth">
                <span style="color: white; font-weight: 500;">Hi, ${sessionScope.username}</span>
                <a href="/logout" class="btn btn-login">Logout</a>
            </div>
        </c:if>
    </div>
</nav>