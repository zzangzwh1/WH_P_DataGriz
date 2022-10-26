<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ica10_Wonhyukcho.aspx.cs" Inherits="ica10_Wonhyukcho" 
    MasterPageFile="~/MasterPage.master"  Title="ICA10 More Data"%>

<asp:Content ID="ICA10_Page" runat="server" ContentPlaceHolderID="_Main">
    <section>
        <header> <h2>ICA010- More Data Aware Controls </h2><hr /></header>
        </section>
    <section class="ica09">
      <asp:SqlDataSource 
          runat="server" 
          ID="_sdsCompanyNameCustomerId" 
          ConnectionString='<%$ ConnectionStrings:wcho2_Northwind_CS %>'          
          ProviderName='<%$ ConnectionStrings:wcho2_Northwind_CS.ProviderName %>' 
          SelectCommand="SELECT [CustomerID], [CompanyName] FROM [Customers]" >                     
        </asp:SqlDataSource>
        <asp:Label ID="_lblCustomer" runat="server" Text="Customer:"/>

        <asp:DropDownList ID="_ddlCustomer"
            runat="server"
            AutoPostBack="true"
            DataTextField="CompanyName"
            DataValueField="CustomerID" 
            DataSourceID="_sdsCompanyNameCustomerId">
        </asp:DropDownList> 
    </section>
    <section class="ica09">

        <asp:SqlDataSource
            ID="_sdsOrders"
            runat="server" 
            ConnectionString='<%$ ConnectionStrings:wcho2_Northwind_CS %>'
            DeleteCommand="DELETE FROM [Orders] WHERE [OrderID] = @OrderID"
            InsertCommand="INSERT INTO [Orders] ([CustomerID], [OrderDate]) VALUES (@CustomerID, @OrderDate)"
            ProviderName='<%$ ConnectionStrings:wcho2_Northwind_CS.ProviderName %>'
            SelectCommand="SELECT [OrderID], [CustomerID], [OrderDate] FROM [Orders] WHERE ([CustomerID] = @CustomerID)"
            UpdateCommand="UPDATE [Orders] SET [CustomerID] = @CustomerID, [OrderDate] = @OrderDate WHERE [OrderID] = @OrderID">

            <DeleteParameters>
                <asp:Parameter Name="OrderID" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CustomerID" Type="String"></asp:Parameter>
                <asp:Parameter Name="OrderDate" Type="DateTime"></asp:Parameter>
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="_ddlCustomer" PropertyName="SelectedValue" Name="CustomerID" Type="String"></asp:ControlParameter>
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="CustomerID" Type="String"></asp:Parameter>
                <asp:Parameter Name="OrderDate" Type="DateTime" ></asp:Parameter>
                <asp:Parameter Name="OrderID" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>

    </section>

    <asp:ListView
        ID="_lvOrders"
        runat="server" DataSourceID="_sdsOrders" DataKeyNames="OrderID" InsertItemPosition="LastItem" >

        <AlternatingItemTemplate>
            <tr style="background-color: #FFF8DC;">
                <td>
                    <asp:Button runat="server" CommandName="Select" Text="Pick Me" ID="SeletButton" />
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("OrderID") %>' runat="server" ID="OrderIDLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("CustomerID") %>' runat="server" ID="CustomerIDLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("OrderDate") %>' runat="server" ID="OrderDateLabel" /></td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #008A8C; color: #FFFFFF;">
                <td>
                    <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("OrderID") %>' runat="server" ID="OrderIDLabel1" /></td>
                <td>
                       <asp:DropDownList ID="_ddlCustomer"
                     runat="server"                    
                     DataTextField="CompanyName"
                     DataValueField="CustomerID" 
                     DataSourceID="_sdsCompanyNameCustomerId"
                     SelectedValue='<%# Bind("CustomerID") %>'>
                    </asp:DropDownList> 
                <td>
                        <asp:Calendar ID="_calOrderDate" runat="server" VisibleDate='<%# Bind("OrderDate") %>' /></td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" />
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:DropDownList ID="_ddlCustomer"
                     runat="server"                    
                     DataTextField="CompanyName"
                     DataValueField="CustomerID" 
                     DataSourceID="_sdsCompanyNameCustomerId"                        
                     SelectedValue='<%# Bind("CustomerID") %>'>
                    </asp:DropDownList> 
                  <!-- <asp:TextBox Text='<%# Bind("CustomerID") %>' runat="server" ID="CustomerIDTextBox" /></td>-->
                <td>
                  <!--  <asp:TextBox Text='<%# Bind("OrderDate") %>' runat="server" ID="OrderDateTextBox" /> -->
                    <asp:Calendar ID="_calOrderDate" runat="server"  SelectedDate='<%# Bind("OrderDate") %>' />

                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #DCDCDC; color: #000000;">
                <td>
                      <asp:Button runat="server" CommandName="Select" Text="Pick Me" ID="SeletButton" />
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("OrderID") %>' runat="server" ID="OrderIDLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("CustomerID") %>' runat="server" ID="CustomerIDLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("OrderDate") %>' runat="server" ID="OrderDateLabel"  /></td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table runat="server" id="itemPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                            <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                <th runat="server"></th>
                                <th runat="server">OrderID</th>
                                <th runat="server">CustomerID</th>
                                <th runat="server">OrderDate</th>
                            </tr>
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                        <asp:DataPager runat="server" ID="DataPager1">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True"></asp:NextPreviousPagerField>
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">
                <td>
                   
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("OrderID") %>' runat="server" ID="OrderIDLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("CustomerID") %>' runat="server" ID="CustomerIDLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("OrderDate") %>' runat="server" ID="OrderDateLabel"  /></td>
            </tr>
        </SelectedItemTemplate>

    </asp:ListView>
    

    <section  class="ica09">
        <asp:SqlDataSource runat="server"
            ID="_sqlCustom"
            ConnectionString='<%$ ConnectionStrings:wcho2_Northwind_CS %>'
            ProviderName='<%$ ConnectionStrings:wcho2_Northwind_CS.ProviderName %>'
            SelectCommand="SELECT Orders.OrderID,Orders.ShipName,Categories.CategoryID, Categories.CategoryName, [Order Details].UnitPrice * [Order Details].Quantity AS CategorySum FROM Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID INNER JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID INNER JOIN Orders ON [Order Details].OrderID = Orders.OrderID
where Orders.OrderID=@OrderID">
            <SelectParameters>
                <asp:ControlParameter ControlID="_lvOrders" PropertyName="SelectedValue" Name="OrderID"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:DetailsView ID="DetailsView1" 
            runat="server" Height="200px"
            Width="700px" AutoGenerateRows="False" 
            DataSourceID="_sqlCustom" AllowPaging="True" 
            BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC"></AlternatingRowStyle>

            <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"></EditRowStyle>
            <Fields>
                <asp:TemplateField HeaderText="Summary Category Details View" ControlStyle-CssClass="cold" HeaderStyle-ForeColor="white" HeaderStyle-BackColor="Black" HeaderStyle-BorderStyle="None" ItemStyle-BackColor="Black" ItemStyle-BorderStyle="None"></asp:TemplateField>
                <asp:BoundField HeaderText="OrderID" ControlStyle-CssClass="cold" DataField="OrderID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID"  ItemStyle-HorizontalAlign="left" />
                <asp:BoundField DataField="ShipName" HeaderText="ShipName" SortExpression="ShipName" ItemStyle-HorizontalAlign="Right"></asp:BoundField>
                <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" ReadOnly="True" InsertVisible="False" SortExpression="CategoryID"></asp:BoundField>
                <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" ItemStyle-HorizontalAlign="left"></asp:BoundField>
                <asp:BoundField DataField="CategorySum" HeaderText="CategorySum" ReadOnly="True" SortExpression="CategorySum" ItemStyle-HorizontalAlign="Right"  DataFormatString="{0:C}"></asp:BoundField>
            </Fields>
            <FooterStyle BackColor="#CCCCCC"></FooterStyle>

            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White"></HeaderStyle>

            <PagerStyle HorizontalAlign="Center" BackColor="#999999" ForeColor="Black"></PagerStyle>
        </asp:DetailsView>
           
        </section>

    </asp:Content>