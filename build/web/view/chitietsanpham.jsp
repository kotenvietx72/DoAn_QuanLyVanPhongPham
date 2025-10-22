<%@page contentType="text-html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>${sanPham.tenSanPham} | Văn Phòng Phẩm 3AE</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/product-detail.css">
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

        <div class="container product-detail-container my-5">
            <div class="row">

                <div class="col-lg-5">
                    <div class="main-image-wrapper mb-3">
                        <img src="${pageContext.request.contextPath}/assets/image/demo/sp_special_1.jpg" 
                             id="mainProductImage" 
                             class="img-fluid" 
                             alt="${sanPham.tenSanPham}">
                    </div>

                    <div class="thumbnail-list d-flex gap-2">
                        <%-- Giả sử bạn có list ảnh phụ: <c:forEach var="img" items="${sanPham.listHinhAnhPhu}"> --%>
                        <img src="${pageContext.request.contextPath}/assets/image/demo/sp_special_1.jpg" class="thumbnail-img active" alt="Thumb 1">
                        <img src="${pageContext.request.contextPath}/assets/image/demo/sp_detail_2.jpg" class="thumbnail-img" alt="Thumb 2">
                        <img src="${pageContext.request.contextPath}/assets/image/demo/sp_detail_3.jpg" class="thumbnail-img" alt="Thumb 3">
                        <img src="${pageContext.request.contextPath}/assets/image/demo/sp_detail_4.jpg" class="thumbnail-img" alt="Thumb 4">
                        <%-- </c:forEach> --%>
                    </div>
                </div>

                <div class="col-lg-4">
                    <h2 class="product-detail-title">Bút máy luyện viết chữ đẹp Thiên Long (Tên mẫu)</h2>

                    <div class="product-meta d-flex gap-4 mb-3">
                        <span>Thương hiệu: <a href="#">Thiên Long</a></span>
                        <span>Mã SKU: <span class="text-dark">5003885265</span></span>
                    </div>

                    <div class="price-detail-box">
                        <span class="sale-price">48.500₫</span>
                        <span class="old-price">97.000₫</span>
                        <span class="discount-badge-detail">GIẢM 50%</span>
                    </div>

                    <div class="product-options mt-4">
                        <h6 class="option-title">Phân loại:</h6>
                        <div class="option-list d-flex gap-2">
                            <button class="btn btn-option active">Combo 5</button>
                            <button class="btn btn-option">Combo 10</button>
                            <button class="btn btn-option">Combo 20</button>
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
                        <button class="btn btn-add-to-cart w-100">
                            <i class="bi bi-cart-plus-fill"></i> Thêm vào giỏ
                        </button>
                        <button class="btn btn-buy-now w-100">
                            Mua ngay
                        </button>
                    </div>
                </div>

                <div class="col-lg-3">
                    <div class="voucher-list-wrapper">
                        <div class="voucher-item">
                            <div class="voucher-icon">EK</div>
                            <div class="voucher-info">
                                <span class="voucher-title">Giảm 50.000đ</span>
                                <span class="voucher-condition">Đơn hàng từ 300.000đ</span>
                                <span class="voucher-code">Mã: <strong>3AESALE50K</strong></span>
                            </div>
                            <button class="btn btn-copy-code">Sao chép</button>
                        </div>
                        <div class="voucher-item">
                            <div class="voucher-icon">EK</div>
                            <div class="voucher-info">
                                <span class="voucher-title">Giảm 15% (tối đa 30K)</span>
                                <span class="voucher-condition">Đơn hàng từ 100.000đ</span>
                                <span class="voucher-code">Mã: <strong>3AESALE15</strong></span>
                            </div>
                            <button class="btn btn-copy-code">Sao chép</button>
                        </div>
                    </div>
                </div>
            </div> <div class="row mt-5">
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
                                    Đánh Giá (3)
                                </button>
                            </li>
                        </ul>

                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
                                <div class="tab-pane-content">
                                    <p>Đây là phần mô tả chi tiết của sản phẩm. Bạn có thể dùng JSTL để in biến `${sanPham.moTa}` ra đây.</p>
                                    <p><strong>Tính năng nổi bật:</strong></p>
                                    <ul>
                                        <li>Ngòi mài êm, viết trơn.</li>
                                        <li>Sử dụng công nghệ mực mới, màu sắc tươi sáng.</li>
                                        <li>Thân bút thiết kế vừa tay.</li>
                                    </ul>
                                    <img src="${pageContext.request.contextPath}/assets/image/demo/sp_detail_2.jpg" class="img-fluid my-3" alt="Mô tả">
                                </div>
                            </div>
                            <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
                                <div class="tab-pane-content">
                                    <p>Khu vực này hiển thị các đánh giá của khách hàng.</p>
                                </div>
                            </div>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/product-detail.js"></script>
    </body>
</html>