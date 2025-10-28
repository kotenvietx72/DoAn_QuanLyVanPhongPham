package dao;

import model.NguoiDung;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NguoiDungDAO {
    
    // Lấy danh sách tất cả người dùng
    public List<NguoiDung> getAll() {
        List<NguoiDung> list = new ArrayList<>();
        String sql = "SELECT * FROM NguoiDung";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new NguoiDung(
                        rs.getInt("nguoiDungId"),
                        rs.getString("hoTen"),
                        rs.getString("email"),
                        rs.getString("matKhau"),
                        rs.getString("soDienThoai"),
                        rs.getString("diaChi"),
                        rs.getDate("ngayDangKy"),
                        rs.getInt("roleId")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Thêm người dùng
    public boolean insert(NguoiDung nd) {
        String sql = "INSERT INTO NguoiDung(hoTen, email, matKhau, soDienThoai, diaChi, ngayDangKy, roleId) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, nd.getHoTen());
            ps.setString(2, nd.getEmail());
            ps.setString(3, nd.getMatKhau());
            ps.setString(4, nd.getSoDienThoai());
            ps.setString(5, nd.getDiaChi());
            ps.setDate(6, new java.sql.Date(nd.getNgayDangKy().getTime()));
            ps.setInt(7, nd.getRoleId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Cập nhật thông tin người dùng
    public boolean update(NguoiDung nd) {
        String sql = "UPDATE NguoiDung SET hoTen=?, email=?, matKhau=?, soDienThoai=?, diaChi=?, ngayDangKy=?, roleId=? WHERE nguoiDungId=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, nd.getHoTen());
            ps.setString(2, nd.getEmail());
            ps.setString(3, nd.getMatKhau());
            ps.setString(4, nd.getSoDienThoai());
            ps.setString(5, nd.getDiaChi());
            ps.setDate(6, new java.sql.Date(nd.getNgayDangKy().getTime()));
            ps.setInt(7, nd.getRoleId());
            ps.setInt(8, nd.getNguoiDungId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Xóa người dùng
    public boolean delete(int id) {
        String sql = "DELETE FROM NguoiDung WHERE nguoiDungId=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Đăng nhập (Login)
    public NguoiDung login(String email, String matKhau) {
        String sql = "SELECT * FROM NguoiDung WHERE email=? AND matKhau=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, matKhau);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new NguoiDung(
                        rs.getInt("nguoiDungId"),
                        rs.getString("hoTen"),
                        rs.getString("email"),
                        rs.getString("matKhau"),
                        rs.getString("soDienThoai"),
                        rs.getString("diaChi"),
                        rs.getDate("ngayDangKy"),
                        rs.getInt("roleId")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // sai email/mật khẩu
    }

    // Lấy người dùng theo ID
    public NguoiDung getById(int id) {
        String sql = "SELECT * FROM NguoiDung WHERE nguoiDungId=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new NguoiDung(
                        rs.getInt("nguoiDungId"),
                        rs.getString("hoTen"),
                        rs.getString("email"),
                        rs.getString("matKhau"),
                        rs.getString("soDienThoai"),
                        rs.getString("diaChi"),
                        rs.getDate("ngayDangKy"),
                        rs.getInt("roleId")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
