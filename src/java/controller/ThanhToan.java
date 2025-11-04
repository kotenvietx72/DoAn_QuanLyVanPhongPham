package controller;

import dao.ChiTietGioHangDAO;
import dao.SanPhamDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import model.ChiTietGioHang;
import model.NguoiDung;
import model.SanPham;

@WebServlet("/thanh-toan")
public class ThanhToan extends HttpServlet {

    private ChiTietGioHangDAO gioHangDAO = new ChiTietGioHangDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        NguoiDung user = (NguoiDung) session.getAttribute("authUser");
        if (user == null) {
            response.sendRedirect("dang-nhap");
            return;
        }

        String action = request.getParameter("action");

        if ("buyNow".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            // Lấy thông tin sản phẩm trực tiếp từ DB
            SanPhamDAO spDao = new SanPhamDAO();
            SanPham sp = spDao.getSanPhamById(productId);

            if (sp == null) {
                response.sendRedirect("loi.jsp");
                return;
            }

            // Tạo 1 đối tượng ChiTietGioHang tạm để truyền sang JSP
            ChiTietGioHang temp = new ChiTietGioHang();
            temp.setSanPham(sp);
            temp.setSoLuong(quantity);

            double subtotal = sp.getGiaBan() * quantity;
            double shippingCost = subtotal < 100000 ? 20000 : 0;
            double grandTotal = subtotal + shippingCost;

            // Gửi sang JSP
            request.setAttribute("cartItems", java.util.Arrays.asList(temp));
            request.setAttribute("subtotal", subtotal);
            request.setAttribute("shippingCost", shippingCost);
            request.setAttribute("grandTotal", grandTotal);

            request.getRequestDispatcher("view/thanhtoan.jsp").forward(request, response);
            return;
        }

        int userId = user.getNguoiDungId();
        double tongTien = Double.parseDouble(request.getParameter("tongTien"));
        double shippingCost;

        if (tongTien < 50000) {
            shippingCost = 30000;
        } else if (tongTien < 100000) {
            shippingCost = 20000;
        } else if (tongTien < 200000) {
            shippingCost = 10000;
        } else {
            shippingCost = 0;
        }

        double grandTotal = tongTien + shippingCost;

        // Lấy lại danh sách sản phẩm trong giỏ để hiển thị
        List<ChiTietGioHang> cartItems = gioHangDAO.getByNguoiDungId(userId);

        // Gửi dữ liệu sang trang thanh toán
        request.setAttribute("cartItems", cartItems);
        request.setAttribute("grandTotal", grandTotal);
        request.setAttribute("subtotal", tongTien);
        request.setAttribute("shippingCost", shippingCost);

        request.getRequestDispatcher("view/thanhtoan.jsp").forward(request, response);
    }
}
