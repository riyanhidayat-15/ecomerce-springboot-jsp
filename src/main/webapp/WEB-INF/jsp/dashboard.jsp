<%--html--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Product</title>
    <link rel="stylesheet" href="/css/dashboard.css">
</head>
<body>
    <%@ include file="components/navbar.jsp" %>
    <div class="container">
        <main class="main-content">
            <section class="product-table">
                <div class="table-header">
                    <h2>Daftar Produk</h2>
                    <button class="btn-add" onclick="openModal('add')">+ Tambah Produk</button>

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
                                        <button class="btn-edit"
                                            data-id="${product.id}"
                                            data-name="${fn:escapeXml(product.name)}"
                                            data-price="${product.price}"
                                            data-stock="${product.stock}"
                                            data-desc="${fn:escapeXml(product.description)}"
                                            data-image="${product.imagePath}"
                                            onclick="openModal('edit', this)">Edit</button>
                                        <button class="btn-delete" onclick="confirmDelete(${product.id})">Hapus</button>
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

                <h3 id="modalTitle">Tambah Produk</h3>

                <form id="productForm" data-base="${pageContext.request.contextPath}" action="${pageContext.request.contextPath}/admin/products/add" method="post" enctype="multipart/form-data">
                   <input type="hidden" name="id" id="productId" />

                   <div class="form-group">
                       <input id="nameInput" type="text" name="name" placeholder="Nama Produk" />
                   </div>

                   <div class="form-group">
                       <input id="priceInput" type="number" name="price" placeholder="Harga" />
                   </div>

                   <div class="form-group">
                       <input id="stockInput" type="number" name="stock" placeholder="Stok" />
                   </div>

                   <div class="form-group">
                       <textarea id="descriptionInput" name="description" rows="3" placeholder="Deskripsi"></textarea>
                   </div>

                   <div class="form-group">
                       <input type="file" name="image" id="imageInput" accept="image/*" />
                   </div>

                   <div class="form-group" style="margin-top: 10px; text-align: center;">
                       <img id="previewImage" style="max-width: 280px; display: none; border-radius: 8px;" />
                   </div>

                    <button type="submit" class="btn-save">Simpan</button>
                </form>
            </div>
        </div>

        <form id="deleteForm" data-base="${pageContext.request.contextPath}" method="post" style="display: none;"></form>


        <footer class="footer">
            <p>&copy; 2025 Dashboard App. All rights reserved.</p>
        </footer>
    </div>

    <script src="/js/script.js"></script>
</body>
</html>