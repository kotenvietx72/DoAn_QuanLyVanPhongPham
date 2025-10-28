package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.*;
import dao.SanPhamDAO;

public class ChiTietSanPham extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String idStr = request.getParameter("id"); // Lấy ID từ URL (ví dụ: ?id=123)

        // --- Kiểm tra ID ---
        if (idStr == null || idStr.trim().isEmpty()) {
            // Nếu không có ID, báo lỗi hoặc chuyển về trang chủ
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thiếu ID sản phẩm.");
            // Hoặc: response.sendRedirect("trang-chu");
            return;
        }

        try {
            int productId = Integer.parseInt(idStr); // Chuyển ID sang số nguyên

            // --- Lấy dữ liệu từ DAO ---
            SanPhamDAO sanPhamDAO = new SanPhamDAO();
            SanPham sanPham = sanPhamDAO.getSanPhamById(productId); // Gọi hàm lấy sản phẩm bằng ID

            // --- Kiểm tra kết quả ---
            if (sanPham == null) {
                // Nếu không tìm thấy sản phẩm với ID này
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy sản phẩm với ID = " + productId);
                return;
            }

            // --- (Tùy chọn) Lấy dữ liệu liên quan khác ---
            // Ví dụ: Lấy danh sách đánh giá cho sản phẩm này
            // DanhGiaDAO danhGiaDAO = new DanhGiaDAO();
            // List<DanhGiaSanPham> listDanhGia = danhGiaDAO.getDanhGiaBySanPhamId(productId);
            // request.setAttribute("listDanhGia", listDanhGia);

            // --- Gửi dữ liệu sang JSP ---
            // Đặt đối tượng sanPham vào request attribute với tên là "sanPham"
            // Tên này PHẢI KHỚP với tên bạn dùng trong JSP: ${sanPham.tenSanPham}, ${sanPham.giaBan}, v.v.
            request.setAttribute("sanPham", sanPham);

            // --- Chuyển hướng đến file JSP ---
            request.getRequestDispatcher("chitietsanpham.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            // Nếu ID không phải là số hợp lệ
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID sản phẩm không hợp lệ: " + idStr);
        } catch (ServletException | IOException e) { // Các lỗi khác (ví dụ: lỗi kết nối CSDL)
            throw new ServletException("Lỗi khi lấy chi tiết sản phẩm", e);
            // Hoặc chuyển sang trang lỗi chung:
            // request.setAttribute("errorMessage", "Lỗi khi tải chi tiết sản phẩm.");
            // request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Phương thức POST không được hỗ trợ.");
    }
    
    @Override
    public String getServletInfo() {
        return "Servlet hiển thị chi tiết sản phẩm";
    }
}
