<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Product</title>
    <link rel="stylesheet" href="/css/dashboard.css">
</head>
<body>
    <div class="container">
        <header class="header">
            <h1>Dashboard</h1>
            <p>Manajemen Produk</p>
        </header>

        <main class="main-content">
            <section class="product-table">
                <div class="table-header">
                    <h2>Daftar Produk</h2>
                    <button class="btn-add" onclick="openModal()">+ Tambah Produk</button>

                </div>

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nama Produk</th>
                                <th>Description</th>
                                <th>Harga</th>
                                <th>Stok</th>

                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="product" items="${products}">
                                <tr>
                                    <td>${product.id}</td>
                                    <td>${product.name}</td>
                                    <td>${product.description}</td>
                                    <td>Rp ${product.price}</td>
                                    <td>${product.stock}</td>

                                    <td class="actions">
                                        <button class="btn-edit">Edit</button>
                                        <button class="btn-delete">Hapus</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </section>
        </main>
        <div id="productModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>

                <h3>Tambah Produk</h3>

                <form action="${pageContext.request.contextPath}/admin/products/add" method="post">
                    <div class="form-group">
                        <label>Nama Produk</label>
                        <input type="text" name="name" required />
                    </div>

                    <div class="form-group">
                        <label>Harga</label>
                        <input type="number" name="price" required />
                    </div>

                    <div class="form-group">
                        <label>Stok</label>
                        <input type="number" name="stock" required />
                    </div>

                    <div class="form-group">
                        <label>Deskripsi</label>
                        <textarea name="description" rows="3"></textarea>
                    </div>

                    <button type="submit" class="btn-save">Simpan</button>
                </form>
            </div>
        </div>


        <footer class="footer">
            <p>&copy; 2025 Dashboard App. All rights reserved.</p>
        </footer>
    </div>

    <script src="/js/script.js"></script>
</body>
</html>