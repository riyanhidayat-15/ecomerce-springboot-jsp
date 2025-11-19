<%--html--%>
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
                                <th>Gambar</th>
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
                                    <td><img class='image' src="${product.imagePath}" alt="${product.name}" width="50" height="50" /></td>
                                    <td>${product.name}</td>
                                    <td>${product.description}</td>
                                    <td>Rp ${product.price}</td>
                                    <td>${product.stock}</td>

                                    <td class="action">
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

                <form action="${pageContext.request.contextPath}/admin/products/add" method="post" enctype="multipart/form-data">
                   <div class="form-group">
                       <input type="text" name="name" placeholder="Nama Produk" required />
                   </div>

                   <div class="form-group">
                       <input type="number" name="price" placeholder="Harga" required />
                   </div>

                   <div class="form-group">
                       <input type="number" name="stock" placeholder="Stok" required />
                   </div>

                   <div class="form-group">
                       <textarea name="description" rows="3" placeholder="Deskripsi"></textarea>
                   </div>

                   <div class="form-group">
                       <input type="file" name="image" id="imageInput" accept="image/*" required />
                   </div>

                   <div class="form-group" style="margin-top: 10px; text-align: center;">
                       <img id="previewImage" style="max-width: 280px; display: none; border-radius: 8px;" />
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