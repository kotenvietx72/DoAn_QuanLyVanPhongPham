package dao;

import model.ChiTietGioHang;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class ChiTietGioHangDAO {
    // Lấy danh sách sản phẩm trong giỏ hàng theo gioHangId
    public List<ChiTietGioHang> getByGioHangId(int gioHangId) {
        List<ChiTietGioHang> list = new ArrayList<>();
        String sql = "SELECT * FROM ChiTietGioHang WHERE gioHangId = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, gioHangId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new ChiTietGioHang(
                        rs.getInt("id"),
                        rs.getInt("gioHangId"),
                        rs.getInt("sanPhamId"),
                        rs.getInt("soLuong")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Thêm hoặc cập nhật số lượng (nếu sản phẩm đã có trong giỏ)
    public boolean addOrUpdate(int gioHangId, int sanPhamId, int soLuong) {
        String checkSql = "SELECT * FROM ChiTietGioHang WHERE gioHangId=? AND sanPhamId=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement check = conn.prepareStatement(checkSql)) {

            check.setInt(1, gioHangId);
            check.setInt(2, sanPhamId);
            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                // Nếu sản phẩm đã có trong giỏ → cập nhật số lượng (tăng lên)
                String updateSql = "UPDATE ChiTietGioHang SET soLuong = soLuong + ? WHERE gioHangId=? AND sanPhamId=?";
                PreparedStatement update = conn.prepareStatement(updateSql);
                update.setInt(1, soLuong);
                update.setInt(2, gioHangId);
                update.setInt(3, sanPhamId);
                return update.executeUpdate() > 0;

            } else {
                // Nếu chưa có → thêm mới
                String insertSql = "INSERT INTO ChiTietGioHang(gioHangId, sanPhamId, soLuong) VALUES (?, ?, ?)";
                PreparedStatement insert = conn.prepareStatement(insertSql);
                insert.setInt(1, gioHangId);
                insert.setInt(2, sanPhamId);
                insert.setInt(3, soLuong);
                return insert.executeUpdate() > 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Cập nhật số lượng trực tiếp
    public boolean updateSoLuong(int id, int soLuong) {
        String sql = "UPDATE ChiTietGioHang SET soLuong=? WHERE id=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, soLuong);
            ps.setInt(2, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Xóa một sản phẩm khỏi giỏ hàng
    public boolean remove(int id) {
        String sql = "DELETE FROM ChiTietGioHang WHERE id=?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Xóa toàn bộ sản phẩm trong giỏ (khi đặt hàng xong hoặc xoá giỏ)
    public boolean clear(int gioHangId) {
        String sql = "DELETE FROM ChiTietGioHang WHERE gioHangId=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, gioHangId);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
