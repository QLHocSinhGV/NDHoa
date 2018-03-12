using System;
using System.Data;
using System.Text;
using System.Drawing;
using System.Windows.Forms;
using QLHocSinhTHPT.Controller;
using DevComponents.DotNetBar;

namespace QLHocSinhTHPT
{
    public partial class frmTimKiemHS : Office2007Form
    {
        #region Fields
        DanTocCtrl      m_DanTocCtrl    = new DanTocCtrl();
        TonGiaoCtrl     m_TonGiaoCtrl   = new TonGiaoCtrl();   
        HocSinhCtrl     m_HocSinhCtrl   = new HocSinhCtrl();
        #endregion

        #region Constructor
        public frmTimKiemHS()
        {
            InitializeComponent();
            DataService.OpenConnection();
        }
        #endregion

        #region Load
        private void frmTimKiemHS_Load(object sender, EventArgs e)
        {
            m_DanTocCtrl.HienThiComboBox(cmbDanToc);
            m_TonGiaoCtrl.HienThiComboBox(cmbTonGiao);
        }
        #endregion

        #region BindingNavigatorItems
        private void bindingNavigatorExitItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        #endregion

}