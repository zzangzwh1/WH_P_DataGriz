<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ica09_Wonhyuk.aspx.cs" Inherits="ica09_Wonhyuk"  MasterPageFile="~/MasterPage.master" Title="ICA09 Page" %>

<asp:Content ID="ICA09_Page" runat="server" ContentPlaceHolderID="_Main">
    <section>
        <header> <h2>ICA09- Data Aware Controls  </h2> <hr /> 
        </header>
        <div class="controls">
            <asp:Button Text="Show Product" runat="server" ID="_btnShowProduct"  onclick="_btnShowProduct_Click"/>
            <asp:Button Text="Edit Employee" runat="server"  id="_btnEditEmployee" OnClick="_btnEditEmployee_Click"/>

        </div>
        <asp:DropDownList runat="server" ID="_chosose" OnSelectedIndexChanged="_chosose_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
        <asp:MultiView runat="server" ID="_mWizard">

            <asp:View runat="server" ID="_vProduct">
                <asp:SqlDataSource ID="_sdsNorthwindProducts" runat="server"
                   ConnectionString="<%$ ConnectionStrings:wcho2_Northwind_CS %>"
                   SelectCommand ="Select * from[wcho2_Northwind].[dbo].[Alphabetical list of products]" />

                <asp:label text="Products" runat="server"  ID="_lblShowProduct"/>
               
                <asp:GridView runat="server" ID="_gvProducts" DataSourceID="_sdsNorthwindProducts"
                              AllowPaging="true"
                              AllowSorting="true"
                              AutoGenerateColumns="false"
                              OnRowDataBound="_gvProducts_RowDataBound">
               <HeaderStyle CssClass="product-tr" />
                    <Columns>
                        <asp:BoundField DataField="ProductName" HeaderText="Product Name" ItemStyle-HorizontalAlign="Center"  SortExpression="ProductName"  />
                        <asp:BoundField DataField="QuantityPerUnit" HeaderText="Qty Per Unit" ItemStyle-HorizontalAlign="Center" SortExpression="QuantityPerUnit"  />
                        <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price" ItemStyle-HorizontalAlign="right" SortExpression="UnitPrice" DataFormatString="{0:C}"   />
                        <asp:BoundField DataField="UnitsInStock" HeaderText="Units In Stock" ItemStyle-HorizontalAlign="right" SortExpression="UnitsInStock" />
                        <asp:BoundField DataField="UnitsOnOrder" HeaderText="Units On Order"  ItemStyle-HorizontalAlign="right" SortExpression="UnitsOnOrder" />
                        <asp:BoundField DataField="ReorderLevel" HeaderText="Reorder Level"  ItemStyle-HorizontalAlign="right" SortExpression="ReorderLevel" /> 
                        <asp:CheckBoxField DataField="Discontinued" HeaderText="Discontinued"  ItemStyle-HorizontalAlign="Center" SortExpression="Discontinued" />
                         <asp:BoundField DataField="CategoryName" HeaderText="Category Name"  ItemStyle-HorizontalAlign="left" SortExpression="CategoryName" /> 
                        </Columns>
                </asp:GridView>                           
                           

            </asp:View>

            <asp:View runat="server" ID="_vEmployee">
                <asp:Label Text="Edit Employee" runat="server" ID="_lblEditEmployee" />
                <asp:SqlDataSource
                    ID="_sdsNorthWindEmployee" runat="server"
                    ConnectionString="<%$ ConnectionStrings:wcho2_Northwind_CS %>"
                     SelectCommand ="Select * from Employees"
                     UpdateCommand="Update Employees set [FirstName]= @FirstName, [LastName] = @LastName where [EmployeeID] = @EmployeeID"
                     DeleteCommand="Delete from Employees where [EmployeeID] = @EmployeeID">     
                    <UpdateParameters>
                        <asp:Parameter Name="EmployeeID" type="Int32" />
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="FirstName" Type="String" />                        

                    </UpdateParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="EmployeeID" Type="Int32" />
                            
                    </DeleteParameters>

                 </asp:SqlDataSource>

                <asp:GridView ID="_gvEmployee" runat="server"
                              DataSourceID="_sdsNorthWindEmployee"
                              AllowPaging="true"
                              AllowSorting="true"
                              DataKeyNames="EmployeeID"
                              AutoGenerateColumns="false"
                              OnSelectedIndexChanged="_gvEmployee_SelectedIndexChanged"
                              OnRowDataBound="_gvEmployee_RowDataBound">

                    <HeaderStyle CssClass = "employee-tr" />

                    <Columns>
                        <asp:CommandField ButtonType="Button"
                                          ShowEditButton="true"
                                          ShowDeleteButton="true"                           
                                          ShowSelectButton="true" />

                        <asp:BoundField DataField="EmployeeID"
                                        HeaderText="Employee ID"
                                        ItemStyle-HorizontalAlign="left"
                                        SortExpression="EmployeeID"
                                        ReadOnly="true"  />
                        <asp:BoundField DataField="LastName"
                                        HeaderText ="Last Name"
                                        SortExpression="LastName" />
                        <asp:BoundField DataField="FirstName"
                                        HeaderText="First Name"
                                        SortExpression="LastName" />
                        <asp:BoundField DataField="Title"
                                        HeaderText ="Title"
                                        SortExpression="Title" />
                        <asp:BoundField DataField="HireDate"
                                        Headertext="Hire Date"
                                        SortExpression="HireDate"
                                         DataFormatString="{0:dd MMM yyyy}" />
                        <asp:BoundField DataField="Address"
                                        Headertext="Address City"
                                        SortExpression="Address City" />
                        <asp:BoundField DataField="City"
                                        Headertext="City"
                                        SortExpression="Region" />
                        <asp:BoundField DataField="Country"
                                        HeaderText="Country"
                                        SortExpression="Country" />
                    </Columns>

                </asp:GridView>

            </asp:View>
            
        </asp:MultiView>
    </section>

</asp:Content>