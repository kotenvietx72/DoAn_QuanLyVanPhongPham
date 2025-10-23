document.addEventListener('DOMContentLoaded', function() {

    // --- VAT Invoice Checkbox ---
    const vatCheckbox = document.getElementById('vatCheckbox');
    const vatForm = document.getElementById('vatForm');

    if (vatCheckbox && vatForm) {
        vatCheckbox.addEventListener('change', function() {
            if (this.checked) {
                vatForm.style.display = 'block';
            } else {
                vatForm.style.display = 'none';
            }
        });
    }

    // --- Quantity Buttons ---
    const quantityInputs = document.querySelectorAll('.qty-input');
    const plusButtons = document.querySelectorAll('.btn-plus');
    const minusButtons = document.querySelectorAll('.btn-minus');

    // Plus button click
    plusButtons.forEach(button => {
        button.addEventListener('click', function() {
            const itemId = this.dataset.itemid;
            const input = document.querySelector(`.qty-input[data-itemid="${itemId}"]`);
            if (input) {
                let currentValue = parseInt(input.value);
                if (isNaN(currentValue)) currentValue = 0;
                input.value = currentValue + 1;
                // !!! TODO: Add AJAX call here to update cart on the server !!!
                // updateCartItemQuantity(itemId, input.value);
                console.log(`Update item ${itemId} quantity to ${input.value}`);
            }
        });
    });

    // Minus button click
    minusButtons.forEach(button => {
        button.addEventListener('click', function() {
            const itemId = this.dataset.itemid;
            const input = document.querySelector(`.qty-input[data-itemid="${itemId}"]`);
            if (input) {
                let currentValue = parseInt(input.value);
                if (isNaN(currentValue) || currentValue <= 1) {
                    input.value = 1; // Don't go below 1
                } else {
                    input.value = currentValue - 1;
                }
                // !!! TODO: Add AJAX call here to update cart on the server !!!
                // updateCartItemQuantity(itemId, input.value);
                 console.log(`Update item ${itemId} quantity to ${input.value}`);
            }
        });
    });

    // --- Remove Item Button ---
    const removeButtons = document.querySelectorAll('.btn-remove-item');
    removeButtons.forEach(button => {
        button.addEventListener('click', function() {
            const itemId = this.dataset.itemid;
             if (confirm('Bạn có chắc muốn xóa sản phẩm này khỏi giỏ hàng?')) {
                 // !!! TODO: Add AJAX call or form submission here to remove item on the server !!!
                 // removeItemFromCart(itemId);
                 console.log(`Remove item ${itemId}`);
                 // Optionally remove the item row from the DOM immediately
                 this.closest('.cart-item').remove();
                 // !!! TODO: Recalculate and update totals !!!
             }
        });
    });


    // --- TODO: Functions for AJAX calls (Example placeholders) ---
    /*
    function updateCartItemQuantity(itemId, newQuantity) {
        // Use fetch() or XMLHttpRequest to send data to your CartServlet
        // Update totals on success
    }

    function removeItemFromCart(itemId) {
        // Use fetch() or XMLHttpRequest to send data to your CartServlet
        // Update totals on success
    }
    */

});