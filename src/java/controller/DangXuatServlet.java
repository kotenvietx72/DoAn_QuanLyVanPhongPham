package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

// Map servlet này với link "dang-xuat"
@WebServlet(urlPatterns = {"/dang-xuat"})
public class DangXuatServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // 1. Lấy session hiện tại
            HttpSession session = request.getSession(false); // false = không tạo session mới nếu chưa có

            if (session != null) {
                // 2. Xóa attribute "acc" (tài khoản) khỏi session
                session.removeAttribute("acc");
                
                // Hoặc bạn có thể hủy toàn bộ session:
                // session.invalidate(); 
                // (Dùng removeAttribute an toàn hơn nếu bạn muốn giữ lại giỏ hàng)
            }

            // 3. Chuyển hướng người dùng về trang chủ (servlet /Home)
            response.sendRedirect(request.getContextPath() + "/Home");
            
        } catch (Exception e) {
            e.printStackTrace();
            // Nếu có lỗi, cũng chuyển về trang chủ
            response.sendRedirect(request.getContextPath() + "/Home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}