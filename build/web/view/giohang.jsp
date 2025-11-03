<%@page contentType="text-html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Giỏ hàng | Văn Phòng Phẩm 3AE</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <%-- ADD NEW CSS FOR CART PAGE --%>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cart-page.css">
    </head>
    <body>
        <jsp:include page="_header.jsp" />

        <div class="container cart-container my-5">
            <h1 class="cart-page-title mb-4">Giỏ hàng</h1>

            <div class="row">
                <div class="col-lg-8">
                    <div class="cart-items-wrapper">
                        <%-- Check if cart is empty --%>
                        <c:if test="${empty cartItems}">
                            <div class="alert alert-info text-center" role="alert">
                                Giỏ hàng của bạn đang trống!
                            </div>
                        </c:if>

                        <%-- Loop through cart items (Assume you have a list called 'cartItems') --%>
                        <c:forEach var="item" items="${cartItems}">
                            <div class="cart-item">
                                <div class="row align-items-center">
                                    <div class="col-2">
                                        <img src="${pageContext.request.contextPath}/${item.product.hinhAnh}" class="img-fluid cart-item-img" alt="${item.product.tenSanPham}">
                                    </div>
                                    <div class="col-4">
                                        <h6 class="cart-item-title">${item.product.tenSanPham}</h6>
                                        <p class="cart-item-options text-muted small">
                                            <%-- Display selected options if any (e.g., color, combo) --%>
                                            ${item.options} <%-- Adjust based on your data structure --%>
                                        </p>
                                    </div>
                                    <div class="col-2 text-end">
                                        <span class="cart-item-price"><fmt:formatNumber value="${item.product.giaBan}" type="currency" currencySymbol="" minFractionDigits="0"/>₫</span>
                                        <c:if test="${item.product.giaGoc > item.product.giaBan}">
                                            <br>
                                            <small class="text-muted text-decoration-line-through"><fmt:formatNumber value="${item.product.giaGoc}" type="currency" currencySymbol="" minFractionDigits="0"/>₫</small>
                                            <%-- Calculate discount --%>
                                            <c:set var="discountPercent" value="${(item.product.giaGoc - item.product.giaBan) * 100 / item.product.giaGoc}" />
                                            <span class="badge bg-danger ms-1">-<fmt:formatNumber value="${discountPercent / 100}" type="percent" minIntegerDigits="0"/></span>
                                        </c:if>
                                    </div>
                                    <div class="col-2">
                                        <div class="quantity-input cart-quantity">
                                            <button class="btn btn-qty btn-sm btn-minus" data-itemid="${item.id}"><i class="bi bi-dash"></i></button>
                                            <input type="text" class="qty-input" value="${item.quantity}" readonly data-itemid="${item.id}">
                                            <button class="btn btn-qty btn-sm btn-plus" data-itemid="${item.id}"><i class="bi bi-plus"></i></button>
                                        </div>
                                    </div>
                                    <div class="col-1 text-end">
                                        <button class="btn btn-remove-item" data-itemid="${item.id}"><i class="bi bi-x-lg"></i></button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                        <%-- Optional: Free shipping info --%>
                        <div class="free-shipping-info mt-4">
                            <i class="bi bi-truck"></i> Miễn phí vận chuyển cho đơn hàng từ 100.000đ
                        </div>

                    </div> <%-- End cart-items-wrapper --%>
                </div> <%-- End col-lg-8 --%>


                <div class="col-lg-4">
                    <div class="summary-wrapper">
                        <h5 class="summary-title">Tổng tiền</h5>
                        <div class="summary-total d-flex justify-content-between mb-3">
                            <span>Tổng cộng:</span>
                            <span class="fw-bold total-amount"><fmt:formatNumber value="${cartTotal}" type="currency" currencySymbol="" minFractionDigits="0"/>₫</span>
                        </div>

                        <%-- VAT Invoice Section --%>
                        <div class="vat-invoice-section">
                            <div class="form-check mb-3">
                                <input class="form-check-input" type="checkbox" value="" id="vatCheckbox">
                                <label class="form-check-label fw-bold" for="vatCheckbox">
                                    Xuất hoá đơn công ty
                                </label>
                            </div>

                            <div id="vatForm" class="vat-form" style="display: none;"> <%-- Hidden by default --%>
                                <div class="mb-3">
                                    <label for="companyName" class="form-label">Tên công ty:</label>
                                    <input type="text" class="form-control form-control-sm" id="companyName">
                                </div>
                                <div class="mb-3">
                                    <label for="taxCode" class="form-label">Mã số thuế <small>(Nếu xuất không mà số thuế thì điền "0")</small>:</label>
                                    <input type="text" class="form-control form-control-sm" id="taxCode">
                                </div>
                                <div class="mb-3">
                                    <label for="companyAddress" class="form-label">Địa chỉ công ty <small>(Địa chỉ xuất hóa đơn VAT)</small>:</label>
                                    <input type="text" class="form-control form-control-sm" id="companyAddress">
                                </div>
                                <div class="mb-3">
                                    <label for="companyEmail" class="form-label">Email công ty <small>(Chỉ nhập 1 email duy nhất)</small>:</label>
                                    <input type="email" class="form-control form-control-sm" id="companyEmail">
                                </div>
                                <p class="vat-note small text-danger">
                                    *Lưu ý: Nhập rõ ràng và đầy đủ thông tin hóa đơn (không viết tắt phường/xã, quận/huyện, tỉnh/thành phố, tên công ty)
                                </p>
                                <div class="mb-3">
                                    <label for="orderNotes" class="form-label">Ghi chú đơn hàng <small>(Không hỗ trợ đổi hàng và màu sắc...)</small>:</label>
                                    <textarea class="form-control form-control-sm" id="orderNotes" rows="3"></textarea>
                                </div>
                            </div>
                        </div>

                        <button class="btn btn-primary btn-checkout w-100 mt-4">Tiến hành đặt hàng</button>

                    </div> <%-- End summary-wrapper --%>
                </div> <%-- End col-lg-4 --%>

            </div> <%-- End row --%>
        </div> <%-- End container --%>

        <jsp:include page="_footer.jsp" />  
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <%-- ADD NEW JS FOR CART PAGE --%>
        <script src="${pageContext.request.contextPath}/assets/js/cart-page.js"></script>
    </body>
</html>