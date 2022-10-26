<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ICA_12WonhyukCho.aspx.cs" Inherits="ICA_12WonhyukCho"
     MasterPageFile="~/MasterPage.master" Title="ICA12"  Theme="SkinFile"%>


<asp:Content ID="ICA12Page" runat="server" ContentPlaceHolderID="_Main">

    <section>
        <header>
            <h2>ICA12 - SPs for Customer Summary</h2> <hr />
        </header>
    </section>
    <section>
        <asp:Label ID="_lblPickCustomer" runat="server" Text="Pick a Customer"></asp:Label>
        <asp:DropDownList ID="_ddlCustomers" runat="server" OnSelectedIndexChanged="_ddlCustomers_SelectedIndexChanged" />
        <asp:TextBox ID="_tbFilter" runat="server"/>
        <asp:Button ID="_btnFilter" runat="server" Text="Filter" OnClick="_btnFilter_Click" />
    </section>
    <section>
        <asp:GridView ID="_GridView1" runat="server"  BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnRowDataBound="_GridView1_RowDataBound"   >


            <AlternatingRowStyle BackColor="#CCCCCC"></AlternatingRowStyle>

            <FooterStyle BackColor="#CCCCCC"></FooterStyle>

            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White"></HeaderStyle>

            <PagerStyle HorizontalAlign="Center" BackColor="#999999" ForeColor="Black"></PagerStyle>

            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

            <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

            <SortedAscendingHeaderStyle BackColor="#808080"></SortedAscendingHeaderStyle>

            <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

            <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
        </asp:GridView>


       
    </section>
  
</asp:Content>