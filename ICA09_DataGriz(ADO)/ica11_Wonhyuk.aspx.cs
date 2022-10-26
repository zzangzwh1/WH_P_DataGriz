using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ica11_Wonhyuk : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FileDropList(null);
        }
    }
    public void FileDropList(string filter)
    {
        _ddlSuppliers.DataSource = NorthWindAccess.GetSuppliersSDS(filter);
        _ddlSuppliers.DataTextField = "CompanyName";
        _ddlSuppliers.DataValueField = "SupplierID";
        _ddlSuppliers.Items.Clear();
        _ddlSuppliers.DataBind();
        _ddlSuppliers.AppendDataBoundItems = true;
        _ddlSuppliers.Items.Insert(0, new ListItem("Now Pick a Compnay From[" + _ddlSuppliers.Items.Count + "]"));
    }

    protected void _btnFilter_Click(object sender, EventArgs e)
    {
        FileDropList(_tbFilter.Text);

    }

    protected void _ddlSuppliers_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (_ddlSuppliers.SelectedIndex == 0) return;

        List<List<string>> products = NorthWindAccess.GetProducts(_ddlSuppliers.SelectedValue);
        bool first = true;
        foreach(var row in products)
        {
            TableRow tr = new TableRow();
            if (first)
            {
                foreach(string header in row)
                {
                    TableHeaderCell th = new TableHeaderCell();
                    th.Text = header;
                    tr.Cells.Add(th);
                }
                first = false;
            }
            else
            {
                foreach (string data in row)
                {
                    TableCell td = new TableCell();
                    td.Text = data;
                    tr.Cells.Add(td);
                }
            }
            
            _tblProducts.Rows.Add(tr);
        }
    }
}