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
    public partial class frmHocSinh : Office2007Form
    {
        #region Fields
        HocSinhCtrl     m_HocSinhCtrl       = new HocSinhCtrl();
        DanTocCtrl      m_DanTocCtrl        = new DanTocCtrl();
        TonGiaoCtrl     m_TonGiaoCtrl       = new TonGiaoCtrl();
        NgheNghiepCtrl  m_NgheNghiepChaCtrl = new NgheNghiepCtrl();
        NgheNghiepCtrl  m_NgheNghiepMeCtrl  = new NgheNghiepCtrl();
        QuyDinh         quyDinh             = new QuyDinh();
        #endregion
        #region Constructor
        public frmHocSinh()
        {
            InitializeComponent();
            DataService.OpenConnection();
        }
        #endregion

        #region Load
        private void frmHocSinh_Load(object sender, EventArgs e)
        {
            m_DanTocCtrl.HienThiComboBox(cmbDanToc);
            m_TonGiaoCtrl.HienThiComboBox(cmbTonGiao);
            m_NgheNghiepChaCtrl.HienThiComboBox(cmbNgheNghiepCha);
            m_NgheNghiepMeCtrl.HienThiComboBox(cmbNgheNghiepMe);
            m_DanTocCtrl.HienThiDataGridViewComboBoxColumn(colMaDanToc);
            m_TonGiaoCtrl.HienThiDataGridViewComboBoxColumn(colMaTonGiao);
            m_NgheNghiepChaCtrl.HienThiDataGridViewComboBoxColumnNNCha(colMaNNghiepCha);
            m_NgheNghiepMeCtrl.HienThiDataGridViewComboBoxColumnNNMe(colMaNNghiepMe);
            m_HocSinhCtrl.HienThi(dGVHocSinh, bindingNavigatorHocSinh, txtMaHocSinh, txtTenHocSinh, txtGioiTinh, ckbGTinhNam, ckbGTinhNu, dtpNgaySinh, txtNoiSinh, cmbDanToc, cmbTonGiao, txtHoTenCha, cmbNgheNghiepCha, txtHoTenMe, cmbNgheNghiepMe);
        }
        #endregion

        #region BindingNavigatorItems
        private void bindingNavigatorDeleteItem_Click(object sender, EventArgs e)
        {
            if (dGVHocSinh.RowCount == 0)
                bindingNavigatorDeleteItem.Enabled = false;

            else if (MessageBoxEx.Show("Bạn có chắc chắn xóa dòng này không?", "DELETE", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                bindingNavigatorHocSinh.BindingSource.RemoveCurrent();
            }
        }


        private void bindingNavigatorAddNewItem_Click(object sender, EventArgs e)
        {
            if (dGVHocSinh.RowCount == 0)
                bindingNavigatorDeleteItem.Enabled = true;

            DataRow m_Row           = m_HocSinhCtrl.ThemDongMoi();
            m_Row["MaHocSinh"]      = "HS" + quyDinh.LaySTT(dGVHocSinh.Rows.Count + 1);
            m_Row["HoTen"]          = "";
            m_Row["GioiTinh"]       = false;
            m_Row["NgaySinh"]       = DateTime.Today;
            m_Row["NoiSinh"]        = "";
            m_Row["MaDanToc"]       = "";
            m_Row["MaTonGiao"]      = "";
            m_Row["HoTenCha"]       = "";
            m_Row["MaNNghiepCha"]   = "";
            m_Row["HoTenMe"]        = "";
            m_Row["MaNNghiepMe"]    = "";
            m_HocSinhCtrl.ThemHocSinh(m_Row);
            bindingNavigatorHocSinh.BindingSource.MoveLast();
        }

}