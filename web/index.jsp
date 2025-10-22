<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Trang chủ | Văn Phòng Phẩm 3AE</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary sticky-top">
            <div class="container-fluid">
                <a class="navbar-brand fw-bold" href="#">
                    <img src="${pageContext.request.contextPath}/assets/image/logo.png" alt="Logo" width="40"> 3AE
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

        <div class="container mt-5">
            <div class="flash-sale-banner">
                <i class="bi bi-lightning-fill"></i>
                <h2 class="flash-sale-title">FLASH SALE</h2>
                <i class="bi bi-lightning-fill"></i>
            </div>

            <div class="row row-cols-2 row-cols-md-3 row-cols-lg-5 g-3 flash-sale-grid">

                <%-- GIẢ SỬ BẠN CÓ: <c:forEach var="sp" items="${listFlashSale}"> --%>
                <%-- VÍ DỤ MẪU (Bạn sẽ thay bằng vòng lặp <c:forEach>) --%>

                <div class="col">
                    <div class="card h-100 flash-sale-card">
                        <div class="sold-badge">Đã bán 100+</div>

                        <img src="${pageContext.request.contextPath}/assets/image/demo/sp1.jpg" class="card-img-top" alt="Tên sản phẩm">

                        <div class="card-body">
                            <h6 class="card-title product-title">Combo 5 Bút bi Thiên Long 0.5mm</h6>

                            <div class="price-block mt-2">
                                <span class="sale-price">32.000₫</span>

                                <%-- 
                                <c:set var="discount" value="${(sp.giaGoc - sp.giaBan) / sp.giaGoc}" />
                                <span class="discount-badge">
                                    -<fmt:formatNumber value="${discount}" type="percent" />
                                </span> 
                                --%>
                                <span class="discount-badge">-40%</span>
                            </div>
                            <div class="old-price-block">
                                <span class="old-price">50.000₫</span>
                            </div>

                            <div class="rating-stars mt-2">
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-half"></i>
                                <span class="rating-count">(18)</span>
                            </div>
                        </div>

                        <div class="card-footer">
                            <a href="#" class="btn btn-add-cart w-100">THÊM VÀO GIỎ</a>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 flash-sale-card">
                        <div class="sold-badge">Đã bán 50+</div>
                        <img src="${pageContext.request.contextPath}/assets/image/demo/sp2.jpg" class="card-img-top" alt="Tên sản phẩm">
                        <div class="card-body">
                            <h6 class="card-title product-title">Bút gel Quick Dry 0.7mm</h6>
                            <div class="price-block mt-2">
                                <span class="sale-price">43.500₫</span>
                                <span class="discount-badge">-25%</span>
                            </div>
                            <div class="old-price-block">
                                <span class="old-price">58.000₫</span>
                            </div>
                            <div class="rating-stars mt-2">
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <span class="rating-count">(32)</span>
                            </div>
                        </div>
                        <div class="card-footer">
                            <a href="#" class="btn btn-add-cart w-100">THÊM VÀO GIỎ</a>
                        </div>
                    </div>
                </div>

                <%-- (Thêm 3 sản phẩm ví dụ nữa cho đủ 5) --%>

                <div class="col">
                    <div class="card h-100 flash-sale-card">
                        <img src="${pageContext.request.contextPath}/assets/image/demo/sp3.jpg" class="card-img-top" alt="Tên sản phẩm">
                        <div class="card-body">
                            <h6 class="card-title product-title">Combo 10 Vở 96 trang 4 ô ly</h6>
                            <div class="price-block mt-2">
                                <span class="sale-price">89.000₫</span>
                                <span class="discount-badge">-10%</span>
                            </div>
                            <div class="old-price-block">
                                <span class="old-price">99.000₫</span>
                            </div>
                            <div class="rating-stars mt-2">
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star"></i>
                                <span class="rating-count">(8)</span>
                            </div>
                        </div>
                        <div class="card-footer">
                            <a href="#" class="btn btn-add-cart w-100">THÊM VÀO GIỎ</a>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 flash-sale-card">
                        <div class="sold-badge">Đã bán 200+</div>
                        <img src="${pageContext.request.contextPath}/assets/image/demo/sp4.jpg" class="card-img-top" alt="Tên sản phẩm">
                        <div class="card-body">
                            <h6 class="card-title product-title">Sáp màu Colokit 12 màu</h6>
                            <div class="price-block mt-2">
                                <span class="sale-price">25.000₫</span>
                                <span class="discount-badge">-30%</span>
                            </div>
                            <div class="old-price-block">
                                <span class="old-price">35.000₫</span>
                            </div>
                            <div class="rating-stars mt-2">
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-half"></i>
                                <span class="rating-count">(45)</span>
                            </div>
                        </div>
                        <div class="card-footer">
                            <a href="#" class="btn btn-add-cart w-100">THÊM VÀO GIỎ</a>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 flash-sale-card">
                        <img src="${pageContext.request.contextPath}/assets/image/demo/sp5.jpg" class="card-img-top" alt="Tên sản phẩm">
                        <div class="card-body">
                            <h6 class="card-title product-title">Bút chì gỗ 2B (Hộp 12 cây)</h6>
                            <div class="price-block mt-2">
                                <span class="sale-price">30.000₫</span>
                                <span class="discount-badge">-15%</span>
                            </div>
                            <div class="old-price-block">
                                <span class="old-price">35.000₫</span>
                            </div>
                            <div class="rating-stars mt-2">
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <span class="rating-count">(99+)</span>
                            </div>
                        </div>
                        <div class="card-footer">
                            <a href="#" class="btn btn-add-cart w-100">THÊM VÀO GIỎ</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="container mt-5"> <%-- Thêm lề mt-5 để tách biệt với Flash Sale --%>

            <h3 class="text-center mb-4 text-primary fw-bold">DÀNH CHO BẠN</h3>

            <div class="row row-cols-2 row-cols-md-3 row-cols-lg-5 g-3">

                <%-- Bạn sẽ dùng vòng lặp <c:forEach> của mình ở đây, ví dụ:
                <c:forEach var="sp" items="${listSpecialProducts}"> 
                --%>

                <div class="col">
                    <div class="card h-100 product-card-special">
                        <div class="product-tags">
                            <span class="product-tag tag-new"><i class="bi bi-star-fill"></i> New</span>
                            <span class="product-tag tag-sold"><i class="bi bi-person-check-fill"></i> Đã bán 21</span>
                        </div>
                        <img src="${pageContext.request.contextPath}/assets/image/demo/sp_special_1.jpg" class="card-img-top" alt="Bút máy Thiên Long">
                        <div class="card-body">
                            <h6 class="card-title product-title-special">Bút máy luyện viết chữ đẹp Thiên Long, ngòi mài...</h6>
                            <div class="rating-stars mt-2">
                                <i class="bi bi-star"></i><i class="bi bi-star"></i><i class="bi bi-star"></i><i class="bi bi-star"></i><i class="bi bi-star"></i>
                                <span class="rating-count">(0)</span>
                            </div>
                            <div class="price-block-special mt-2">
                                <span class="sale-price">48.500₫</span>
                                <span class="discount-badge">-50%</span>
                            </div>
                            <div class="old-price-block">
                                <span class="old-price">97.000₫</span>
                            </div>
                        </div>
                        <div class="card-footer">
                            <a href="#" class="btn btn-quick-view w-100">
                                <i class="bi bi-eye-fill"></i> XEM NHANH
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 product-card-special">
                        <div class="product-tags">
                            <span class="product-tag tag-sold"><i class="bi bi-person-check-fill"></i> Đã bán 36</span>
                        </div>
                        <img src="${pageContext.request.contextPath}/assets/image/demo/sp_special_2.jpg" class="card-img-top" alt="Bút gel Quick Dry">
                        <div class="card-body">
                            <h6 class="card-title product-title-special">Combo 20 Bút gel Quick Dry Thiên Long GEL-040</h6>
                            <div class="rating-stars mt-2">
                                <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-half"></i><i class="bi bi-star"></i>
                                <span class="rating-count">(5)</span>
                            </div>
                            <div class="price-block-special mt-2">
                                <span class="sale-price">116.000₫</span>
                                <span class="discount-badge">-50%</span>
                            </div>
                            <div class="old-price-block">
                                <span class="old-price">232.000₫</span>
                            </div>
                        </div>
                        <div class="card-footer">
                            <a href="#" class="btn btn-quick-view w-100">
                                <i class="bi bi-eye-fill"></i> XEM NHANH
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 product-card-special">
                        <div class="product-tags">
                            <span class="product-tag tag-sold"><i class="bi bi-person-check-fill"></i> Đã bán 50+</span>
                        </div>
                        <img src="${pageContext.request.contextPath}/assets/image/demo/sp_special_3.jpg" class="card-img-top" alt="Vở 4 ô ly">
                        <div class="card-body">
                            <h6 class="card-title product-title-special">Combo 10 Vở 96 trang 4 ô ly (Giấy dày)</h6>
                            <div class="rating-stars mt-2">
                                <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star"></i>
                                <span class="rating-count">(22)</span>
                            </div>
                            <div class="price-block-special mt-2">
                                <span class="sale-price">85.000₫</span>
                                <span class="discount-badge">-15%</span>
                            </div>
                            <div class="old-price-block">
                                <span class="old-price">100.000₫</span>
                            </div>
                        </div>
                        <div class="card-footer">
                            <a href="#" class="btn btn-quick-view w-100">
                                <i class="bi bi-eye-fill"></i> XEM NHANH
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 product-card-special">
                        <div class="product-tags">
                            <span class="product-tag tag-new"><i class="bi bi-star-fill"></i> New</span>
                            <span class="product-tag tag-sold"><i class="bi bi-person-check-fill"></i> Đã bán 120</span>
                        </div>
                        <img src="${pageContext.request.contextPath}/assets/image/demo/sp_special_4.jpg" class="card-img-top" alt="Bút xóa được">
                        <div class="card-body">
                            <h6 class="card-title product-title-special">Bút gel xóa được Mazic Thiên Long</h6>
                            <div class="rating-stars mt-2">
                                <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                <span class="rating-count">(99+)</span>
                            </div>
                            <div class="price-block-special mt-2">
                                <span class="sale-price">29.250₫</span>
                                <span class="discount-badge">-35%</span>
                            </div>
                            <div class="old-price-block">
                                <span class="old-price">45.000₫</span>
                            </div>
                        </div>
                        <div class="card-footer">
                            <a href="#" class="btn btn-quick-view w-100">
                                <i class="bi bi-eye-fill"></i> XEM NHANH
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 product-card-special">
                        <div class="product-tags">
                            <span class="product-tag tag-trial"><i class="bi bi-patch-check-fill"></i> Gói dùng thử</span>
                        </div>
                        <img src="${pageContext.request.contextPath}/assets/image/demo/sp_special_5.jpg" class="card-img-top" alt="Bút gel Minimalist">
                        <div class="card-body">
                            <h6 class="card-title product-title-special">Combo 10 Bút gel Minimalist Thiên Long</h6>
                            <div class="rating-stars mt-2">
                                <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-half"></i>
                                <span class="rating-count">(81)</span>
                            </div>
                            <div class="price-block-special mt-2">
                                <span class="sale-price">69.000₫</span>
                                <span class="discount-badge">-41%</span>
                            </div>
                            <div class="old-price-block">
                                <span class="old-price">116.000₫</span>
                            </div>
                        </div>
                        <div class="card-footer">
                            <a href="#" class="btn btn-quick-view w-100">
                                <i class="bi bi-eye-fill"></i> XEM NHANH
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 product-card-special">
                        <div class="product-tags">
                            <span class="product-tag tag-sold"><i class="bi bi-person-check-fill"></i> Đã bán 300+</span>
                        </div>
                        <img src="${pageContext.request.contextPath}/assets/image/demo/sp_special_6.jpg" class="card-img-top" alt="Sáp màu">
                        <div class="card-body">
                            <h6 class="card-title product-title-special">Sáp màu Colokit 12 màu (An toàn)</h6>
                            <div class="rating-stars mt-2">
                                <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                <span class="rating-count">(150)</span>
                            </div>
                            <div class="price-block-special mt-2">
                                <span class="sale-price">25.000₫</span>
                                <span class="discount-badge">-30%</span>
                            </div>
                            <div class="old-price-block">
                                <span class="old-price">35.000₫</span>
                            </div>
                        </div>
                        <div class="card-footer">
                            <a href="#" class="btn btn-quick-view w-100">
                                <i class="bi bi-eye-fill"></i> XEM NHANH
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 product-card-special">
                        <div class="product-tags">
                            <span class="product-tag tag-new"><i class="bi bi-star-fill"></i> New</span>
                        </div>
                        <img src="${pageContext.request.contextPath}/assets/image/demo/sp_special_7.jpg" class="card-img-top" alt="Bút chì 2B">
                        <div class="card-body">
                            <h6 class="card-title product-title-special">
                                <a href="chi-tiet-san-pham?id=${sp.sanPhamId}" class="text-decoration-none text-dark">
                                    ${sp.tenSanPham}
                                </a>
                            </h6>
                            <div class="rating-stars mt-2">
                                <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-half"></i>
                                <span class="rating-count">(45)</span>
                            </div>
                            <div class="price-block-special mt-2">
                                <span class="sale-price">30.000₫</span>
                                <span class="discount-badge">-15%</span>
                            </div>
                            <div class="old-price-block">
                                <span class="old-price">35.000₫</span>
                            </div>
                        </div>
                        <div class="card-footer">
                            <a href="#" class="btn btn-quick-view w-100">
                                <i class="bi bi-eye-fill"></i> XEM NHANH
                            </a>
                        </div>
                    </div>
                </div>
            </div> 
        </div> 

        <footer class="site-footer pt-4 pb-3 mt-5">
            <div class="container text-center text-md-start">
                <div class="row">
                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                        <a class="navbar-brand fw-bold mb-2" href="#">
                            <img src="${pageContext.request.contextPath}/assets/image/logo.png" alt="Logo"> VPP 3AE
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
    </body>
</html>