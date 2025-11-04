package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

import model.SanPham;
import dao.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = {"/Home"})
public class Home extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        try {
            SanPhamDAO sanPhamDAO = new SanPhamDAO();

            // 1. Lấy danh sách sản phẩm Flash Sale (ví dụ: 5 sản phẩm)
            ArrayList<SanPham> listFlashSale = sanPhamDAO.getSanPhamFlashSale(5);

            // 2. Lấy danh sách sản phẩm "Dành cho bạn" (ví dụ: 7 sản phẩm)
            ArrayList<SanPham> listSpecialProducts = sanPhamDAO.getSanPhamDacBiet(20);

            // --- Gửi dữ liệu sang JSP ---
            request.setAttribute("listFlashSale", listFlashSale);
            request.setAttribute("listSpecialProducts", listSpecialProducts);

            // --- Chuyển hướng đến file JSP để hiển thị ---
            request.getRequestDispatcher("view/index.jsp").forward(request, response);

        } catch (ServletException | IOException e) {
            throw new ServletException("Lỗi khi xử lý trang chủ", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Servlet xử lí hiển thị trang chủ";
    }
}
