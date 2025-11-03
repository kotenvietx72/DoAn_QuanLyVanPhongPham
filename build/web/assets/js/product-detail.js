/* ======================================= */
/* JS TRANG CHI TIẾT SẢN PHẨM
/* ======================================= */
/* global bootstrap */

document.addEventListener("DOMContentLoaded", function() {

    const btnPlus = document.getElementById("btnQtyPlus");
    const btnMinus = document.getElementById("btnQtyMinus");
    const qtyInput = document.getElementById("qtyInput");
    
    // (Lấy input ẩn để cập nhật số lượng cho form)
    const formQtyAdd = document.getElementById("formQtyAdd"); 
    const formQtyBuy = document.getElementById("formQtyBuy");

    function updateFormQuantities(newValue) {
        if (formQtyAdd) formQtyAdd.value = newValue;
        if (formQtyBuy) formQtyBuy.value = newValue;
    }

    // Nút Tăng (+)
    if (btnPlus) { 
        btnPlus.addEventListener("click", function() {
            let currentValue = parseInt(qtyInput.value);
            if (isNaN(currentValue)) {
                currentValue = 0;
            }
            let newValue = currentValue + 1;
            qtyInput.value = newValue;
            updateFormQuantities(newValue); // Cập nhật form
        });
    }

    // Nút Giảm (-)
    if (btnMinus) { 
        btnMinus.addEventListener("click", function() {
            let currentValue = parseInt(qtyInput.value);
            let newValue;
            if (isNaN(currentValue) || currentValue <= 1) {
                newValue = 1; // Không cho giảm dưới 1
            } else {
                newValue = currentValue - 1;
            }
            qtyInput.value = newValue;
            updateFormQuantities(newValue); // Cập nhật form
        });
    }

    // --- 3. HIỆU ỨNG CHỌN PHÂN LOẠI ---
    const optionButtons = document.querySelectorAll(".btn-option");

    optionButtons.forEach((button, index) => {
        button.addEventListener("click", function(event) {
            event.preventDefault();
            optionButtons.forEach(btn => {
                btn.classList.remove("active");
            });
            this.classList.add("active");
        });
    });
    
    const scrollToReviewsLink = document.getElementById("scrollToReviews");
    const reviewsTabButton = document.getElementById("reviews-tab"); // Nút bấm tab

    if (scrollToReviewsLink && reviewsTabButton) {
        
        // Tạo đối tượng Tab của Bootstrap
        const reviewTab = new bootstrap.Tab(reviewsTabButton);

        scrollToReviewsLink.addEventListener("click", function(event) {
            event.preventDefault(); // Ngăn hành vi nhảy (anchor link)
            
            // 1. Dùng JS để kích hoạt (chuyển) sang tab Đánh giá
            reviewTab.show();
            
            // 2. (Tùy chọn) Cuộn trang xuống khu vực tab cho mượt
            const tabElement = document.getElementById("myTab"); // Lấy thanh nav-tabs
            if (tabElement) {
                tabElement.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        });
    }

});