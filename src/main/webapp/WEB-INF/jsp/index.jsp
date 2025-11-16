<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <link rel="stylesheet" href="/css/index.css"/>
</head>
<body>

<h1>Daftar Produk</h1>

<div class="product-grid">

    <c:forEach var="p" items="${products}">
        <div class="card">
            <h3>${p.name}</h3>
            <p>${p.description}</p>
            <p class="price">Rp ${p.price}</p>

            <div class="action">
                <a href="/products/${p.id}">Detail</a>
                <a href="/products/edit/${p.id}">Edit</a>
                <a href="/products/delete/${p.id}" style="color: red;">Delete</a>
            </div>
        </div>
    </c:forEach>

</div>

</body>
</html>
