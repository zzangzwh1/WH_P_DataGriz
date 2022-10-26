using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ica13_WonhyukCHo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    
    }

    protected void _btnDeleteSelected_Click(object sender, EventArgs e)
    {
        try
        {
            int oid = Convert.ToInt32(_gvOrderDetails.SelectedDataKey.Values["OrderID"].ToString());
            int pid = Convert.ToInt32(_gvOrderDetails.SelectedDataKey.Values["ProductID"].ToString());
            _lblDeleteStatus.Text = "Status:" + NorthWindAccess.DeleteOrderDetails(oid, pid);
            _gvOrderDetails.DataBind();
            _tb_part2_orderid.Text = _tbOrder.Text;
        }
        catch (Exception ex)
        {
            _lblDeleteStatus.Text = "Status:" + ex.Message;
        }

    }

   

    protected void _btn_insert_Click(object sender, EventArgs e)
    {
        if (!(_tb_part2_orderid.Text == null || _tb_part2_orderid.Text == "")
              && !(_tb_part2_quantity.Text == null || _tb_part2_quantity.Text == ""))
        {
            _lb_part2_status.Text = "Inserted : " + NorthWindAccess.InsertOrderDetails(Convert.ToInt32(_tb_part2_orderid.Text),
             Convert.ToInt32(_ddl_product.SelectedValue), Convert.ToInt16(_tb_part2_quantity.Text)) + " rows.";

            _gvOrderDetails.DataBind();
        }
        else
            _lb_part2_status.Text = "Missing value for OrderID or Quantity";
    }
}