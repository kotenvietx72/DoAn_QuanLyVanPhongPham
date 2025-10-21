package model;

public class SanPham {
    private int sanPhamId;
    private String tenSanPham;
    private int loaiId;
    private int nhaCungCapId;
    private String moTa;
    private double giaNhap;
    private double giaBan;
    private int tonKho;
    private String hinhAnh;
    private String trangThai;

    public SanPham() {}

    public SanPham(int sanPhamId, String tenSanPham, int loaiId, int nhaCungCapId, String moTa, double giaNhap, double giaBan, int tonKho, String hinhAnh, String trangThai) {
        this.sanPhamId = sanPhamId;
        this.tenSanPham = tenSanPham;
        this.loaiId = loaiId;
        this.nhaCungCapId = nhaCungCapId;
        this.moTa = moTa;
        this.giaNhap = giaNhap;
        this.giaBan = giaBan;
        this.tonKho = tonKho;
        this.hinhAnh = hinhAnh;
        this.trangThai = trangThai;
    }

    public int getSanPhamId() { return sanPhamId; }
    public void setSanPhamId(int sanPhamId) { this.sanPhamId = sanPhamId; }

    public String getTenSanPham() { return tenSanPham; }
    public void setTenSanPham(String tenSanPham) { this.tenSanPham = tenSanPham; }

    public int getLoaiId() { return loaiId; }
    public void setLoaiId(int loaiId) { this.loaiId = loaiId; }

    public int getNhaCungCapId() { return nhaCungCapId; }
    public void setNhaCungCapId(int nhaCungCapId) { this.nhaCungCapId = nhaCungCapId; }

    public String getMoTa() { return moTa; }
    public void setMoTa(String moTa) { this.moTa = moTa; }

    public double getGiaNhap() { return giaNhap; }
    public void setGiaNhap(double giaNhap) { this.giaNhap = giaNhap; }

    public double getGiaBan() { return giaBan; }
    public void setGiaBan(double giaBan) { this.giaBan = giaBan; }

    public int getTonKho() { return tonKho; }
    public void setTonKho(int tonKho) { this.tonKho = tonKho; }

    public String getHinhAnh() { return hinhAnh; }
    public void setHinhAnh(String hinhAnh) { this.hinhAnh = hinhAnh; }

    public String getTrangThai() { return trangThai; }
    public void setTrangThai(String trangThai) { this.trangThai = trangThai; }
}
