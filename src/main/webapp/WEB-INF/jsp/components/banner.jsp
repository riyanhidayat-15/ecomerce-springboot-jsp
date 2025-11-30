<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Test Carousel</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            html {

                scroll-padding-top: 200px
            }

            body {
                font-family: Arial, sans-serif;

            }

            .carousel {
                margin-top: 5rem;
                display: flex;
                overflow-x: auto;
                scroll-snap-type: x mandatory;
                scroll-behavior: smooth;
                width: 100%;
                -ms-overflow-style: none;
                scrollbar-width: none;
            }

            .carousel::-webkit-scrollbar {
                display: none;
            }

            .carousel-item {
                min-width: 100%;
                flex-shrink: 0;
                scroll-snap-align: start;
                position: relative;
            }

            .carousel-item img {
                width: 100%;
                height:200px;
                object-fit: cover;
                display: block;
            }

            .btn-circle {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                background: rgba(255, 255, 255, 0.8);
                display: flex;
                align-items: center;
                justify-content: center;
                text-decoration: none;
                color: #000;
                font-size: 20px;
                border: none;
                cursor: pointer;
            }

            .btn-circle:hover {
                background: rgba(255, 255, 255, 1);
            }

            .nav-buttons {
                position: absolute;
                left: 20px;
                right: 20px;
                top: 50%;
                transform: translateY(-50%);
                display: flex;
                justify-content: space-between;
                z-index: 10;
            }
        </style>
    </head>
    <body>
        <div class="carousel">
            <div id="slide1" class="carousel-item">
                <img
                    src="/images/banner1.png"
                    alt="Banner 1"
                />
                <div class="nav-buttons">
                    <a href="#slide3" class="btn-circle">❮</a>
                    <a href="#slide2" class="btn-circle">❯</a>
                </div>
            </div>

            <div id="slide2" class="carousel-item">
                <img
                    src="/images/banner2.png"
                    alt="Banner 2"
                />
                <div class="nav-buttons">
                    <a href="#slide1" class="btn-circle">❮</a>
                    <a href="#slide3" class="btn-circle">❯</a>
                </div>
            </div>

            <div id="slide3" class="carousel-item">
                <img
                    src="/images/banner3.png"
                    alt="Banner 3"
                />
                <div class="nav-buttons">
                    <a href="#slide2" class="btn-circle">❮</a>
                    <a href="#slide1" class="btn-circle">❯</a>
                </div>
            </div>
        </div>
        <script>
            const carousel = document.querySelector('.carousel');
            const slides = document.querySelectorAll('.carousel-item');
            let currentSlide = 0;

            setInterval(() => {
                currentSlide = (currentSlide + 1) % slides.length;
                carousel.scrollTo({
                    left: slides[currentSlide].offsetLeft,
                    behavior: 'smooth'
                });
            }, 3000);
        </script>
    </body>
</html>
