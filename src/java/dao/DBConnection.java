package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    
    // Đảm bảo tên CSDL "vanphongpham" là chính xác
    private static final String URL = "jdbc:mysql://localhost:3306/vanphongpham?useUnicode=true&characterEncoding=UTF-8";
    private static final String USER = "root";
    private static final String PASSWORD = ""; // Mật khẩu của bạn

    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Dùng driver mới (cj)
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("LỖI KẾT NỐI MYSQL! Kiểm tra DBConnection.java hoặc CSDL.");
            // In lỗi chi tiết ra log server
        }
        return conn;
    }
}