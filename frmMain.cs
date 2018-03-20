using System;
using System.Data;
using System.Text;
using System.Drawing;
using System.Windows.Forms;
using QLHocSinhTHPT.Controller;
using QLHocSinhTHPT.Component;
using DevComponents.DotNetBar;

namespace QLHocSinhTHPT
{
    public partial class frmMain : Office2007RibbonForm
    {
        #region Giao diện mặc định
        public void Default()
        {
            //True
            btnDangNhap.Enabled         = true;
            btnDangNhapContext.Enabled  = true;
            btnThoat.Enabled            = true;
            btnThoatContext.Enabled     = true;
            btnHuongDan.Enabled         = true;
            btnThongTin.Enabled         = true;

            //False
            btnDangXuat.Enabled         = false;
            btnDangXuatContext.Enabled  = false;
            btnDoiMatKhau.Enabled       = false;
            btnDoiMatKhauContext.Enabled= false;
            btnQLNguoiDung.Enabled      = false;
            btnSaoLuu.Enabled           = false;
            btnPhucHoi.Enabled          = false;

            btnLopHoc.Enabled           = false;
            btnKhoiLop.Enabled          = false;
            btnHocKy.Enabled            = false;
            btnNamHoc.Enabled           = false;
            ribbonBarMonHoc.Enabled     = false;
            btnMonHoc.Enabled           = false;
            btnDiem.Enabled             = false;
            btnKetQua.Enabled           = false;
            btnHocLuc.Enabled           = false;
            btnHanhKiem.Enabled         = false;
            btnHocSinh.Enabled          = false;
            btnPhanLop.Enabled          = false;
            btnTonGiao.Enabled          = false;
            btnDanToc.Enabled           = false;
            btnNgheNghiep.Enabled       = false;
            btnGiaoVien.Enabled         = false;
            btnPhanCong.Enabled         = false;

            btnKQHKTheoLop.Enabled      = false;
            btnKQHKTheoMon.Enabled      = false;
            btnKQCNTheoLop.Enabled      = false;
            btnKQCNTheoMon.Enabled      = false;
            btnDanhSachHocSinh.Enabled  = false;
            btnDanhSachGiaoVien.Enabled = false;
            btnDanhSachLopHoc.Enabled   = false;

            btnTimKiemHS.Enabled        = false;
            btnTimKiemGV.Enabled        = false;

            btnSiSo.Enabled             = false;
            btnThangDiem.Enabled        = false;
            btnDoTuoi.Enabled           = false;
            btnTruong.Enabled           = false;
        }
        #endregion

        #region Giao diện khi đăng nhập với quyền BGH
        public void IsBGH()
        {
            //False
            btnDangNhap.Enabled         = false;
            btnDangNhapContext.Enabled  = false;

            //True
            btnDangXuat.Enabled         = true;
            btnDangXuatContext.Enabled  = true;
            btnDoiMatKhau.Enabled       = true;
            btnDoiMatKhauContext.Enabled= true;
            btnQLNguoiDung.Enabled      = true;
            btnSaoLuu.Enabled           = true;
            btnPhucHoi.Enabled          = true;
            btnThoat.Enabled            = true;
            btnThoatContext.Enabled     = true;

            btnLopHoc.Enabled           = true;
            btnKhoiLop.Enabled          = true;
            btnHocKy.Enabled            = true;
            btnNamHoc.Enabled           = true;
            ribbonBarMonHoc.Enabled     = true;
            btnMonHoc.Enabled           = true;
            btnDiem.Enabled             = true;
            btnKetQua.Enabled           = true;
            btnHocLuc.Enabled           = true;
            btnHanhKiem.Enabled         = true;
            btnHocSinh.Enabled          = true;
            btnPhanLop.Enabled          = true;
            btnTonGiao.Enabled          = true;
            btnDanToc.Enabled           = true;
            btnNgheNghiep.Enabled       = true;
            btnGiaoVien.Enabled         = true;
            btnPhanCong.Enabled         = true;

            btnKQHKTheoLop.Enabled      = true;
            btnKQHKTheoMon.Enabled      = true;
            btnKQCNTheoLop.Enabled      = true;
            btnKQCNTheoMon.Enabled      = true;
            btnDanhSachHocSinh.Enabled  = true;
            btnDanhSachGiaoVien.Enabled = true;
            btnDanhSachLopHoc.Enabled   = true;

            btnTimKiemHS.Enabled        = true;
            btnTimKiemGV.Enabled        = true;

            btnSiSo.Enabled             = true;
            btnThangDiem.Enabled        = true;
            btnDoTuoi.Enabled           = true;
            btnTruong.Enabled           = true;

            btnHuongDan.Enabled         = true;
            btnThongTin.Enabled         = true;
        }
        #endregion

        #region Giao diện khi đăng nhập với quyền Giáo viên
        public void IsGiaoVien()
        {
            //True
            btnDangXuat.Enabled         = true;
            btnDangXuatContext.Enabled  = true;
            btnDoiMatKhau.Enabled       = true;
            btnDoiMatKhauContext.Enabled= true;
            btnThoat.Enabled            = true;
            btnThoatContext.Enabled     = true;

            ribbonBarMonHoc.Enabled     = true;
            btnMonHoc.Enabled           = true;
            btnDiem.Enabled             = true;

            btnKQHKTheoLop.Enabled      = true;
            btnKQHKTheoMon.Enabled      = true;
            btnKQCNTheoLop.Enabled      = true;
            btnKQCNTheoMon.Enabled      = true;
            btnDanhSachHocSinh.Enabled  = true;
            btnDanhSachGiaoVien.Enabled = true;
            btnDanhSachLopHoc.Enabled   = true;

            btnTimKiemHS.Enabled        = true;
            btnTimKiemGV.Enabled        = true;

            btnHuongDan.Enabled         = true;
            btnThongTin.Enabled         = true;

            //False
            btnDangNhap.Enabled         = false;
            btnDangNhapContext.Enabled  = false;
            btnQLNguoiDung.Enabled      = false;
            btnSaoLuu.Enabled           = false;
            btnPhucHoi.Enabled          = false;

            btnLopHoc.Enabled           = false;
            btnKhoiLop.Enabled          = false;
            btnHocKy.Enabled            = false;
            btnNamHoc.Enabled           = false;
            btnKetQua.Enabled           = false;
            btnHocLuc.Enabled           = false;
            btnHanhKiem.Enabled         = false;
            btnHocSinh.Enabled          = false;
            btnPhanLop.Enabled          = false;
            btnTonGiao.Enabled          = false;
            btnDanToc.Enabled           = false;
            btnNgheNghiep.Enabled       = false;
            btnGiaoVien.Enabled         = false;
            btnPhanCong.Enabled         = false;

            btnSiSo.Enabled             = false;
            btnThangDiem.Enabled        = false;
            btnDoTuoi.Enabled           = false;
            btnTruong.Enabled           = false;
        }
        #endregion

        #region Giao diện khi đăng nhập với quyền Giáo vụ
        public void IsGiaoVu()
        {
            //True
            btnDangXuat.Enabled         = true;
            btnDangXuatContext.Enabled  = true;
            btnDoiMatKhau.Enabled       = true;
            btnDoiMatKhauContext.Enabled= true;
            btnThoat.Enabled            = true;
            btnThoatContext.Enabled     = true;
            
            btnLopHoc.Enabled           = true;
            btnKhoiLop.Enabled          = true;
            btnHocKy.Enabled            = true;
            btnNamHoc.Enabled           = true;
            btnKetQua.Enabled           = true;
            btnHocLuc.Enabled           = true;
            btnHanhKiem.Enabled         = true;
            ribbonBarMonHoc.Enabled     = true;
            btnMonHoc.Enabled           = true;
            btnDiem.Enabled             = true;
            btnHocSinh.Enabled          = true;
            btnPhanLop.Enabled          = true;
            btnTonGiao.Enabled          = true;
            btnDanToc.Enabled           = true;
            btnNgheNghiep.Enabled       = true;

            btnKQHKTheoLop.Enabled      = true;
            btnKQHKTheoMon.Enabled      = true;
            btnKQCNTheoLop.Enabled      = true;
            btnKQCNTheoMon.Enabled      = true;
            btnDanhSachHocSinh.Enabled  = true;
            btnDanhSachGiaoVien.Enabled = true;
            btnDanhSachLopHoc.Enabled   = true;

            btnTimKiemHS.Enabled        = true;
            btnTimKiemGV.Enabled        = true;

            btnHuongDan.Enabled         = true;
            btnThongTin.Enabled         = true;

            //False
            btnDangNhap.Enabled         = false;
            btnDangNhapContext.Enabled  = false;
            btnQLNguoiDung.Enabled      = false;
            btnSaoLuu.Enabled           = false;
            btnPhucHoi.Enabled          = false;
    }
}