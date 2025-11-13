package dao;

import model.DonHang;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DonHangDAO {
    public List<DonHang> getDonHangByKhachHangId(int khachHangId) throws Exception {
        List<DonHang> list = new ArrayList<>();
        // Khớp với Model của bạn (dùng khachHangId và ngayDat)
        String sql = "SELECT * FROM DonHang WHERE khachHangId = ? ORDER BY ngayDat DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, khachHangId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new DonHang(
                            rs.getInt("donHangId"),
                            rs.getInt("khachHangId"),
                            rs.getInt("nhanVienId"),
                            rs.getString("danhSachSanPham"),
                            rs.getDouble("tongTien"),
                            rs.getDate("ngayDat"),
                            rs.getString("diaChiGiao"),
                            rs.getDouble("phiVanChuyen"),
                            rs.getString("trangThai")
                    ));
                }
            }
        }
        return list; // Lỗi sẽ tự động ném ra
    }
    
    // Lấy toàn bộ đơn hàng
    public List<DonHang> getAll() throws Exception{
        List<DonHang> list = new ArrayList<>();
        String sql = "SELECT * FROM DonHang ORDER BY donHangId DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new DonHang(
                        rs.getInt("donHangId"),
                        rs.getInt("khachHangId"),
                        rs.getInt("nhanVienId"),
                        rs.getString("danhSachSanPham"),
                        rs.getDouble("tongTien"),
                        rs.getDate("ngayDat"),
                        rs.getString("diaChiGiao"),
                        rs.getDouble("phiVanChuyen"),
                        rs.getString("trangThai")
                ));
            }
        }
        return list;
    }

    // Lấy đơn hàng theo ID
    public DonHang getById(int id) throws Exception{
        String sql = "SELECT * FROM DonHang WHERE donHangId=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                return new DonHang(
                        rs.getInt("donHangId"),
                        rs.getInt("khachHangId"),
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
        return null;
    }

    // Tìm kiếm theo tên khách hoặc trạng thái
    public List<DonHang> search(String keyword) throws Exception{
        List<DonHang> list = new ArrayList<>();
        String sql = "SELECT * FROM DonHang WHERE trangThai LIKE ? OR donHangId LIKE ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new DonHang(
                        rs.getInt("donHangId"),
                        rs.getInt("khachHangId"),
                        rs.getInt("nhanVienId"),
                        rs.getString("danhSachSanPham"),
                        rs.getDouble("tongTien"),
                        rs.getDate("ngayDat"),
                        rs.getString("diaChiGiao"),
                        rs.getDouble("phiVanChuyen"),
                        rs.getString("trangThai")
                ));
            }

        }
        return list;
    }

    // Cập nhật trạng thái đơn hàng
    public boolean updateStatus(int donHangId, String trangThai) throws Exception{
        String sql = "UPDATE DonHang SET trangThai=? WHERE donHangId=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, trangThai);
            ps.setInt(2, donHangId);

            return ps.executeUpdate() > 0;

        }
    }

    // Thêm đơn hàng (nếu cần)
    public boolean insert(DonHang dh) throws Exception{
        String sql = "INSERT INTO DonHang(khachHangId, nhanVienId, danhSachSanPham, tongTien, ngayDat, diaChiGiao, phiVanChuyen, trangThai) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, dh.getKhachHangId());
            ps.setInt(2, dh.getNhanVienId());
            ps.setString(3, dh.getDanhSachSanPham());
            ps.setDouble(4, dh.getTongTien());
            ps.setDate(5, new java.sql.Date(dh.getNgayDat().getTime()));
            ps.setString(6, dh.getDiaChiGiao());
            ps.setDouble(7, dh.getPhiVanChuyen());
            ps.setString(8, dh.getTrangThai());

            return ps.executeUpdate() > 0;

        }
    }
}
