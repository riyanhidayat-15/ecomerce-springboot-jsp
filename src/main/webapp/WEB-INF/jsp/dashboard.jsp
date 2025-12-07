<%--html--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Admin</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            color: #333;
        }

        .container {
            display: flex;
            min-height: 100vh;
            padding-top: 60px;
        }

        .sidebar {
            width: 220px;
            background: white;
            padding: 20px 0;
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .sidebar button {
            background: transparent;
            border: none;
            color: black;
            padding: 14px 20px;
            text-align: left;
            font-size: 15px;
            cursor: pointer;
            transition: 0.3s;
        }

        .sidebar button:hover {
            background: #272833;
            color: #fff;
        }

        .sidebar button.active {
            background: #4c7fff;
            color: white;
            font-weight: bold;
        }

        /* --- CONTENT AREA --- */
        .contents {
            flex: 1;
            padding: 25px;
        }

        .page {
            display: none;
            animation: fadeIn 0.2s ease;
        }

        .page.active {
            display: block;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(4px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>
<%@ include file="components/navbar.jsp" %>

    <div class="container">

        <div class="sidebar">
            <button data-target="analytics" class="active">Analitycs</button>
            <button data-target="products">Products</button>
            <button data-target="orders">Orders</button>
            <button data-target="reports">Reports</button>
            <button data-target="users">Users</button>
        </div>

        <div class="contents">

            <div id="analytics" class="page active">
                <%@ include file="components/analytics.jsp" %>
            </div>

            <div id="products" class="page">
                <%@ include file="components/products.jsp" %>
            </div>

            <div id="orders" class="page">
                <%@ include file="components/orders.jsp" %>
            </div>

            <div id="reports" class="page">
                <%@ include file="components/reports.jsp" %>
            </div>

            <div id="users" class="page">
                <%@ include file="components/users.jsp" %>
            </div>

        </div>
    </div>
    <footer class="footer">
                <p>&copy; 2025 Dashboard App. All rights reserved.</p>
            </footer>


<script>
    document.addEventListener("DOMContentLoaded", () => {
        const buttons = document.querySelectorAll(".sidebar button");
        const pages = document.querySelectorAll(".page");

        buttons.forEach(btn => {
            btn.addEventListener("click", () => {

                buttons.forEach(b => b.classList.remove("active"));
                btn.classList.add("active");

                const target = btn.dataset.target;
                pages.forEach(p => p.classList.remove("active"));
                document.getElementById(target).classList.add("active");
            });
        });
    });
</script>

</body>
</html>
