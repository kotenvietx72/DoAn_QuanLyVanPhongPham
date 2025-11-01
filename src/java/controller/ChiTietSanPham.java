package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.*;
import dao.SanPhamDAO;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/chi-tiet-san-pham")
public class ChiTietSanPham extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String idStr = request.getParameter("productId");

        // --- Kiểm tra ID ---
        if (idStr == null || idStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thiếu ID sản phẩm.");
            return;
        }

        try {
            int productId = Integer.parseInt(idStr); // Chuyển ID sang số nguyên
            SanPhamDAO sanPhamDAO = new SanPhamDAO();
            SanPham sanPham = sanPhamDAO.getSanPhamById(productId); // Gọi hàm lấy sản phẩm bằng ID

            // --- Kiểm tra kết quả ---
            if (sanPham == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy sản phẩm với ID = " + productId);
                return;
            }
            request.setAttribute("sanPham", sanPham);

            // --- Chuyển hướng đến file JSP ---
            request.getRequestDispatcher("view/chitietsanpham.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            // Nếu ID không phải là số hợp lệ
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID sản phẩm không hợp lệ: " + idStr);
        } catch (ServletException | IOException e) { // Các lỗi khác (ví dụ: lỗi kết nối CSDL)
            throw new ServletException("Lỗi khi lấy chi tiết sản phẩm", e);
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
