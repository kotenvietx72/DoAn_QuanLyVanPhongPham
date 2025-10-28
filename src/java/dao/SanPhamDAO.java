package dao;

import model.SanPham;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SanPhamDAO {
    
    // Lấy danh sách tất cả sản phẩm
    public List<SanPham> getAll() {
        List<SanPham> list = new ArrayList<>();
        String sql = "SELECT * FROM SanPham";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                SanPham sp = new SanPham(
                        rs.getInt("sanPhamId"),
                        rs.getString("tenSanPham"),
                        rs.getInt("loaiId"),
                        rs.getInt("nhaCungCapId"),
                        rs.getString("moTa"),
                        rs.getDouble("giaNhap"),
                        rs.getDouble("giaBan"),
                        rs.getInt("tonKho"),
                        rs.getString("hinhAnh"),
                        rs.getString("trangThai")
                );
                list.add(sp);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Thêm sản phẩm
    public boolean insert(SanPham sp) {
        String sql = "INSERT INTO SanPham(tenSanPham, loaiId, nhaCungCapId, moTa, giaNhap, giaBan, tonKho, hinhAnh, trangThai) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, sp.getTenSanPham());
            ps.setInt(2, sp.getLoaiId());
            ps.setInt(3, sp.getNhaCungCapId());
            ps.setString(4, sp.getMoTa());
            ps.setDouble(5, sp.getGiaNhap());
            ps.setDouble(6, sp.getGiaBan());
            ps.setInt(7, sp.getTonKho());
            ps.setString(8, sp.getHinhAnh());
            ps.setString(9, sp.getTrangThai());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Sửa sản phẩm
    public boolean update(SanPham sp) {
        String sql = "UPDATE SanPham SET tenSanPham=?, loaiId=?, nhaCungCapId=?, moTa=?, giaNhap=?, giaBan=?, tonKho=?, hinhAnh=?, trangThai=? "
                + "WHERE sanPhamId=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, sp.getTenSanPham());
            ps.setInt(2, sp.getLoaiId());
            ps.setInt(3, sp.getNhaCungCapId());
            ps.setString(4, sp.getMoTa());
            ps.setDouble(5, sp.getGiaNhap());
            ps.setDouble(6, sp.getGiaBan());
            ps.setInt(7, sp.getTonKho());
            ps.setString(8, sp.getHinhAnh());
            ps.setString(9, sp.getTrangThai());
            ps.setInt(10, sp.getSanPhamId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Xoá sản phẩm
    public boolean delete(int id) {
        String sql = "DELETE FROM SanPham WHERE sanPhamId=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Tìm kiếm theo tên
    public List<SanPham> search(String keyword) {
        List<SanPham> list = new ArrayList<>();
        String sql = "SELECT * FROM SanPham WHERE tenSanPham LIKE ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new SanPham(
                        rs.getInt("sanPhamId"),
                        rs.getString("tenSanPham"),
                        rs.getInt("loaiId"),
                        rs.getInt("nhaCungCapId"),
                        rs.getString("moTa"),
                        rs.getDouble("giaNhap"),
                        rs.getDouble("giaBan"),
                        rs.getInt("tonKho"),
                        rs.getString("hinhAnh"),
                        rs.getString("trangThai")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
