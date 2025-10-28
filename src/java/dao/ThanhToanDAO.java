package dao;

import model.ThanhToan;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ThanhToanDAO {
    
    // Lấy toàn bộ thanh toán
    public List<ThanhToan> getAll() {
        List<ThanhToan> list = new ArrayList<>();
        String sql = "SELECT * FROM ThanhToan ORDER BY thanhToanId DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new ThanhToan(
                        rs.getInt("thanhToanId"),
                        rs.getInt("donHangId"),
                        rs.getString("phuongThuc"),
                        rs.getDouble("soTien"),
                        rs.getString("maGiaoDich"),
                        rs.getString("trangThai"),
                        rs.getDate("ngayThanhToan"),
                        rs.getString("ghiChu")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Lấy thanh toán theo đơn hàng
    public ThanhToan getByDonHangId(int donHangId) {
        String sql = "SELECT * FROM ThanhToan WHERE donHangId = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, donHangId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new ThanhToan(
                        rs.getInt("thanhToanId"),
                        rs.getInt("donHangId"),
                        rs.getString("phuongThuc"),
                        rs.getDouble("soTien"),
                        rs.getString("maGiaoDich"),
                        rs.getString("trangThai"),
                        rs.getDate("ngayThanhToan"),
                        rs.getString("ghiChu")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // Thêm thanh toán mới
    public boolean insert(ThanhToan t) {
        String sql = "INSERT INTO ThanhToan(donHangId, phuongThuc, soTien, maGiaoDich, trangThai, ngayThanhToan, ghiChu) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, t.getDonHangId());
            ps.setString(2, t.getPhuongThuc());
            ps.setDouble(3, t.getSoTien());
            ps.setString(4, t.getMaGiaoDich());
            ps.setString(5, t.getTrangThai());
            ps.setDate(6, new java.sql.Date(t.getNgayThanhToan().getTime()));
            ps.setString(7, t.getGhiChu());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

}
