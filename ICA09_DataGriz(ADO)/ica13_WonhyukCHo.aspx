<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ica13_WonhyukCHo.aspx.cs" Inherits="ica13_WonhyukCHo" MasterPageFile="~/MasterPage.master" Theme="SkinFile" Title ="ica13" %>

<asp:Content ID="ICA13Page" runat ="server" ContentPlaceHolderID="_Main">
    <section>
        <header>
            <h2>ICA13 Modify Order Details</h2>
            <hr />
        </header>
    </section>
    <section>
        <asp:Label Text="Enter OrderID" runat="server" ID="_lblEnterID" />
        <asp:TextBox runat="server" id="_tbOrder"/>
        <asp:Button id="_btnGetOrderDetails" runat="server" Text="Get Order Details" />
        <br />
        <asp:GridView ID="_gvOrderDetails" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID,ProductID" 
            DataSourceID="_sdsOrderDetails"
            AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
            <Columns>
                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID"></asp:BoundField>
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" Visible="false" ReadOnly="True" SortExpression="ProductID"></asp:BoundField>
                <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName"></asp:BoundField>
                <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice"></asp:BoundField>
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity"></asp:BoundField>
                <asp:BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount"></asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#CCCC99"></FooterStyle>

            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White"></HeaderStyle>

            <PagerStyle HorizontalAlign="Right" BackColor="#F7F7DE" ForeColor="Black"></PagerStyle>

            <RowStyle BackColor="#F7F7DE"></RowStyle>

            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

            <SortedAscendingCellStyle BackColor="#FBFBF2"></SortedAscendingCellStyle>

            <SortedAscendingHeaderStyle BackColor="#848384"></SortedAscendingHeaderStyle>

            <SortedDescendingCellStyle BackColor="#EAEAD3"></SortedDescendingCellStyle>

            <SortedDescendingHeaderStyle BackColor="#575357"></SortedDescendingHeaderStyle>
        </asp:GridView>
        <asp:SqlDataSource runat="server" ID="_sdsOrderDetails" ConnectionString='<%$ ConnectionStrings:wcho2_Northwind_CS %>'
            ProviderName='<%$ ConnectionStrings:wcho2_Northwind_CS.ProviderName %>' 
            SelectCommand="SELECT [OrderID], [ProductID], [ProductName], [UnitPrice], [Quantity], [Discount] FROM [Order Details Extended] WHERE ([OrderID] = @OrderID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="_tbOrder" PropertyName="Text" Name="OrderID" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </section>
    <section>
        <asp:Button ID="_btnDeleteSelected" Text="Delte Selected" runat="server" OnClick="_btnDeleteSelected_Click" />
        <br />
        <asp:Label ID="_lblDeleteStatus" Text="Status : Status" runat="server" />
    </section>


    <section>

        <asp:Label ID="Label1" runat="server" Text="Enter OrderID : "></asp:Label>
        <asp:TextBox ID="_tb_part2_orderid" runat="server"></asp:TextBox>
        <br />

        <asp:Label ID="Label2" runat="server" Text="Select Product : "></asp:Label>
        <asp:SqlDataSource ID="_sds_product" runat="server" 
            ConnectionString='<%$ ConnectionStrings:wcho2_Northwind_CS%>' 
            SelectCommand="SELECT [ProductName], [ProductID] FROM [Products]"></asp:SqlDataSource>
        <asp:DropDownList ID="_ddl_product" runat="server"
            DataSourceID="_sds_product" DataTextField="ProductName" DataValueField="ProductID" AutoPostBack="True">
        </asp:DropDownList>
        <br />

        <asp:Label ID="Label3" runat="server" Text="Enter Quantity : "></asp:Label>
        <asp:TextBox ID="_tb_part2_quantity" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="_btn_insert" runat="server" Text="Insert Record" OnClick="_btn_insert_Click" />
        <br />
        <asp:Label ID="_lb_part2_status" runat="server" Text="Status: "></asp:Label>
    </section>
</asp:Content>