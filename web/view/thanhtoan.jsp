<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thanh toán | Văn Phòng Phẩm 3AE</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/checkout-page.css">
        <script src="https://cdn.jsdelivr.net/npm/qrcodejs@1.0.0/qrcode.min.js"></script>
    </head>
    <body>
        <div class="container checkout-container my-5">
            <nav aria-label="breadcrumb" class="mb-4">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Giỏ hàng</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Thông tin giao hàng</li>
                    <li class="breadcrumb-item disabled-breadcrumb" aria-current="page">Phương thức thanh toán</li>
                </ol>
            </nav>
            <div class="row g-5">
                <div class="col-lg-7">
                    <div class="shipping-info-wrapper">
                        <h4 class="section-title">Thông tin giao hàng</h4>
                        <p class="login-prompt">Bạn đã có tài khoản? <a href="#">Đăng nhập</a></p>
                        <form action="process-checkout" method="POST">
                            <div class="row g-3 mb-3">
                                <div class="col-md-6">
                                    <input type="text" class="form-control" placeholder="Họ và tên" required>
                                </div>
                                <div class="col-md-6">
                                    <input type="email" class="form-control" placeholder="Email" required>
                                </div>
                            </div>
                            <div class="mb-3">
                                <input type="tel" class="form-control" placeholder="Số điện thoại" required>
                            </div>
                            <div class="mb-3">
                                <input type="text" class="form-control" placeholder="Địa chỉ (Số nhà, tên đường...)" required>
                            </div>
                            <div class="row g-3 mb-3">
                                <div class="col-md-4">
                                    <select class="form-select" required>
                                        <option selected disabled value="">Tỉnh / thành</option>
                                        <option value="hcm">TP. Hồ Chí Minh</option>
                                        <option value="hn">Hà Nội</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <select class="form-select" required>
                                        <option selected disabled value="">Quận / huyện</option>
                                        <option value="q1">Quận 1</option>
                                        <option value="q5">Quận 5</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <select class="form-select" required>
                                        <option selected disabled value="">Phường / xã</option>
                                        <option value="pdk">Phường Đa Kao</option>
                                        <option value="p6">Phường 6</option>
                                    </select>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between align-items-center mt-4">
                                <a href="#" class="back-link"><i class="bi bi-chevron-left"></i> Giỏ hàng</a>
                                <button type="submit" class="btn btn-primary btn-lg btn-continue">Tiếp tục đến phương thức thanh toán</button>
                            </div>
                        </form>
                        <div class="modal fade" id="qrPaymentModal" tabindex="-1" aria-labelledby="qrPaymentModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="qrPaymentModalLabel">Quét mã QR để thanh toán</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div id="qrPaymentSection" class="qr-payment-wrapper">
                                            <p class="text-center text-muted small mb-2">Sử dụng ứng dụng ngân hàng hoặc ví điện tử hỗ trợ VietQR.</p>
                                            <div id="qrcodeCanvas" class="qrcode-canvas mx-auto my-3"></div>
                                            <div class="payment-details text-center">
                                                <p><strong>Số tiền:</strong> <span id="qrAmount" class="text-danger fw-bold"></span></p>
                                                <p><strong>Nội dung chuyển khoản:</strong> <span id="qrContent" class="text-primary fw-bold"></span></p>
                                                <p class="small text-muted">(Vui lòng nhập đúng nội dung)</p>
                                            </div>
                                            <div class="alert alert-warning mt-3 small" role="alert">
                                                <i class="bi bi-info-circle-fill"></i> Sau khi thanh toán, hệ thống sẽ tự động xác nhận (hoặc bấm "Tôi đã thanh toán" nếu có).
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer justify-content-center">
                                        <button type="button" class="btn btn-success">Tôi đã thanh toán</button>
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="order-summary-wrapper">
                        <%-- List items --%>
                        <c:forEach var="item" items="${cartItems}">
                            <div class="summary-item d-flex align-items-center mb-3">
                                <div class="summary-item-img me-3">
                                    <img src="${pageContext.request.contextPath}/${item.product.hinhAnh}" class="img-fluid" alt="${item.product.tenSanPham}">
                                    <span class="summary-item-qty">${item.quantity}</span>
                                </div>
                                <div class="summary-item-info flex-grow-1">
                                    <h6 class="summary-item-title">${item.product.tenSanPham}</h6>
                                    <p class="summary-item-options small text-muted">${item.options}</p>
                                </div>
                                <div class="summary-item-price fw-bold">
                                    <fmt:formatNumber value="${item.product.giaBan * item.quantity}" type="currency" currencySymbol="" minFractionDigits="0"/>₫
                                </div>
                            </div>
                        </c:forEach>
                        <hr> <%-- Kẻ ngang sau list item --%>

                        <%-- Discount Section --%>
                        <div class="discount-section">
                            <div class="input-group mb-2">
                                <input type="text" class="form-control" placeholder="Mã giảm giá" id="discountCodeInput">
                                <button class="btn btn-outline-primary" type="button" id="applyDiscountBtn">Sử dụng</button>
                            </div>
                            <div class="available-discounts">
                                <a href="#" class="show-discounts-link small"><i class="bi bi-tag-fill"></i> Xem thêm mã giảm giá</a>
                                <div class="discount-tags" style="display: none;">
                                    <button class="btn btn-sm btn-discount-tag" data-code="3AESALE50K">Giảm 50.000đ</button>
                                    <button class="btn btn-sm btn-discount-tag" data-code="3AESALE15">Giảm 15%</button>
                                </div>
                            </div>
                        </div>
                        <hr> <%-- Kẻ ngang sau discount --%>

                        <%-- Totals Section --%>
                        <div class="totals-section">
                            <div class="d-flex justify-content-between mb-2">
                                <span>Tạm tính</span>
                                <span><fmt:formatNumber value="${subtotal}" type="currency" currencySymbol="" minFractionDigits="0"/>₫</span>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <span>Phí vận chuyển</span>
                                <span>
                                    <c:choose>
                                        <c:when test="${shippingCost > 0}"><fmt:formatNumber value="${shippingCost}" type="currency" currencySymbol="" minFractionDigits="0"/>₫</c:when>
                                        <c:otherwise>—</c:otherwise>
                                    </c:choose>
                                </span>
                            </div>
                            <%-- Có thể thêm dòng Discount ở đây nếu cần --%>
                            <hr> <%-- Kẻ ngang trước tổng cộng --%>
                            <div class="d-flex justify-content-between fw-bold fs-5">
                                <span>Tổng cộng</span>
                                <span class="grand-total">VND <fmt:formatNumber value="${grandTotal}" type="currency" currencySymbol="" minFractionDigits="0"/>₫</span>
                            </div>
                        </div>

                        <%-- Customer Program --%>
                        <div class="customer-program mt-3 text-center">
                            Chương trình khách hàng thân thiết <button class="btn btn-sm btn-outline-primary ms-2">Đăng nhập</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/checkout-page.js"></script>
    </body>
</html>