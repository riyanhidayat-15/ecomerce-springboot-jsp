
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
