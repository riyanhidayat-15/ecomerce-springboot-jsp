<%--html--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="page" value="orders" />

    <style>
        /* Reset & Base */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f9;
            color: #333;
            line-height: 1.6;
            padding-left: 240px;
            padding-top: 80px;
        }

        .containerProduct {
            margin: 0 auto;
        }

        /* Header */
        .header {
            background: linear-gradient(135deg, #6366f1, #8b5cf6);
            color: white;
            padding: 2rem;
            border-radius: 12px;
            margin-bottom: 2rem;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .header h1 {
            font-size: 2.2rem;
            margin-bottom: 0.5rem;
        }

        .header p {
            opacity: 0.9;
            font-size: 1rem;
        }

        /* Main Content */
        .main-content {
            background: white;
            border-radius: 12px;
            padding: 1.5rem;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        /* Table Section */
        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .table-header h2 {
            font-size: 1.4rem;
            color: #1f2937;
        }

        .btn-add {
            background-color: #10b981;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            font-size: 0.9rem;
            cursor: pointer;
            transition: background 0.2s;
        }

        .btn-add:hover {
            background-color: #059669;
        }

        /* Table */
        .table-container {
            overflow-x: auto;
            border-radius: 8px;
            border: 1px solid #e5e7eb;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.95rem;
        }

        thead {
            background-color: #f8fafc;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
        }

        th {
            color: #374151;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 0.05em;
        }

        tbody tr {
            border-bottom: 1px solid #e5e7eb;
            transition: background 0.2s;
        }

        tbody tr:hover {
            background-color: #f9fafb;
        }

        .actions {
            display: flex;
            gap: 0.5rem;
        }

        .btn-edit, .btn-delete {
            padding: 0.4rem 0.8rem;
            font-size: 0.8rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.2s;
        }

        .image {
            object-fit: cover;
        }

        .btn-edit {
            background-color: #3b82f6;
            color: white;
        }

        .btn-edit:hover {
            background-color: #2563eb;
        }

        .btn-delete {
            background-color: #ef4444;
            color: white;
        }

        .btn-delete:hover {
            background-color: #dc2626;
        }

        /* Footer */
        .footer {
            text-align: center;
            margin-top: 3rem;
            color: #6b7280;
            font-size: 0.9rem;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .table-header {
                flex-direction: column;
                align-items: stretch;
                gap: 1rem;
            }

            .btn-add {
                width: 100%;
            }

            th, td {
                padding: 10px 8px;
                font-size: 0.85rem;
            }
        }

        /* Tombol */
        .btn-add {
            padding: 10px 15px;
            background: #333;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        /* Modal Background */
        .modal {
            display: none;
            position: fixed;
            z-index: 999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.45);
            justify-content: center;
            align-items: center;
        }

        /* Modal Box */
        .modal-content {
            background: white;
            padding: 20px;
            width: 380px;
            height: 460px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            animation: fadeIn 0.2s ease-in-out;
            overflow: auto;
        }

        /* Close Button */
        .close {
            float: right;
            font-size: 22px;
            cursor: pointer;
        }

        /* Input */
        .form-group {
            margin-bottom: 15px;
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .form-group input,
        .form-group textarea {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 15px;
            width: 100%;
            box-sizing: border-box;
        }



        input[type="file"] {
            padding: 6px;
            background: #fafafa;
            border: 1px dashed #bbb;
            cursor: pointer;
        }

        #previewImage {
            width: 100%;
            max-width: 350px;
            border-radius: 10px;
            margin-top: 10px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.15);
        }

        .actions {
            display: flex;
            flex-direction: column;
        }

        /* Save Button */
        .btn-save {
            width: 100%;
            padding: 10px;
            background: #333;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            margin-top: 10px;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
        }

    </style>
            <%@ include file="navbar.jsp" %>
    <div class="containerProduct">
            <%@ include file="../dashboard.jsp" %>

        <main class="main-content">
            <section class="product-table">
                <div class="table-header">
                    <h2>Daftar Pesanan</h2>
                </div>

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>No Order</th>
                                <th>Customer</th>
                                <th>Total Harga</th>
                                <th>Status</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${orders}">
                                <tr>
                                    <td>${order.orderNumber}</td>
                                    <td>${order.user.username}</td>
                                    <td>RP ${order.totalPrice}</td>
                                    <td>${order.status}</td>

                                    <td class="action">
                                        <c:choose>

                                            <c:when test="${order.status == 'DIKEMAS'}">
                                                <form action="/admin/orders/${order.id}/kirim" method="post">
                                                    <input type="hidden" name="status" value="DIKIRIM">
                                                    <button type="submit" class="btn-edit">Kirim</button>
                                                </form>
                                            </c:when>

                                            <c:when test="${order.status == 'DIKIRIM'}">
                                                <span style="color: gray;">Sedang Dikirim</span>
                                            </c:when>

                                            <c:when test="${order.status == 'SELESAI'}">
                                                <span style="color: green;">Selesai</span>
                                            </c:when>

                                        </c:choose>
                                    </td>

                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </section>
        </main>
    </div>

    <script src="/js/script.js"></script>