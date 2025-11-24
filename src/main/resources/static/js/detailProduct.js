const quantityInput = document.getElementById('quantity');
        const decreaseBtn = document.getElementById('decrease');
        const increaseBtn = document.getElementById('increase');
        const maxStock = ${product.stock};

        decreaseBtn.addEventListener('click', function() {
            let currentValue = parseInt(quantityInput.value);
            if (currentValue > 1) {
                quantityInput.value = currentValue - 1;
            }
        });

        increaseBtn.addEventListener('click', function() {
            let currentValue = parseInt(quantityInput.value);
            if (currentValue < maxStock) {
                quantityInput.value = currentValue + 1;
            }
        });

        function addToCart() {
            const quantity = document.getElementById('quantity').value;
            const productId = ${product.id};

            alert('Menambahkan ' + quantity + ' item ke keranjang');
        }

        function buyNow() {
            const quantity = document.getElementById('quantity').value;
            const productId = ${product.id};

            alert('Membeli ' + quantity + ' item');
        }