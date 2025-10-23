/* ======================================= */
/* JS FOR CHECKOUT PAGE
/* ======================================= */
document.addEventListener('DOMContentLoaded', function() {

    // --- Show/Hide Available Discount Codes ---
    const showDiscountsLink = document.querySelector('.show-discounts-link');
    const discountTagsDiv = document.querySelector('.discount-tags');

    if (showDiscountsLink && discountTagsDiv) {
        showDiscountsLink.addEventListener('click', function(event) {
            event.preventDefault(); // Prevent default link behavior
            if (discountTagsDiv.style.display === 'none') {
                discountTagsDiv.style.display = 'flex'; // Or 'block'
                this.innerHTML = '<i class="bi bi-tag-fill"></i> Ẩn mã giảm giá';
            } else {
                discountTagsDiv.style.display = 'none';
                this.innerHTML = '<i class="bi bi-tag-fill"></i> Xem thêm mã giảm giá';
            }
        });
    }

    // --- Apply Discount Code from Tag ---
    const discountCodeInput = document.getElementById('discountCodeInput');
    const discountTagButtons = document.querySelectorAll('.btn-discount-tag');

    if (discountCodeInput && discountTagButtons) {
        discountTagButtons.forEach(button => {
            button.addEventListener('click', function() {
                const code = this.dataset.code; // Get code from data-code attribute
                discountCodeInput.value = code;
                // Optionally, hide the tags again
                // if (discountTagsDiv) discountTagsDiv.style.display = 'none';
                // if (showDiscountsLink) showDiscountsLink.innerHTML = '<i class="bi bi-tag-fill"></i> Xem thêm mã giảm giá';
            });
        });
    }

    // --- TODO: Handle "Apply Discount" Button Click ---
    const applyDiscountBtn = document.getElementById('applyDiscountBtn');
    if(applyDiscountBtn && discountCodeInput){
        applyDiscountBtn.addEventListener('click', function(){
            const code = discountCodeInput.value.trim();
            if(code){
                console.log("Applying discount code:", code);
                // !!! TODO: Add AJAX call here to validate code and update totals !!!
                // validateAndApplyDiscount(code);
            } else {
                alert("Vui lòng nhập mã giảm giá.");
            }
        });
    }

    const checkoutForm = document.querySelector('.shipping-info-wrapper form');
    const continueButton = checkoutForm.querySelector('.btn-continue');
    const qrModalElement = document.getElementById('qrPaymentModal'); // Lấy phần tử Modal
    const qrCanvas = document.getElementById('qrcodeCanvas');
    const qrAmountSpan = document.getElementById('qrAmount');
    const qrContentSpan = document.getElementById('qrContent');
    
    // Tạo đối tượng Modal của Bootstrap từ phần tử HTML
    const qrModal = new bootstrap.Modal(qrModalElement); 

    if (continueButton && checkoutForm && qrModalElement && qrCanvas && qrAmountSpan && qrContentSpan) {
        continueButton.addEventListener('click', function(event) {
            // 1. Ngăn form gửi đi
            event.preventDefault();

            // 2. Kiểm tra form hợp lệ
            if (!checkoutForm.checkValidity()) {
                checkoutForm.reportValidity();
                return; 
            }

            // 3. Lấy thông tin cần thiết (Lấy trước khi mở modal)
            const amountText = document.querySelector('.grand-total').textContent.replace(/[^0-9]/g, '');
            const orderId = "DH" + new Date().getTime(); 

            // Cập nhật số tiền và nội dung lên giao diện (có thể làm trước hoặc sau khi modal hiện)
            qrAmountSpan.textContent = parseInt(amountText).toLocaleString('vi-VN') + '₫';
            qrContentSpan.textContent = orderId; 

            // 4. MỞ CỬA SỔ MODAL
            qrModal.show(); 
        });

        // 5. LẮNG NGHE SỰ KIỆN KHI MODAL ĐÃ HIỆN RA HOÀN TOÀN
        qrModalElement.addEventListener('shown.bs.modal', function () {
            // Chỉ tạo QR KHI modal đã hiển thị (đảm bảo canvas tồn tại và có kích thước)
            
            // Lấy lại thông tin (hoặc dùng biến đã lấy trước đó)
            const amountText = document.querySelector('.grand-total').textContent.replace(/[^0-9]/g, ''); 
            const orderId = qrContentSpan.textContent;

            // TẠO NỘI DUNG MÃ VIETQR (Ví dụ - NHỚ THAY THÔNG TIN CỦA BẠN)
            const bankBin = "970418"; // Vietcombank
            const accountNumber = "1234567890"; // SỐ TK CỦA BẠN
            const accountName = "TEN CHU THE"; // TÊN CỦA BẠN
            const description = orderId; 
            const qrCodeContent = `https://img.vietqr.io/image/${bankBin}-${accountNumber}-print.png?amount=${amountText}&addInfo=${description}&accountName=${encodeURIComponent(accountName)}`;

            // Xóa mã QR cũ và Vẽ mã QR mới
            qrCanvas.innerHTML = ''; // Xóa canvas cũ
            new QRCode(qrCanvas, {
                text: qrCodeContent, 
                width: 200,         
                height: 200,
                colorDark : "#000000",
                colorLight : "#ffffff",
                correctLevel : QRCode.CorrectLevel.H 
            });
        });
    }
});
