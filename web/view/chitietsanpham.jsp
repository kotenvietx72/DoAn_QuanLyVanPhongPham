<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <%-- Hiển thị tên sản phẩm thực tế trên title --%>
        <title>${sanPham.tenSanPham} | Văn Phòng Phẩm 3AE</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/product-detail.css">
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
                            🛒 Giỏ hàng <span class="badge bg-danger">0</span> <%-- Cần cập nhật động --%>
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
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink1" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-pen-fill"></i> Bút - Viết
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink1">
                                <li><a class="dropdown-item" href="danh-muc?loai=but-bi">Bút bi</a></li>
                                <li><a class="dropdown-item" href="danh-muc?loai=but-chi">Bút chì</a></li>
                                <li><a class="dropdown-item" href="danh-muc?loai=but-highlight">Bút highlight</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink2" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-book-half"></i> Sổ - Vở
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink2">
                                <li><a class="dropdown-item" href="danh-muc?loai=so-tay">Sổ tay</a></li>
                                <li><a class="dropdown-item" href="danh-muc?loai=vo-hoc-sinh">Vở học sinh</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="danh-muc?loai=dung-cu-hoc-sinh"><i class="bi bi-rulers"></i> Dụng cụ học sinh</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="danh-muc?loai=dung-cu-van-phong"><i class="bi bi-folder2-open"></i> Dụng cụ văn phòng</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="danh-muc?loai=dung-cu-my-thuat"><i class="bi bi-palette-fill"></i> Dụng cụ mỹ thuật</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container product-detail-container my-5">
            <c:if test="${not empty sanPham}"> <%-- Chỉ hiển thị nếu có sản phẩm --%>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="main-image-wrapper mb-3">
                            <%-- Hiển thị ảnh chính của sản phẩm --%>
                            <img src="${pageContext.request.contextPath}${sanPham.hinhAnh}"
                                 id="mainProductImage"
                                 class="img-fluid"
                                 alt="${sanPham.tenSanPham}">
                        </div>
                        <div class="thumbnail-list d-flex gap-2">
                            <%-- Hiển thị ảnh chính làm thumbnail đầu tiên --%>
                            <img src="${pageContext.request.contextPath}${sanPham.hinhAnh}" class="thumbnail-img active" alt="Thumb 1">

                            <%-- Ví dụ ảnh phụ (cần thay bằng logic lấy listAnhPhu nếu có) --%>
                            <c:if test="${not empty listAnhPhu}">
                                <c:forEach var="imgPhu" items="${listAnhPhu}" varStatus="loop">
                                    <img src="${pageContext.request.contextPath}${imgPhu}" class="thumbnail-img" alt="Thumb ${loop.index + 2}">
                                </c:forEach>
                            </c:if>
                            <%-- Ảnh demo nếu không có listAnhPhu --%>
                            <c:if test="${empty listAnhPhu}">
                                <img src="${pageContext.request.contextPath}/assets/image/demo/sp_detail_2.jpg" class="thumbnail-img" alt="Thumb 2">
                                <img src="${pageContext.request.contextPath}/assets/image/demo/sp_detail_3.jpg" class="thumbnail-img" alt="Thumb 3">
                                <img src="${pageContext.request.contextPath}/assets/image/demo/sp_detail_4.jpg" class="thumbnail-img" alt="Thumb 4">
                            </c:if>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <%-- Hiển thị tên sản phẩm --%>
                        <h2 class="product-detail-title">${sanPham.tenSanPham}</h2>

                        <div class="product-meta d-flex gap-4 mb-3">
                            <span>Thương hiệu: <a href="#">Thiên Long</a></span>
                            <span>Mã SP: <span class="text-dark">${sanPham.sanPhamId}</span></span>
                        </div>

                        <div class="price-detail-box">
                            <c:set var="giaMoi" value="${sanPham.giaKhuyenMai}" /> 
                            <c:set var="giaCu" value="${sanPham.giaBan}" />
                            <span class="sale-price"><fmt:formatNumber value="${giaMoi}" type="currency" currencySymbol="" minFractionDigits="0"/>₫</span>
                            <span class="old-price"><fmt:formatNumber value="${giaCu}" type="currency" currencySymbol="" minFractionDigits="0"/>₫</span>
                            <c:set var="phanTram" value="${(giaCu - giaMoi) * 100 / giaCu}" />
                            <span class="discount-badge-detail">GIẢM <fmt:formatNumber value="${phanTram / 100}" type="percent" minIntegerDigits="0"/></span>
                        </div>

                        <div class="product-options mt-4">
                            <h6 class="option-title">Phân loại:</h6>
                            <div class="option-list d-flex gap-2">
                                <button class="btn btn-option active">Mặc định</button>
                            </div>
                        </div>

                        <div class="product-quantity mt-4">
                            <h6 class="option-title">Số lượng:</h6>
                            <div class="quantity-input">
                                <button class="btn btn-qty" id="btnQtyMinus"><i class="bi bi-dash"></i></button>
                                <input type="text" id="qtyInput" value="1" readonly>
                                <button class="btn btn-qty" id="btnQtyPlus"><i class="bi bi-plus"></i></button>
                            </div>
                        </div>

                        <div class="action-buttons mt-4 d-flex gap-3">
                            <form action="them-vao-gio" method="POST" style="flex: 1;"> <%-- Ví dụ dùng form --%>
                                <input type="hidden" name="productId" value="${sanPham.sanPhamId}">
                                <input type="hidden" name="quantity" value="1"> <%-- Cần cập nhật bằng JS --%>
                                <button type="submit" class="btn btn-add-to-cart w-100">
                                    <i class="bi bi-cart-plus-fill"></i> Thêm vào giỏ
                                </button>
                            </form>
                            <form action="mua-ngay" method="POST" style="flex: 1;"> <%-- Ví dụ dùng form --%>
                                <input type="hidden" name="productId" value="${sanPham.sanPhamId}">
                                <input type="hidden" name="quantity" value="1"> <%-- Cần cập nhật bằng JS --%>
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
                                        Đánh Giá <%-- (Số lượng đánh giá nếu có) --%>
                                        <c:if test="${not empty listDanhGia}">(${listDanhGia.size()})</c:if>
                                        </button>
                                    </li>
                                </ul>
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
                                        <div class="tab-pane-content">
                                        <%-- Hiển thị mô tả sản phẩm --%>
                                        <p>${sanPham.moTa}</p>
                                        <%-- Thêm nội dung mô tả chi tiết nếu cần --%>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
                                    <div class="tab-pane-content">
                                        <c:if test="${not empty listDanhGia}">
                                            <p>Hiển thị ${listDanhGia.size()} đánh giá:</p>
                                            <%-- Dùng <c:forEach> để lặp qua listDanhGia --%>
                                            <ul>
                                                <c:forEach var="dg" items="${listDanhGia}">
                                                    <li>
                                                        <strong>Điểm: ${dg.diem}/5</strong> - ${dg.noiDung}
                                                        <br><small>(${dg.ngayDanhGia})</small> <%-- Cần format ngày --%>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </c:if>
                                        <c:if test="${empty listDanhGia}">
                                            <p>Chưa có đánh giá nào cho sản phẩm này.</p>
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