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
        <input type="hidden" id="isBuyNow" value="${isBuyNow ? 'true' : 'false'}">
        <div class="container checkout-container my-5">
            <nav aria-label="breadcrumb" class="mb-4">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/xem-gio-hang">Giỏ hàng</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Thông tin giao hàng</li>
                    <li class="breadcrumb-item disabled-breadcrumb" aria-current="page">Phương thức thanh toán</li>
                </ol>
            </nav>
            <div class="row g-5">
                <div class="col-lg-7">
                    <div class="shipping-info-wrapper">
                        <h4 class="section-title">Thông tin giao hàng</h4>
                        <form>
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
                                    <select class="form-select" id="provinceSelect" required>
                                        <option selected disabled value="">Tỉnh / thành</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <select class="form-select" id="districtSelect" required>
                                        <option selected disabled value="">Quận / huyện</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <select class="form-select" id="wardSelect" required>
                                        <option selected disabled value="">Phường / xã</option>
                                    </select>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between align-items-center mt-4">
                                <a href="${pageContext.request.contextPath}/xem-gio-hang" class="back-link">
                                    <i class="bi bi-chevron-left"></i> Giỏ hàng
                                </a>
                                <button type="button" 
                                        class="btn btn-primary btn-lg btn-continue">
                                    Tiếp tục đến phương thức thanh toán
                                </button>
                            </div>
                        </form>
                        <div class="modal fade" id="qrPaymentModal" tabindex="-1" aria-labelledby="qrPaymentModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <h5 class="modal-title" id="qrPaymentModalLabel">Quét mã QR để thanh toán</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>

                                    <div class="modal-body text-center">
                                        <p class="text-muted small mb-3">
                                            Sử dụng ứng dụng ngân hàng hoặc ví điện tử hỗ trợ VietQR.
                                        </p>

                                        <!-- NƠI HIỂN THỊ MÃ QR (JS của bạn sẽ gắn vào đây) -->
                                        <div id="qrcodeCanvas" class="mx-auto" style="width:400px; height:auto;"></div>

                                        <span id="qrAmount" style="display:none;"></span>
                                        <span id="qrContent" style="display:none;"></span>

                                        <!-- KHÔNG có phần nội dung trùng -->
                                        <div class="mt-3">
                                            <p class="text-muted small">
                                                <i class="bi bi-info-circle-fill"></i>
                                                Sau khi thanh toán, hệ thống sẽ tự động xác nhận
                                                (hoặc bấm <strong>"Tôi đã thanh toán"</strong> nếu có).
                                            </p>
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
                                    <img src="${pageContext.request.contextPath}/${item.sanPham.hinhAnh}" 
                                         class="img-fluid" 
                                         alt="${item.sanPham.tenSanPham}">
                                    <span class="summary-item-qty">${item.soLuong}</span>
                                </div>
                                <div class="summary-item-info flex-grow-1">
                                    <h6 class="summary-item-title">${item.sanPham.tenSanPham}</h6>
                                </div>
                                <div class="summary-item-price fw-bold">
                                    <fmt:formatNumber value="${item.sanPham.giaKhuyenMai * item.soLuong}" type="number" groupingUsed="true"/>₫
                                </div>
                            </div>
                        </c:forEach>
                        <hr> <%-- Kẻ ngang sau list item --%>
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
                                        <c:when test="${shippingCost > 0}">
                                            <fmt:formatNumber value="${shippingCost}" type="currency" currencySymbol="" minFractionDigits="0"/>₫
                                        </c:when>
                                        <c:otherwise>Miễn phí</c:otherwise>
                                    </c:choose>
                                </span>
                            </div>
                            <hr> <%-- Kẻ ngang trước tổng cộng --%>
                            <div class="d-flex justify-content-between fw-bold fs-5">
                                <span>Tổng cộng</span>
                                <span class="grand-total">VND <fmt:formatNumber value="${grandTotal}" type="currency" currencySymbol="" minFractionDigits="0"/>₫</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/checkout-page.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/provinces.js"></script>
    </body>
</html>