<%-- WEB-INF/jsp/components/sidebar.jsp --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- Font Awesome CDN --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

<div class="sidebar">
    <a href="${pageContext.request.contextPath}/admin/dashboard" class="${page == 'dashboard' ? 'active' : ''}">
        <i class="fas fa-chart-line"></i> Analytics
    </a>
    <a href="${pageContext.request.contextPath}/admin/products" class="${page == 'products' ? 'active' : ''}">
        <i class="fas fa-box-open"></i> Products
    </a>
    <a href="${pageContext.request.contextPath}/admin/orders" class="${page == 'orders' ? 'active' : ''}">
        <i class="fas fa-shopping-cart"></i> Orders
    </a>
    <a href="${pageContext.request.contextPath}/admin/reports" class="${page == 'reports' ? 'active' : ''}">
        <i class="fas fa-file-alt"></i> Reports
    </a>
    <a href="${pageContext.request.contextPath}/admin/users" class="${page == 'users' ? 'active' : ''}">
        <i class="fas fa-users"></i> Users
    </a>
</div>

<style>
    .sidebar {
        position: fixed;
        top: 0;
        left: 0;
        width: 220px;
        height: 100vh;
        background: white;
        margin-top: 80px;
        margin-left: 10px;
        padding: 20px 5px;
        display: flex;
        flex-direction: column;
        gap: 8px;
        box-shadow: 2px 0 10px rgba(0,0,0,0.1);
        z-index: 100;
        border-radius: 10px;
        transition: all 0.3s ease;
    }

    .sidebar a {
        display: flex;
        align-items: center;
        gap: 12px;
        text-decoration: none;
        color: #333;
        padding: 12px 20px;
        font-size: 15px;
        border-radius: 8px;
        transition: all 0.3s ease;
    }

    .sidebar a:hover {
        background: #4c7fff;
        color: #fff;
        transform: translateX(4px);
    }

    .sidebar a.active {
        background: #4c7fff;
        color: #fff;
        font-weight: bold;
    }

    .sidebar i {
        width: 20px;
        text-align: center;
    }
</style>
