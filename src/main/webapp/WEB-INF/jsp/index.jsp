<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TechNova Computers - Sparepart Komputer Terlengkap & Terpercaya</title>
    <link rel="stylesheet" href="/css/navbar.css"> <!-- Navbar yang udah kita bikin -->
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; line-height: 1.6; color: #333; background-color: #f8f9fa; }
        a { text-decoration: none; color: inherit; }

        .hero {
            background: linear-gradient(135deg, #2563eb, #1e40af);
            padding: 118px 20px;
            color: white;
            margin-top: 70px;
        }

        .hero-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 80px;
        }

        .hero-text {
            flex: 1;
            width: 60%;
            margin-left:70px;
        }

        .hero-text h1 {
            font-size: 3rem;
            line-height: 1.2;
            margin-bottom: 20px;
        }

        .hero-text h1 span {
            color: #facc15;
        }

        .hero-text p {
            font-size: 1.1rem;
            opacity: 0.95;
            margin-bottom: 30px;
        }

        .btn-primary {
            display: inline-block;
            padding: 14px 28px;
            background: white;
            color: #2563eb;
            border-radius: 30px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.25);
        }

        .hero-image {
            flex: 1;
            text-align: center;
        }

        .hero-image img {
            width: 100%;
            max-width: 420px;
            animation: float 4s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-12px); }
        }

        /* Sections */
        .section {
            padding: 80px 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
        .section-title {
            text-align: center;
            font-size: 36px;
            margin-bottom: 50px;
            color: #007BFF;
            position: relative;
        }
        .section-title::after {
            content: '';
            width: 80px;
            height: 4px;
            background-color: #007BFF;
            display: block;
            margin: 15px auto 0;
        }

        /* Categories */
        .categories {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
        }
        .category-card {
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            text-align: center;
            padding: 30px 20px;
        }
        .category-card:hover {
            transform: translateY(-10px);
        }
        .category-card i {
            font-size: 50px;
            color: #007BFF;
            margin-bottom: 20px;
        }
        .category-card h3 {
            font-size: 22px;
            margin-bottom: 10px;
        }

        /* Advantages */
        .advantages {
            background-color: #007BFF;
            color: white;
        }
        .adv-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 40px;
            text-align: center;
        }
        .adv-item i {
            font-size: 40px;
            margin-bottom: 20px;
        }
        .adv-item h3 {
            font-size: 22px;
            margin-bottom: 15px;
        }

        /* Products Grid (contoh static, nanti bisa lo ganti JSTL loop) */
        .products {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
        }
        .product-card {
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }
        .product-img {
            height: 200px;
            background: #e9ecef;
            background-size: cover;
            background-position: center;
        }
        .product-info {
            padding: 20px;
        }
        .product-info h3 {
            font-size: 18px;
            margin-bottom: 10px;
        }
        .price {
            font-size: 22px;
            font-weight: 700;
            color: #007BFF;
            margin-bottom: 15px;
        }

        /* Footer */
        footer {
            background-color: #003D80;
            color: white;
            padding: 50px 20px 20px;
            text-align: center;
        }
        .footer-links {
            margin-bottom: 30px;
        }
        .footer-links a {
            color: #e6f0ff;
            margin: 0 15px;
            transition: color 0.3s;
        }
        .footer-links a:hover {
            color: white;
        }

        @media (max-width: 768px) {
            .hero h1 { font-size: 36px; }
            .hero p { font-size: 18px; }
            .section-title { font-size: 30px; }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
        <%@ include file="components/navbar.jsp" %>
    <section class="hero">
        <div class="hero-container">

            <div class="hero-text">
                <h1>Selamat Datang di <span>TechNova Computers</span></h1>
                <p>
                    Sparepart komputer original, lengkap, bergaransi,
                    dengan harga terbaik di Indonesia
                </p>
                <a href="/products" class="btn-primary">Lihat Semua Produk</a>
            </div>

            <div class="hero-image">
                <img src="/images/home.png" alt="TechNova Computers">
            </div>

        </div>
    </section>

    <section class="section">
        <h2 class="section-title">Kategori Populer</h2>
        <div class="categories">
            <a href="/products?category=processor" class="category-card">
                <i class="fas fa-microchip"></i>
                <h3>Processor</h3>
                <p>Intel & AMD Terbaru</p>
            </a>
            <a href="/products?category=motherboard" class="category-card">
                <i class="fas fa-memory"></i>
                <h3>Motherboard</h3>
                <p>ASUS, Gigabyte, MSI</p>
            </a>
            <a href="/products?category=ram" class="category-card">
                <i class="fas fa-server"></i>
                <h3>RAM</h3>
                <p>DDR4 & DDR5</p>
            </a>
            <a href="/products?category=vga" class="category-card">
                <i class="fas fa-desktop"></i>
                <h3>VGA Card</h3>
                <p>NVIDIA & AMD</p>
            </a>
        </div>
    </section>

    <!-- Advantages -->
    <section class="section advantages">
        <h2 class="section-title">Kenapa Belanja di TechNova?</h2>
        <div class="adv-grid">
            <div class="adv-item">
                <i class="fas fa-shipping-fast"></i>
                <h3>Pengiriman Cepat</h3>
                <p>Seluruh Indonesia, same day untuk Jabodetabek</p>
            </div>
            <div class="adv-item">
                <i class="fas fa-shield-alt"></i>
                <h3>Garansi Resmi</h3>
                <p>Produk original dengan garansi distributor</p>
            </div>
            <div class="adv-item">
                <i class="fas fa-headset"></i>
                <h3>Support 24/7</h3>
                <p>Konsultasi teknis gratis kapan saja</p>
            </div>
            <div class="adv-item">
                <i class="fas fa-tag"></i>
                <h3>Harga Kompetitif</h3>
                <p>Langsung dari distributor, tanpa perantara</p>
            </div>
        </div>
    </section>

    <!-- Produk Terbaru / Best Seller (contoh static) -->
    <section class="section">
        <h2 class="section-title">Produk Terlaris</h2>
        <div class="products">
            <div class="product-card">
                <div class="product-img" style="background-image: url('https://images.unsplash.com/photo-1591799264318-7e6ef980f1e4?ixlib=rb-4.0.3&auto=format&fit=crop&q=80');"></div>
                <div class="product-info">
                    <h3>Intel Core i9-13900K</h3>
                    <div class="price">Rp 9.850.000</div>
                    <a href="#" class="btn-primary" style="font-size:14px; padding:10px 20px;">Lihat Detail</a>
                </div>
            </div>
            <div class="product-card">
                <div class="product-img" style="background-image: url('https://images.unsplash.com/photo-1587202372616-b43abea06c2a?ixlib=rb-4.0.3&auto=format&fit=crop&q=80');"></div>
                <div class="product-info">
                    <h3>RTX 4090 ASUS ROG</h3>
                    <div class="price">Rp 32.500.000</div>
                    <a href="#" class="btn-primary" style="font-size:14px; padding:10px 20px;">Lihat Detail</a>
                </div>
            </div>
            <div class="product-card">
                <div class="product-img" style="background-image: url('https://images.unsplash.com/photo-1546868871-7041f2a55e12?ixlib=rb-4.0.3&auto=format&fit=crop&q=80');"></div>
                <div class="product-info">
                    <h3>SSD NVMe 2TB Samsung 990 PRO</h3>
                    <div class="price">Rp 3.250.000</div>
                    <a href="#" class="btn-primary" style="font-size:14px; padding:10px 20px;">Lihat Detail</a>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="footer-links">
            <a href="/">Beranda</a>
            <a href="/products">Produk</a>
            <a href="/about">Tentang Kami</a>
            <a href="/contact">Kontak</a>
        </div>
        <p>&copy; 2025 TechNova Computers. All rights reserved.</p>
    </footer>
</body>
</html>