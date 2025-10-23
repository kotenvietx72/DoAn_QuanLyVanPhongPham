<%@page contentType="text-html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <%-- Title sẽ thay đổi theo danh mục, ví dụ: "Bút bi | Văn Phòng Phẩm 3AE" --%>
        <title>${tenDanhMuc} | Văn Phòng Phẩm 3AE</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <%-- THÊM CSS MỚI CHO TRANG DANH MỤC --%>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/category-page.css">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary sticky-top">
            <div class="container-fluid">
                <a class="navbar-brand fw-bold" href="#">
                    <img src="${pageContext.request.contextPath}/assets/image/logo.png" alt="Logo" width="60"> 3AE
                </a>

                <form class="d-flex mx-auto w-50">
                    <input class="form-control me-2" type="search" placeholder="Tìm kiếm sản phẩm...">
                    <button class="btn btn-light" type="submit">
                        <i class="bi bi-search"></i>
                    </button>
                </form>

                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link text-white" href="#">Đăng nhập</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="#">Đăng ký</a></li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#">
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
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink1" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-pen-fill"></i> Bút - Viết
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink1">
                                <li><a class="dropdown-item" href="#">Bút bi</a></li>
                                <li><a class="dropdown-item" href="#">Bút chì</a></li>
                                <li><a class="dropdown-item" href="#">Bút highlight</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink2" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-book-half"></i> Sổ - Vở
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink2">
                                <li><a class="dropdown-item" href="#">Sổ tay</a></li>
                                <li><a class="dropdown-item" href="#">Vở học sinh</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="bi bi-rulers"></i> Dụng cụ học sinh</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="bi bi-folder2-open"></i> Dụng cụ văn phòng</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="bi bi-palette-fill"></i> Dụng cụ mỹ thuật</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container category-container my-4">

            <nav aria-label="breadcrumb" class="mb-4">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">${tenDanhMuc}</li>
                </ol>
            </nav>

            <div class="row">
                <div class="col-lg-3">
                    <div class="filter-sidebar">
                        <h5 class="filter-title">LỌC SẢN PHẨM</h5>

                        <div class="filter-section">
                            <h6>Loại sản phẩm</h6>
                            <ul class="list-unstyled filter-list">
                                <li>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="catCheck1">
                                        <label class="form-check-label" for="catCheck1">
                                            Bút gel
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="catCheck2" checked> <%-- Ví dụ đang chọn Bút bi --%>
                                        <label class="form-check-label" for="catCheck2">
                                            Bút bi
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="catCheck3">
                                        <label class="form-check-label" for="catCheck3">
                                            Bút lông bảng
                                        </label>
                                    </div>
                                </li>
                                <%-- (Thêm các loại khác) --%>
                            </ul>
                        </div>

                        <div class="filter-section">
                            <h6>Mức giá</h6>
                            <ul class="list-unstyled filter-list">
                                <li>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="priceRange" id="priceRadio1">
                                        <label class="form-check-label" for="priceRadio1">
                                            Giá dưới 100.000đ
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="priceRange" id="priceRadio2">
                                        <label class="form-check-label" for="priceRadio2">
                                            100.000đ - 300.000đ
                                        </label>
                                    </div>
                                </li>
                                <%-- (Thêm các khoảng giá khác) --%>
                            </ul>
                        </div>

                        <div class="filter-section">
                            <h6>Màu sắc</h6>
                            <div class="color-filter d-flex flex-wrap gap-2">
                                <span class="color-dot" style="background-color: black;" title="Đen"></span>
                                <span class="color-dot active" style="background-color: blue;" title="Xanh dương"></span>
                                <span class="color-dot" style="background-color: red;" title="Đỏ"></span>
                                <span class="color-dot" style="background-color: green;" title="Xanh lá"></span>
                                <%-- (Thêm các màu khác) --%>
                            </div>
                        </div>

                        <button class="btn btn-primary w-100 mt-3">Áp dụng</button>

                    </div>
                </div>

                <div class="col-lg-9">

                    <%-- Banner danh mục (Tùy chọn, giống thienlong) --%>
                    <img src="${pageContext.request.contextPath}/assets/image/banner/category_banner_butbi.jpg" class="img-fluid category-banner mb-4" alt="Banner ${tenDanhMuc}">

                    <h1 class="category-title">${tenDanhMuc}</h1>

                    <div class="sorting-options d-flex align-items-center mb-3">
                        <span>Sắp xếp:</span>
                        <button class="btn btn-sort active">Phổ biến</button>
                        <button class="btn btn-sort">Mới nhất</button>
                        <button class="btn btn-sort">Giá tăng dần</button>
                        <button class="btn btn-sort">Giá giảm dần</button>
                    </div>

                    <div class="row row-cols-2 row-cols-md-3 row-cols-lg-4 g-3"> <%-- Thường là 4 cột ở đây --%>

                        <%-- DÙNG LẠI CODE CARD SẢN PHẨM TỪ TRANG INDEX --%>
                        <%-- (Bạn copy code <div class="col">...</div> từ phần "DÀNH CHO BẠN" ở index.jsp) --%>

                        <c:forEach var="sp" items="${listSanPhamTheoDanhMuc}">
                            <div class="col">
                                <div class="card h-100 product-card-special"> <%-- Dùng lại class cũ --%>
                                    <div class="product-tags">
                                        <%-- (Logic hiển thị tag New/Sale...) --%>
                                    </div>
                                    <a href="chi-tiet-san-pham?id=${sp.sanPhamId}">
                                        <img src="${sp.hinhAnh}" class="card-img-top" alt="${sp.tenSanPham}">
                                    </a>
                                    <div class="card-body">
                                        <h6 class="card-title product-title-special">
                                            <a href="chi-tiet-san-pham?id=${sp.sanPhamId}" class="text-decoration-none text-dark">
                                                ${sp.tenSanPham}
                                            </a>
                                        </h6>
                                        <div class="rating-stars mt-2">
                                            <%-- (Code sao đánh giá) --%>
                                        </div>
                                        <div class="price-block-special mt-2">
                                            <span class="sale-price"><fmt:formatNumber value="${sp.giaBan}" type="currency" currencySymbol="" minFractionDigits="0"/>₫</span>
                                            <%-- (Logic tính % giảm giá) --%>
                                            <c:if test="${sp.giaGoc > sp.giaBan}">
                                                <c:set var="discountPercent" value="${(sp.giaGoc - sp.giaBan) * 100 / sp.giaGoc}" />
                                                <span class="discount-badge">-<fmt:formatNumber value="${discountPercent / 100}" type="percent" minIntegerDigits="0"/></span>
                                            </c:if>
                                        </div>
                                        <div class="old-price-block">
                                            <c:if test="${sp.giaGoc > sp.giaBan}">
                                                <span class="old-price"><fmt:formatNumber value="${sp.giaGoc}" type="currency" currencySymbol="" minFractionDigits="0"/>₫</span>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <a href="chi-tiet-san-pham?id=${sp.sanPhamId}" class="btn btn-quick-view w-100">
                                            <i class="bi bi-eye-fill"></i> XEM NHANH
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach> <%-- Kết thúc vòng lặp sản phẩm --%>

                    </div> <%-- Kết thúc lưới sản phẩm --%>

                    <nav aria-label="Page navigation example" class="mt-4 d-flex justify-content-center">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="#">Trước</a></li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">Sau</a></li>
                        </ul>
                    </nav>

                </div> <%-- Kết thúc cột sản phẩm --%>
            </div> <%-- Kết thúc .row chính --%>
        </div> <%-- Kết thúc .container --%>
        <footer class="site-footer pt-4 pb-3 mt-5">
            <div class="container text-center text-md-start">
                <div class="row">
                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                        <a class="navbar-brand fw-bold mb-2" href="#">
                            <img src="${pageContext.request.contextPath}/assets/image/logo.png" alt="Logo" width="60"> VPP 3AE
                        </a>
                        <p>
                            Chuyên cung cấp các sản phẩm văn phòng phẩm, dụng cụ học sinh
                            chính hãng, chất lượng cao.
                        </p>
                    </div>

                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                        <h6 class="text-uppercase fw-bold mb-4">
                            Chính sách
                        </h6>
                        <p><a href="#!">Chính sách bảo mật</a></p>
                        <p><a href="#!">Chính sách đổi trả</a></p>
                        <p><a href="#!">Chính sách giao hàng</a></p>
                    </div>

                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                        <h6 class="text-uppercase fw-bold mb-4">
                            Liên kết
                        </h6>
                        <p><a href="#!">Về chúng tôi</a></p>
                        <p><a href="#!">Cửa hàng</a></p>
                        <p><a href="#!">Hỗ trợ</a></p>
                    </div>

                    <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
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
        <%-- (Có thể cần thêm file JS riêng nếu bạn làm bộ lọc động) --%>
    </body>
</html>