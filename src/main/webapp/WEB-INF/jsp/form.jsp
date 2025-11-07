<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Form Input User</title>
<link rel="stylesheet" href="/css/style.css"></head>
<body>
    <h1>📝 Input Data User</h1>
    <form action="/save" method="post">
        <label>Nama:</label>
        <input type="text" name="name" placeholder="Masukkan nama" required>

        <label>Email:</label>
        <input type="email" name="email" placeholder="Masukkan email" required>

        <button type="submit">💾 Simpan Data</button>
    </form>

    <div class="link">
        <a href="/users">👀 Lihat Semua User</a>
    </div>
</body>
</html>