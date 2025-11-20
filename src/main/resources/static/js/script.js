    const modal = document.getElementById("productModal");
    const form = document.getElementById("productForm");
    const modalTitle = document.getElementById("modalTitle");
    const nameInput = document.getElementById("nameInput");
    const priceInput = document.getElementById("priceInput");
    const stockInput = document.getElementById("stockInput");
    const descriptionInput = document.getElementById("descriptionInput");
    const productIdInput = document.getElementById("productId");
    const fileInput = document.getElementById("imageInput");
    const preview = document.getElementById("previewImage");

    function openModal(mode, el) {
        if (!modal || !form) return;

        modal.style.display = "flex";

        if (mode === 'edit' && el) {
            modalTitle.textContent = "Edit Produk";

            const id = el.getAttribute('data-id');
            const name = el.getAttribute('data-name');
            const price = el.getAttribute('data-price');
            const stock = el.getAttribute('data-stock');
            const desc = el.getAttribute('data-desc');
            const image = el.getAttribute('data-image');

            productIdInput.value = id || '';
            nameInput.value = name || '';
            priceInput.value = price || '';
            stockInput.value = stock || '';
            descriptionInput.value = desc || '';

            // set form action to edit endpoint (use form data-base for context path)
            const basePath = form.getAttribute('data-base') || '';
            form.action = basePath + '/admin/products/edit/' + id;

            // image not required for edit
            if (fileInput) fileInput.required = false;

            if (image) {
                preview.src = image;
                preview.style.display = 'block';
            } else {
                preview.style.display = 'none';
            }

        } else {
            // add mode
            modalTitle.textContent = "Tambah Produk";
            productIdInput.value = '';
            nameInput.value = '';
            priceInput.value = '';
            stockInput.value = '';
            descriptionInput.value = '';
            const basePathAdd = form.getAttribute('data-base') || '';
            form.action = basePathAdd + '/admin/products/add';
            if (fileInput) fileInput.required = true;
            preview.style.display = 'none';
            preview.src = '';
            if (fileInput) fileInput.value = '';
        }
    }

    function closeModal() {
        if (modal) modal.style.display = "none";
    }


    window.onclick = function(event) {
        const modal = document.getElementById("productModal");
        if (event.target === modal) {
            modal.style.display = "none";
        }
 }

    if (fileInput) {
        fileInput.addEventListener("change", function () {
            const file = this.files[0];
            if (file) {
                preview.src = URL.createObjectURL(file);
                preview.style.display = "block";
            }
        })
    }

    // Delete flow: confirmation then submit hidden form to server
    function confirmDelete(id) {
        if (!id) return;
        const ok = window.confirm('Yakin ingin menghapus produk ini?');
        if (!ok) return;

        const deleteForm = document.getElementById('deleteForm');
        if (!deleteForm) {
            // fallback: try sending fetch POST
            const base = form ? (form.getAttribute('data-base') || '') : '';
            fetch(base + '/admin/products/delete/' + id, { method: 'POST' })
                .then(() => location.reload())
                .catch(err => { console.error(err); alert('Gagal menghapus produk'); });
            return;
        }

        const base = deleteForm.getAttribute('data-base') || '';
        deleteForm.action = base + '/admin/products/delete/' + id;
        deleteForm.submit();
    }
