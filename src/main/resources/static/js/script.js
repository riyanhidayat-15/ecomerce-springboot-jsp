
    function openModal() {
        document.getElementById("productModal").style.display = "flex";
    }

    function closeModal() {
        document.getElementById("productModal").style.display = "none";
    }


    window.onclick = function(event) {
        const modal = document.getElementById("productModal");
        if (event.target === modal) {
            modal.style.display = "none";
        }
 }

  const fileInput = document.getElementById("imageInput");
     const preview = document.getElementById("previewImage");

     fileInput.addEventListener("change", function () {
         const file = this.files[0];
         if (file) {
             preview.src = URL.createObjectURL(file);
             preview.style.display = "block";
         }
     })
