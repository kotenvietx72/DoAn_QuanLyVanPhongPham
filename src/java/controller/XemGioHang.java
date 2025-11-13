package controller;

import dao.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import model.ChiTietGioHang;
import model.NguoiDung;

@WebServlet("/xem-gio-hang")
public class XemGioHang extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        NguoiDung authUser = (NguoiDung) session.getAttribute("authUser");

        if (authUser == null) {
            response.sendRedirect("dang-nhap");
            return;
        }

        int userId = authUser.getNguoiDungId();
        ChiTietGioHangDAO dao = new ChiTietGioHangDAO();

        List<ChiTietGioHang> cartItems = dao.getByNguoiDungId(userId);
        double cartTotal = dao.tinhTongTienGioHang(userId);

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("cartTotal", cartTotal);

        request.getRequestDispatcher("view/giohang.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
