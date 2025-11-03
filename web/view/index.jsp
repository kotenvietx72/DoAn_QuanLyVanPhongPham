<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Trang chủ | Văn Phòng Phẩm 3AE</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <%-- HEADER (Giữ nguyên) --%>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary sticky-top">
            <div class="container-fluid">
                <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/trang-chu">
                    <img src="${pageContext.request.contextPath}/assets/image/logo.png" alt="Logo"> 3 Anh Em
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

                        <li class="nav-item">
                            <a class="nav-link" href="danh-muc?loaiId=1">
                                <i class="bi bi-pen-fill"></i> Bút - Viết
                            </a>
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
        <%-- KẾT THÚC HEADER --%>

        <div class="container mt-4">
            <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="${pageContext.request.contextPath}/assets/image/banner/banner1.jpg" class="d-block w-100" alt="Banner 1">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/assets/image/banner/banner2.jpg" class="d-block w-100" alt="Banner 2">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/assets/image/banner/banner3.jpg" class="d-block w-100" alt="Banner 3">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                </button>
            </div>
        </div>

        <div class="container mt-4">
            <div class="flash-sale-banner">
                <i class="bi bi-lightning-fill"></i>
                <h2 class="flash-sale-title">FLASH SALE</h2>
                <i class="bi bi-lightning-fill"></i>
            </div>

            <div class="row row-cols-2 row-cols-md-3 row-cols-lg-5 g-3 flash-sale-grid">
                <c:if test="${not empty listFlashSale}">
                    <c:forEach var="sp" items="${listFlashSale}">
                        <c:set var="giaMoi" value="${sp.giaKhuyenMai}" /> 
                        <c:set var="giaCu" value="${sp.giaBan}" />

                        <div class="col">
                            <div class="card h-100 flash-sale-card">
                                <a href="chi-tiet-san-pham?id=${sp.sanPhamId}">
                                    <img src="${pageContext.request.contextPath}${sp.hinhAnh}" class="card-img-top" alt="${sp.tenSanPham}">
                                </a>
                                <div class="card-body">
                                    <h6 class="card-title product-title">
                                        <a href="chi-tiet-san-pham?productId=${sp.sanPhamId}" class="text-decoration-none text-dark">
                                            ${sp.tenSanPham}
                                        </a>
                                    </h6>
                                    <div class="price-block mt-2">
                                        <span class="sale-price"><fmt:formatNumber value="${giaMoi}" type="currency" currencySymbol="" minFractionDigits="0"/>₫</span>
                                        <c:set var="phanTram" value="${(giaCu - giaMoi) * 100 / giaCu}" />
                                        <span class="discount-badge">-<fmt:formatNumber value="${phanTram / 100}" type="percent" minIntegerDigits="0"/></span>
                                    </div>
                                    <div class="old-price-block">
                                        <span class="old-price"><fmt:formatNumber value="${giaCu}" type="currency" currencySymbol="" minFractionDigits="0"/>₫</span>
                                    </div>
                                    <div class="rating-stars mt-2">
                                        <i class="bi bi-star"></i><i class="bi bi-star"></i><i class="bi bi-star"></i><i class="bi bi-star"></i><i class="bi bi-star"></i>
                                        <span class="rating-count">(0)</span>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <a href="chi-tiet-san-pham?productId=${sp.sanPhamId}&quantity=1" class="btn btn-add-cart w-100">THÊM VÀO GIỎ</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${empty listFlashSale}">
                    <div class="col-12">
                        <p class="text-center text-muted">Chưa có sản phẩm Flash Sale nào.</p>
                    </div>
                </c:if>
            </div>
        </div>

        <div class="container mt-5">
            <h3 class="text-center mb-4 text-primary fw-bold">DÀNH CHO BẠN</h3>

            <div class="row row-cols-2 row-cols-md-3 row-cols-lg-5 g-3">
                <c:if test="${not empty listSpecialProducts}">
                    <c:forEach var="sp" items="${listSpecialProducts}">
                        <c:set var="giaMoi" value="${sp.giaKhuyenMai}" />
                        <c:set var="giaCu" value="${sp.giaBan}" />

                        <div class="col">
                            <div class="card h-100 product-card-special">
                                <div class="product-tags">
                                </div>
                                <a href="chi-tiet-san-pham?id=${sp.sanPhamId}">
                                    <img src="${pageContext.request.contextPath}${sp.hinhAnh}" class="card-img-top" alt="${sp.tenSanPham}">
                                </a>
                                <div class="card-body">
                                    <h6 class="card-title product-title-special">
                                        <a href="chi-tiet-san-pham?productId=${sp.sanPhamId}" class="text-decoration-none text-dark">
                                            ${sp.tenSanPham}
                                        </a>
                                    </h6>
                                    <div class="rating-stars mt-2">
                                        <%-- Lấy giá trị trực tiếp từ hàm của SanPham --%>
                                        <c:set var="diemTB" value="${sp.diemTrungBinh}" /> 
                                        <c:set var="tongDG" value="${sp.tongDanhGia}" />

                                        <c:set var="diemTron" value="${Math.round(diemTB * 2) / 2.0}" />

                                        <c:forEach begin="1" end="5" var="i">
                                            <c:choose>
                                                <c:when test="${diemTron >= i}"><i class="bi bi-star-fill"></i></c:when>
                                                <c:when test="${diemTron >= (i - 0.5)}"><i class="bi bi-star-half"></i></c:when>
                                                <c:otherwise><i class="bi bi-star"></i></c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <span class="rating-count">(${tongDG})</span>
                                    </div>
                                    <div class="price-block-special mt-2">
                                        <span class="sale-price"><fmt:formatNumber value="${giaMoi}" type="currency" currencySymbol="" minFractionDigits="0"/>₫</span>

                                        <c:set var="phanTram" value="${(giaCu - giaMoi) * 100 / giaCu}" />
                                        <span class="discount-badge">-<fmt:formatNumber value="${phanTram / 100}" type="percent" minIntegerDigits="0"/></span>
                                    </div>
                                    <div class="old-price-block">
                                        <span class="old-price"><fmt:formatNumber value="${giaCu}" type="currency" currencySymbol="" minFractionDigits="0"/>₫</span>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <a href="chi-tiet-san-pham?productId=${sp.sanPhamId}" class="btn btn-quick-view w-100">
                                        <i class="bi bi-eye-fill"></i> XEM NHANH
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${empty listSpecialProducts}">
                    <div class="col-12">
                        <p class="text-center text-muted">Chưa có sản phẩm nào trong mục này.</p>
                    </div>
                </c:if>
            </div>
        </div>

        <%-- PASTE FOOTER CỦA BẠN VÀO ĐÂY --%>
        <footer class="site-footer pt-4 pb-3 mt-5">
            <div class="container text-center text-md-start">
                <div class="row">
                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto">
                        <a class="navbar-brand fw-bold mb-2" href="${pageContext.request.contextPath}/trang-chu">
                            <img src="${pageContext.request.contextPath}/assets/image/logo.png" alt="Logo"> VPP 3 Anh Em
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
                        <p><i class="bi bi-geo-alt-fill"></i> Lĩnh Nam - Hà Nội</p>
                        <p><i class="bi bi-envelope-fill"></i> support@3ae.vn</p>
                        <p><i class="bi bi-telephone-fill"></i> 0123 456 789</p>
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
        <%-- KẾT THÚC FOOTER --%>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>