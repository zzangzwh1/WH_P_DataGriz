using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;

public partial class ica09_Wonhyuk : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            _chosose.Items.Insert(0, new ListItem("Choose One"));
            _chosose.Items.Insert(1, new ListItem( "Show Products"));
            _chosose.Items.Insert(2, new ListItem("Edit Employee"));
            _chosose.AppendDataBoundItems = true;
        }
    }

    protected void _btnShowProduct_Click(object sender, EventArgs e)
    {
        _mWizard.SetActiveView(_vProduct);
    }

    protected void _btnEditEmployee_Click(object sender, EventArgs e)
    {
        _mWizard.SetActiveView(_vEmployee);
    }

    protected void _gvProducts_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e == null) return;
        if (e.Row == null) return;
        if (e.Row.DataItem == null) return;
        DataRowView _drv = (DataRowView)(e.Row.DataItem);
        if (Convert.ToInt32(_drv.Row.Field<object>("UnitsInStock")) < 25)
            e.Row.BackColor = Color.LightSalmon;
        if (Convert.ToInt32(_drv.Row.Field<object>("UnitPrice")) > 25)
            e.Row.Cells[2].BackColor = Color.Yellow;
        if (Convert.ToInt32(_drv.Row.Field<object>("UnitsOnOrder")) < 5
            && Convert.ToInt32(_drv.Row.Field<object>("UnitsInStock")) < 20)
        {
            e.Row.BackColor = Color.Cyan;
            e.Row.Cells[3].BackColor = Color.GreenYellow;
        }
       /* if (e.Row.RowType == DataControlRowType.DataRow)
        {


            double n = double.Parse(e.Row.Cells[2].Text, System.Globalization.NumberStyles.Currency);

            if ((n*100)/100 > 25)
            {
                e.Row.Cells[2].BackColor = Color.Yellow;
            }
         
            if (Convert.ToInt32(e.Row.Cells[3].Text) < 25)
                e.Row.BackColor = Color.LightSalmon;
            
   
            if (Convert.ToInt32(e.Row.Cells[3].Text) < 20  && Convert.ToInt32(e.Row.Cells[4].Text) < 5)
            {
                e.Row.Cells[3].BackColor = Color.GreenYellow;
                e.Row.BackColor = Color.Cyan;

            }
      


        }*/
    }

    protected void _gvEmployee_SelectedIndexChanged(object sender, EventArgs e)
    {
        foreach(GridViewRow row in _gvEmployee.Rows)
        {
            if(row.RowIndex == _gvEmployee.SelectedIndex)
            {
                row.BackColor = Color.Yellow;
                /*if (row.BackColor == Color.Yellow)
                    row.BackColor = Color.White;*/
            } 
        }
    }

    protected void _gvEmployee_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (Convert.ToInt32(e.Row.Cells[1].Text) %2==1)
                e.Row.BackColor = Color.Aqua;
           
          



        }
    }

    protected void _chosose_SelectedIndexChanged(object sender, EventArgs e)
    {
      
        if (_chosose.SelectedIndex == 1)
        {

        _mWizard.SetActiveView(_vProduct);
        }
        else if (_chosose.SelectedIndex == 2)
        {
            _mWizard.SetActiveView(_vEmployee);
        }
      
            
    }
}