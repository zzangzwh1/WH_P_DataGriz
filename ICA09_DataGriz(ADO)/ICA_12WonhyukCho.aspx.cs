using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class ICA_12WonhyukCho : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            _ddlCustomers.AutoPostBack = true;
            _ddlCustomers.AppendDataBoundItems = true;

            NorthWindAccess.FillCustomersDDL("", _ddlCustomers);

        }
    }

    protected void _btnFilter_Click(object sender, EventArgs e)
    {
        NorthWindAccess.FillCustomersDDL(_tbFilter.Text, _ddlCustomers);
    }

    protected void _ddlCustomers_SelectedIndexChanged(object sender, EventArgs e)
    {
        // System.Diagnostics.Debug.WriteLine(NorthWindAccess.CustomerCategorySummary(_ddlCustomers.SelectedValue).HasRows);
      
            _GridView1.DataSource = NorthWindAccess.CustomerCategorySummary(_ddlCustomers.SelectedValue);
        
            _GridView1.DataBind();
            NorthWindAccess.CustomerCategorySummary(_ddlCustomers.SelectedValue).Close();



    }



    protected void _GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       
        if(e.Row.RowType != DataControlRowType.Header)
        {
            e.Row.Cells[0].HorizontalAlign = HorizontalAlign.Left;
            e.Row.Cells[1].HorizontalAlign = HorizontalAlign.Center;
            e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Right;

            e.Row.Cells[2].Text = "$" + e.Row.Cells[2].Text;
       
        }
    }
}