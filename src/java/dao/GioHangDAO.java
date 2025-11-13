package dao;

import model.GioHang;
import java.sql.*;

public class GioHangDAO {
    // Lấy giỏ hàng theo ID người dùng
    public GioHang getByKhachHangId(int khachHangId) {
        String sql = "SELECT * FROM GioHang WHERE khachHangId = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, khachHangId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new GioHang(
                    rs.getInt("gioHangId"),
                    rs.getInt("khachHangId"),
                    rs.getTimestamp("ngayTao")
                );
            }
        } catch (Exception e) { }
        return null;
    }

    // Tạo giỏ hàng mới cho người dùng (nếu chưa có)
    public int createIfNotExist(int khachHangId) {
        GioHang existing = getByKhachHangId(khachHangId);
        if (existing != null) {
            return existing.getGioHangId();
        }

        String sql = "INSERT INTO GioHang(khachHangId) VALUES (?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, khachHangId);
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // Trả về ID giỏ hàng mới
            }
        } catch (Exception e) { }
        return -1;
    }
}
