package controller;

import dao.NguoiDungDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.NguoiDung;

import java.io.IOException;

// Map servlet với URL "dang-nhap" mà form đã POST
@WebServlet(name = "DangNhapServlet", urlPatterns = {"/dang-nhap"})
public class DangNhapServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Nếu ai đó truy cập /dang-nhap bằng GET, chỉ cần chuyển họ đến trang JSP
        request.getRequestDispatcher("/view/dangnhap.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8"); // Đảm bảo đọc UTF-8

        // Lấy dữ liệu từ form dangnhap.jsp
        String email = request.getParameter("email");
        String matkhau = request.getParameter("matkhau");

        // Khởi tạo DAO
        NguoiDungDAO dao = new NguoiDungDAO();

        // Gọi hàm checkLogin từ DAO
        NguoiDung user = dao.login(email, matkhau);

        if (user != null) {
            // Đăng nhập thành công
            // 1. Tạo session
            HttpSession session = request.getSession();
            // 2. Lưu đối tượng NguoiDung vào session với tên là "acc" (hoặc "account", "user"...)
            session.setAttribute("acc", user);

            // 3. Chuyển hướng về servlet /trang-chu (tức là Home.java)
            response.sendRedirect(request.getContextPath() + "/Home");
        } else {
            // Đăng nhập thất bại
            // 1. Set một thông báo lỗi
            request.setAttribute("error", "Email hoặc mật khẩu không đúng!");

            // 2. Đẩy lại về trang dangnhap.jsp để hiển thị lỗi
            request.getRequestDispatcher("/view/dangnhap.jsp").forward(request, response);
        }
    }
}
