/* ======================================= */
/* JS TRANG CHI TIẾT SẢN PHẨM
/* ======================================= */

// Chờ DOM tải xong
document.addEventListener("DOMContentLoaded", function() {

    // --- 1. HIỆU ỨNG GALLERY ẢNH ---
    const mainImage = document.getElementById("mainProductImage");
    const thumbnails = document.querySelectorAll(".thumbnail-img");

    thumbnails.forEach(thumb => {
        thumb.addEventListener("click", function() {
            // Lấy src của ảnh nhỏ được click
            const newImageSrc = thumb.src;
            
            // Thay đổi ảnh chính
            mainImage.src = newImageSrc;
            
            // Xóa class 'active' khỏi tất cả ảnh nhỏ
            thumbnails.forEach(t => t.classList.remove("active"));
            
            // Thêm class 'active' cho ảnh nhỏ vừa click
            this.classList.add("active");
        });
    });


    // --- 2. HIỆU ỨNG NÚT SỐ LƯỢNG ---
    const btnPlus = document.getElementById("btnQtyPlus");
    const btnMinus = document.getElementById("btnQtyMinus");
    const qtyInput = document.getElementById("qtyInput");

    // Nút Tăng (+)
    btnPlus.addEventListener("click", function() {
        let currentValue = parseInt(qtyInput.value);
        if (isNaN(currentValue)) {
            currentValue = 0;
        }
        qtyInput.value = currentValue + 1;
    });

    // Nút Giảm (-)
    btnMinus.addEventListener("click", function() {
        let currentValue = parseInt(qtyInput.value);
        if (isNaN(currentValue) || currentValue <= 1) {
            qtyInput.value = 1; // Không cho giảm dưới 1
        } else {
            qtyInput.value = currentValue - 1;
        }
    });

});
