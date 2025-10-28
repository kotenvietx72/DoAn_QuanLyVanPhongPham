package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.*;
import dao.*;
import java.util.ArrayList;

public class DanhMucSanPham extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // 1. Lấy mã danh mục từ URL (ví dụ: ?loai=but-bi)
        String loaiIdentifier = request.getParameter("loai"); // Lấy giá trị của tham số 'loai'

        // --- Kiểm tra tham số ---
        if (loaiIdentifier == null || loaiIdentifier.trim().isEmpty()) {
            // Nếu không có tham số 'loai', có thể chuyển về trang chủ hoặc báo lỗi
            response.sendRedirect("trang-chu");
            return;
        }

        try {
            // --- Khởi tạo DAO ---
            SanPhamDAO sanPhamDAO = new SanPhamDAO();
            LoaiSanPhamDAO loaiSanPhamDAO = new LoaiSanPhamDAO(); // Để lấy tên Loại

            // --- Lấy thông tin Loại Sản Phẩm ---
            // Giả sử bạn có hàm lấy LoaiSanPham dựa vào identifier (ví dụ: "but-bi")
            // Hoặc bạn cần chuyển identifier thành ID rồi gọi hàm getLoaiSanPhamById(id)
            LoaiSanPham loaiSP = loaiSanPhamDAO.getLoaiSanPhamByIdentifier(loaiIdentifier); // Thay hàm này bằng hàm của bạn

            String tenDanhMuc = "Sản phẩm"; // Tên mặc định nếu không tìm thấy loại
            int loaiId = -1; // ID mặc định
            if (loaiSP != null) {
                tenDanhMuc = loaiSP.getTenLoai(); // Lấy tên đúng (ví dụ: "Bút bi")
                loaiId = loaiSP.getLoaiId(); // Lấy ID để truy vấn sản phẩm
            } else {
                 // Xử lý trường hợp không tìm thấy loại SP với identifier này (ví dụ: báo lỗi)
                 System.out.println("Không tìm thấy loại sản phẩm: " + loaiIdentifier);
                 // Có thể chuyển về trang chủ hoặc trang lỗi
                 response.sendRedirect("trang-chu");
                 return;
            }


            // --- Lấy danh sách sản phẩm thuộc danh mục đó ---
            // Giả sử bạn có hàm lấy SanPham theo loaiId
            ArrayList<SanPham> listSanPhamTheoDanhMuc = sanPhamDAO.getSanPhamByLoaiId(loaiId); // Thay hàm này bằng hàm của bạn

            // --- Gửi dữ liệu sang JSP ---
            request.setAttribute("tenDanhMuc", tenDanhMuc); // Gửi tên danh mục (ví dụ: "Bút bi")
            request.setAttribute("listSanPhamTheoDanhMuc", listSanPhamTheoDanhMuc); // Gửi danh sách sản phẩm

            // --- (Tùy chọn) Gửi thêm dữ liệu lọc ---
            // Ví dụ: Lấy danh sách tất cả Loại Sản Phẩm để hiển thị trong bộ lọc sidebar
            // List<LoaiSanPham> allLoaiSP = loaiSanPhamDAO.getAllLoaiSanPham();
            // request.setAttribute("allLoaiSP", allLoaiSP);

            // --- Chuyển hướng đến file JSP ---
            request.getRequestDispatcher("danhmucsanpham.jsp").forward(request, response);

        } catch (ServletException | IOException e) {
            throw new ServletException("Lỗi khi tải trang danh mục", e);
            // Hoặc chuyển sang trang lỗi
            // request.setAttribute("errorMessage", "Lỗi khi tải danh mục sản phẩm.");
            // request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Servlet hiển thị sản phẩm theo danh mục";
    }
}
