<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.lang.Math" %> <%-- BẮT BUỘC CÓ DÒNG NÀY --%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>${sanPham.tenSanPham} | Văn Phòng Phẩm 3AE</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

        <%-- Link đến file CSS ngoài --%>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/product-detail.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;500;600;700&display=swap" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary sticky-top">
            <div class="container-fluid">
                <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/trang-chu">
                    <img src="${pageContext.request.contextPath}/assets/image/logo.png" alt="Logo"> 3AE
                </a>
                <form class="d-flex mx-auto w-50" action="tim-kiem" method="GET">
                    <input class="form-control me-2" type="search" name="keyword" placeholder="Tìm kiếm sản phẩm...">
                    <button class="btn btn-light" type="submit">
                        <i class="bi bi-search"></i>
                    </button>
                </form>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link text-white" href="dang-nhap">Đăng nhập</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="dang-ky">Đăng ký</a></li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="gio-hang">
                            🛒 Giỏ hàng <span class="badge bg-danger">0</span>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
        <nav class="navbar navbar-expand-lg bg-white shadow-sm category-nav-custom">
            <div class="container-fluid">
                <div class="collapse navbar-collapse justify-content-center" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownButViet" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-pen-fill"></i> Bút - Viết
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdownButViet">
                                <li><a class="dropdown-item" href="danh-muc?loaiId=1">Tất cả bút viết</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownVoSach" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-journal-bookmark-fill"></i> Sổ - Vở - Sách
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdownVoSach">
                                <li><a class="dropdown-item" href="danh-muc?loaiId=8">Sổ / Vở</a></li>
                                <li><a class="dropdown-item" href="danh-muc?loaiId=7">Sách</a></li>
                                <li><a class="dropdown-item" href="danh-muc?loaiId=6">Nhãn vở</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownHocTap" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-rulers"></i> Dụng cụ học tập
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdownHocTap">
                                <li><a class="dropdown-item" href="danh-muc?loaiId=2">Dụng cụ học sinh</a></li>
                                <li><a class="dropdown-item" href="danh-muc?loaiId=5">Hộp bút / Ba lô</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownVanPhong" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-folder-fill"></i> Văn phòng phẩm
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdownVanPhong">
                                <li><a class="dropdown-item" href="danh-muc?loaiId=2">Bìa hồ sơ / Bảng viết</a></li>
                                <li><a class="dropdown-item" href="danh-muc?loaiId=4">Giấy in</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="danh-muc?loaiId=3">
                                <i class="bi bi-calculator-fill"></i> Máy tính
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container product-detail-container my-5">
            <c:if test="${not empty sanPham}">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="main-image-wrapper mb-3">
                            <img src="${pageContext.request.contextPath}${sanPham.hinhAnh}"
                                 id="mainProductImage"
                                 class="img-fluid"
                                 alt="${sanPham.tenSanPham}">
                        </div>
                    </div>

                    <div class="col-lg-6">

                        <div class="product-meta-tags mb-2">
                            <span class="meta-tag">Thương hiệu: <a href="#">3 Anh Em</a></span>
                        </div>

                        <div class="product-meta-tags mb-2">
                            <span class="meta-tag">Mã sản phẩm: ${sanPham.sanPhamId}</span>
                            <c:if test="${sanPham.tonKho > 0}">
                                <span class="meta-tag text-success"><i class="bi bi-check-circle-fill"></i> Còn hàng</span>
                            </c:if>
                            <c:if test="${sanPham.tonKho <= 0}">
                                <span class="meta-tag text-danger"><i class="bi bi-x-circle-fill"></i> Hết hàng</span>
                            </c:if>
                        </div>

                        <h2 class="product-detail-title">${sanPham.tenSanPham}</h2>

                        <div class="product-review-summary mb-3">
                            <c:set var="diemTrungBinh" value="${sanPham.diemTrungBinh}" />
                            <c:set var="tongDanhGia" value="${sanPham.tongDanhGia}" />
                            <c:set var="diemTron" value="${Math.round(diemTrungBinh * 2) / 2.0}" />
                            <span class="rating-stars">
                                <c:forEach begin="1" end="5" var="i">
                                    <c:choose>
                                        <c:when test="${diemTron >= i}"><i class="bi bi-star-fill"></i></c:when>
                                        <c:when test="${diemTron >= (i - 0.5)}"><i class="bi bi-star-half"></i></c:when>
                                        <c:otherwise><i class="bi bi-star"></i></c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </span>
                            <span class="rating-score"><fmt:formatNumber value="${diemTrungBinh}" maxFractionDigits="1"/></span>

                            <%-- THÊM id="scrollToReviews" VÀO LINK NÀY --%>
                            <a href="#reviews-tab" class="rating-count" id="scrollToReviews">(Xem ${tongDanhGia} đánh giá)</a>

                            <span class="divider">|</span>
                            <span class="sold-count">Đã bán 100+</span>
                        </div>

                        <div class="price-detail-box">
                            <c:set var="giaMoi" value="${sanPham.giaKhuyenMai}" /> 
                            <c:set var="giaCu" value="${sanPham.giaBan}" />

                            <span class="sale-price"><fmt:formatNumber value="${giaMoi}" type="currency" currencySymbol="" minFractionDigits="0"/>₫</span>
                            <span class="old-price"><fmt:formatNumber value="${giaCu}" type="currency" currencySymbol="" minFractionDigits="0"/>₫</span>

                            <c:set var="phanTram" value="${(giaCu - giaMoi) * 100 / giaCu}" />
                            <span class="discount-badge-detail">GIẢM <fmt:formatNumber value="${phanTram / 100}" type="percent" minIntegerDigits="0"/></span>
                        </div>

                        <div class="product-quantity mt-4">
                            <h6 class="option-title">Số lượng:</h6>
                            <div class="quantity-input">
                                <button class="btn btn-qty" id="btnQtyMinus"><i class="bi bi-dash"></i></button>
                                <input type="text" id="qtyInput" value="1" readonly>
                                <button class="btn btn-qty" id="btnQtyPlus"><i class="bi bi-plus"></i></button>
                            </div>
                            <span class="text-muted ms-3 small">(${sanPham.tonKho} sản phẩm có sẵn)</span>
                        </div>

                        <div class="action-buttons mt-4 d-flex gap-3">
                            <form action="them-vao-gio" method="POST" style="flex: 1;">
                                <input type="hidden" name="productId" value="${sanPham.sanPhamId}">
                                <input type="hidden" name="quantity" id="formQtyAdd" value="1">
                                <button type="submit" class="btn btn-add-to-cart w-100">
                                    <i class="bi bi-cart-plus-fill"></i> Thêm vào giỏ
                                </button>
                            </form>
                            <form action="mua-ngay" method="POST" style="flex: 1;">
                                <input type="hidden" name="productId" value="${sanPham.sanPhamId}">
                                <input type="hidden" name="quantity" id="formQtyBuy" value="1">
                                <button type="submit" class="btn btn-buy-now w-100">
                                    Mua ngay
                                </button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="row mt-5">
                    <div class="col-12">
                        <div class="product-tabs">
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link active" id="description-tab" data-bs-toggle="tab" data-bs-target="#description" type="button" role="tab" aria-controls="description" aria-selected="true">
                                        Mô Tả Sản Phẩm
                                    </button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="reviews-tab" data-bs-toggle="tab" data-bs-target="#reviews" type="button" role="tab" aria-controls="reviews" aria-selected="false">
                                        Đánh Giá (${sanPham.tongDanhGia})
                                    </button>
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
                                    <div class="tab-pane-content">
                                        <p>${sanPham.moTa}</p>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
                                    <div class="tab-pane-content">
                                        <c:if test="${empty sanPham.listDanhGia}">
                                            <p class="text-center">Chưa có đánh giá nào cho sản phẩm này.</p>
                                        </c:if>
                                        <c:if test="${not empty sanPham.listDanhGia}">
                                            <c:forEach var="dg" items="${sanPham.listDanhGia}">
                                                <div class="review-item mb-3 pb-3 border-bottom">
                                                    <div class="review-author">
                                                        <strong>
                                                            <%-- (Bạn cần sửa Model DanhGiaSanPham để thêm tenKhachHang) --%>
                                                            Khách hàng #${dg.khachHangId}
                                                        </strong>
                                                    </div>
                                                    <div class="review-stars rating-stars my-1">
                                                        <c:forEach begin="1" end="5" var="i">
                                                            <i class="bi ${i <= dg.diem ? 'bi-star-fill' : 'bi-star'}"></i>
                                                        </c:forEach>
                                                    </div>
                                                    <div class="review-content">
                                                        <p class="mb-1">${dg.noiDung}</p>
                                                        <small class="text-muted">
                                                            <fmt:formatDate value="${dg.ngayDanhGia}" pattern="dd-MM-yyyy HH:mm"/>
                                                        </small>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
            <c:if test="${empty sanPham}">
                <div class="alert alert-danger" role="alert">
                    Không tìm thấy thông tin sản phẩm!
                </div>
            </c:if>
        </div>

        <footer class="site-footer pt-4 pb-3 mt-5">
            <div class="container text-center text-md-start">
                <div class="row">
                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto">
                        <a class="navbar-brand fw-bold mb-2" href="${pageContext.request.contextPath}/trang-chu">
                            <img src="${pageContext.request.contextPath}/assets/image/logo.png" alt="Logo"> VPP 3AE
                        </a>
                        <p>
                            Chuyên cung cấp các sản phẩm văn phòng phẩm, dụng cụ học sinh
                            chính hãng, chất lượng cao.
                        </p>
                    </div>
                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto">
                        <h6 class="text-uppercase fw-bold mb-4">Chính sách</h6>
                        <p><a href="#!">Chính sách bảo mật</a></p>
                        <p><a href="#!">Chính sách đổi trả</a></p>
                        <p><a href="#!">Chính sách giao hàng</a></p>
                    </div>
                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto">
                        <h6 class="text-uppercase fw-bold mb-4">Liên kết</h6>
                        <p><a href="#!">Về chúng tôi</a></p>
                        <p><a href="#!">Cửa hàng</a></p>
                        <p><a href="#!">Hỗ trợ</a></p>
                    </div>
                    <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0">
                        <h6 class="text-uppercase fw-bold mb-4">Liên hệ</h6>
                        <p><i class="bi bi-geo-alt-fill"></i> 123 Nguyễn Văn Cừ, Q5, TPHCM</p>
                        <p><i class="bi bi-envelope-fill"></i> support@3ae.vn</p>
                        <p><i class="bi bi-telephone-fill"></i> 1900 123 456</p>
                    </div>
                </div>
            </div>
        </footer>
        <div class="copyright-bar">
            <div class="container text-center p-3">
                © 2025 Copyright:
                <a class="fw-bold" href="#">VPP-3AE.com</a>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/product-detail.js"></script>
    </body>
</html>