package dao;

import model.DonHang;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DonHangDAO {

    // 📦 1. Lấy toàn bộ đơn hàng
    public List<DonHang> getAll() {
        List<DonHang> list = new ArrayList<>();
        String sql = "SELECT * FROM DonHang ORDER BY donHangId DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(mapResultSetToDonHang(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 📦 2. Lấy đơn hàng theo ID
    public DonHang getById(int id) {
        String sql = "SELECT * FROM DonHang WHERE donHangId=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapResultSetToDonHang(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // 🔍 3. Tìm kiếm đơn hàng theo mã hoặc trạng thái
    public List<DonHang> search(String keyword) {
        List<DonHang> list = new ArrayList<>();
        String sql = "SELECT * FROM DonHang WHERE trangThai LIKE ? OR CAST(donHangId AS CHAR) LIKE ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapResultSetToDonHang(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 🔄 4. Cập nhật trạng thái đơn hàng
    public boolean updateStatus(int donHangId, String trangThai) {
        String sql = "UPDATE DonHang SET trangThai=? WHERE donHangId=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, trangThai);
            ps.setInt(2, donHangId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    //  Lấy đơn hàng mới nhất của 1 khách hàng
    public int getLatestOrderId(int khachHangId) {
    String sql = "SELECT donHangId FROM DonHang WHERE khachHangId=? ORDER BY donHangId DESC LIMIT 1";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, khachHangId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt("donHangId");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return -1; // Nếu không tìm thấy
}
    public int insert(DonHang dh) {
        String sql = """
        INSERT INTO DonHang 
        (khachHangId, tongTien, danhSachSanPham, ngayDat, diaChiGiao, phiVanChuyen, trangThai)
        VALUES (?, ?, ?, NOW(), ?, ?, ?)
    """;

        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            // 🧩 Thứ tự cột đúng với SQL ở trên
            ps.setInt(1, dh.getKhachHangId());
            ps.setDouble(2, dh.getTongTien());
            ps.setString(3, dh.getDanhSachSanPham());
            ps.setString(4, dh.getDiaChiGiao());
            ps.setDouble(5, dh.getPhiVanChuyen());
            ps.setString(6, dh.getTrangThai());

            int affectedRows = ps.executeUpdate();
            if (affectedRows == 0) {
                System.err.println("⚠ Không thể thêm đơn hàng (affectedRows = 0)");
                return -1;
            }

            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    int id = rs.getInt(1);
                    System.out.println("✅ Đã thêm đơn hàng ID = " + id);
                    return id;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }


    // 🧰 Hàm tái sử dụng để map ResultSet → Model
    private DonHang mapResultSetToDonHang(ResultSet rs) throws SQLException {
        return new DonHang(
                rs.getInt("donHangId"),
                rs.getInt("KhachHangId"),
                rs.getInt("nhanVienId"),
                rs.getString("danhSachSanPham"),
                rs.getDouble("tongTien"),
                rs.getDate("ngayDat"),
                rs.getString("diaChiGiao"),
                rs.getDouble("phiVanChuyen"),
                rs.getString("trangThai")
        );
    }
}
