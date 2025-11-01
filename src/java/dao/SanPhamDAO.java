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

        } catch (Exception e) { }
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

        } catch (Exception e) { }
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

        } catch (Exception e) { }
        return false;
    }

    // Xoá sản phẩm
    public boolean delete(int id) {
        String sql = "DELETE FROM SanPham WHERE sanPhamId=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) { }
        return false;
    }
    
    public SanPham getSanPhamById(int sanPhamId) {
        String sql = "SELECT * FROM SanPham WHERE sanPhamId = ?";
        SanPham sp = null;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, sanPhamId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                sp = new SanPham(
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
            }

        } catch (Exception e) { }
        return sp;
    }

    // Lấy danh sách sản phẩm Flash Sale (ví dụ 5 sản phẩm)
    public ArrayList<SanPham> getSanPhamFlashSale(int soLuong) {
        ArrayList<SanPham> list = new ArrayList<>();
        // Giả sử Flash Sale là các sản phẩm có giá bán thấp hơn giá nhập hoặc tồn kho cao
        String sql = "SELECT * FROM SanPham WHERE tonKho > 0 ORDER BY sanPhamId DESC LIMIT " + soLuong;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

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

        } catch (Exception e) { }
        return list;
    }

    // Lấy danh sách sản phẩm đặc biệt (ví dụ 7 sản phẩm "Dành cho bạn")
    public ArrayList<SanPham> getSanPhamDacBiet(int soLuong) {
        ArrayList<SanPham> list = new ArrayList<>();
        // Giả sử "Dành cho bạn" là những sản phẩm giá cao nhất còn hàng
        String sql = "SELECT * FROM SanPham WHERE tonKho > 0 ORDER BY giaBan DESC LIMIT " + soLuong;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

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

        } catch (Exception e) { }
        return list;
    }
    
    // Tìm kiếm theo tên
    public ArrayList<SanPham> search(String keyword) {
        ArrayList<SanPham> list = new ArrayList<>();
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

        } catch (Exception e) { }
        return list;
    }
    
    // Lấy danh sách sản phẩm thuộc danh mục (loaiId) 
    public ArrayList<SanPham> getSanPhamByLoaiId(int loaiId) {
        ArrayList<model.SanPham> list = new ArrayList<>();
        String sql = "SELECT * FROM SanPham WHERE loaiId = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, loaiId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new model.SanPham(
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

        } catch (Exception e) { }
        return list;
    }
}
