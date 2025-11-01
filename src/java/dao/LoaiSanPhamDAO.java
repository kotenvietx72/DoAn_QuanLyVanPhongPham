package dao;

import model.LoaiSanPham;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LoaiSanPhamDAO {

    // Lấy danh sách loại sản phẩm
    public List<LoaiSanPham> getAll() {
        List<LoaiSanPham> list = new ArrayList<>();
        String sql = "SELECT * FROM LoaiSanPham";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while(rs.next()) {
                list.add(new LoaiSanPham(
                        rs.getInt("loaiId"),
                        rs.getString("tenLoai"),
                        rs.getString("moTa")
                ));
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Thêm loại sản phẩm
    public boolean insert(LoaiSanPham lsp) {
        String sql = "INSERT INTO LoaiSanPham (tenLoai, moTa) VALUES (?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, lsp.getTenLoai());
            ps.setString(2, lsp.getMoTa());

            return ps.executeUpdate() > 0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // Sửa loại sản phẩm
    public boolean update(LoaiSanPham lsp) {
        String sql = "UPDATE LoaiSanPham SET tenLoai = ?, moTa = ? WHERE loaiId = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, lsp.getTenLoai());
            ps.setString(2, lsp.getMoTa());
            ps.setInt(3, lsp.getLoaiId());

            return ps.executeUpdate() > 0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // Xóa loại sản phẩm
    public boolean delete(int id) {
        String sql = "DELETE FROM LoaiSanPham WHERE loaiId = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    
    // Lấy thông tin Loại Sản Phẩm dựa theo Identifier (ví dụ: "but-bi")
    public LoaiSanPham getLoaiSanPhamByIdentifier(String identifier) {
        String sql = "SELECT * FROM LoaiSanPham WHERE LOWER(REPLACE(tenLoai, ' ', '-')) = ?";
        LoaiSanPham loai = null;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, identifier.toLowerCase());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                loai = new LoaiSanPham(
                        rs.getInt("loaiId"),
                        rs.getString("tenLoai"),
                        rs.getString("moTa")
                );
            }

        } catch (Exception e) { }
        return loai;
    }

    // Tìm kiếm loại sản phẩm theo tên
    public List<LoaiSanPham> search(String keyword) {
        List<LoaiSanPham> list = new ArrayList<>();
        String sql = "SELECT * FROM LoaiSanPham WHERE tenLoai LIKE ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                list.add(new LoaiSanPham(
                        rs.getInt("loaiId"),
                        rs.getString("tenLoai"),
                        rs.getString("moTa")
                ));
            }

        } catch(Exception e) { }
        return list;
    }
}
