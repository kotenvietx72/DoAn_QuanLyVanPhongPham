package controller;

import dao.ChiTietGioHangDAO;
import dao.SanPhamDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import model.ChiTietGioHang;
import model.NguoiDung;
import model.SanPham;

@WebServlet("/thanh-toan")
public class ThanhToan extends HttpServlet {

    private ChiTietGioHangDAO gioHangDAO = new ChiTietGioHangDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        NguoiDung user = (NguoiDung) session.getAttribute("authUser");

        if (user == null) {
            response.sendRedirect("dang-nhap");
            return;
        }

        String mode = request.getParameter("mode");

        if ("buyNow".equals(mode)) {

            ChiTietGioHang item = (ChiTietGioHang) session.getAttribute("buyNowItem");
            Double subtotal = (Double) session.getAttribute("buyNowSubtotal");
            Double shipping = (Double) session.getAttribute("buyNowShipping");
            Double grandTotal = (Double) session.getAttribute("buyNowGrandTotal");

            if (item == null) {
                response.sendRedirect("loi.jsp");
                return;
            }

            request.setAttribute("cartItems", Arrays.asList(item));
            request.setAttribute("subtotal", subtotal);
            request.setAttribute("shippingCost", shipping);
            request.setAttribute("grandTotal", grandTotal);
            request.setAttribute("isBuyNow", true);

            request.getRequestDispatcher("view/thanhtoan.jsp").forward(request, response);
            return;
        }

        // ✅ MODE MẶC ĐỊNH → LẤY GIỎ HÀNG TỪ DATABASE
        int userId = user.getNguoiDungId();
        List<ChiTietGioHang> cartItems = gioHangDAO.getByNguoiDungId(userId);
        double subtotal = gioHangDAO.tinhTongTienGioHang(userId);

        double shippingCost = (subtotal < 50000 ? 30000
                : subtotal < 100000 ? 20000
                        : subtotal < 200000 ? 10000 : 0);

        double grandTotal = subtotal + shippingCost;

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("subtotal", subtotal);
        request.setAttribute("shippingCost", shippingCost);
        request.setAttribute("grandTotal", grandTotal);
        request.setAttribute("isBuyNow", false);
        session.setAttribute("BUY_NOW_ACTIVE", true);

        request.getRequestDispatcher("view/thanhtoan.jsp").forward(request, response);
    }

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

        // ✅ 1. BUY NOW
        if ("buyNow".equals(action)) {

            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            SanPhamDAO spDao = new SanPhamDAO();
            SanPham sp = spDao.getSanPhamById(productId);

            if (sp == null) {
                response.sendRedirect("loi.jsp");
                return;
            }

            double donGia = sp.getGiaKhuyenMai() > 0 ? sp.getGiaKhuyenMai() : sp.getGiaBan();
            double subtotal = donGia * quantity;

            double shippingCost = (subtotal < 50000 ? 30000
                    : subtotal < 100000 ? 20000
                            : subtotal < 200000 ? 10000 : 0);

            double grandTotal = subtotal + shippingCost;

            // ✅ LƯU ĐƠN BUY NOW VÀO SESSION
            ChiTietGioHang temp = new ChiTietGioHang();
            temp.setSanPham(sp);
            temp.setSoLuong(quantity);

            session.setAttribute("buyNowItem", temp);
            session.setAttribute("buyNowSubtotal", subtotal);
            session.setAttribute("buyNowShipping", shippingCost);
            session.setAttribute("buyNowGrandTotal", grandTotal);
            session.setAttribute("BUY_NOW_ACTIVE", true);

            response.sendRedirect("thanh-toan?mode=buyNow");
            return;
        }

        // ✅ 2. THANH TOÁN TỪ GIỎ HÀNG THẬT
        int userId = user.getNguoiDungId();
        double tongTien = Double.parseDouble(request.getParameter("tongTien"));

        double shippingCost = (tongTien < 50000 ? 30000
                : tongTien < 100000 ? 20000
                        : tongTien < 200000 ? 10000 : 0);

        double grandTotal = tongTien + shippingCost;

        List<ChiTietGioHang> cartItems = gioHangDAO.getByNguoiDungId(userId);

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("subtotal", tongTien);
        request.setAttribute("shippingCost", shippingCost);
        request.setAttribute("grandTotal", grandTotal);
        request.setAttribute("isBuyNow", false);

        request.getRequestDispatcher("view/thanhtoan.jsp").forward(request, response);
    }
}
