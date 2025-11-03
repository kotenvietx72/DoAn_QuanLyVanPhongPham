<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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