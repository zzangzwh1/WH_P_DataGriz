<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ica11_Wonhyuk.aspx.cs"
    Inherits="ica11_Wonhyuk" Theme="SkinFile"  MasterPageFile="~/MasterPage.master"  
    Title="ICA11 – Code Behind Queries"%> 


<asp:Content ID="ICA11Page" runat="server" ContentPlaceHolderID="_Main">

    <section>
        <header>
            <h2>ICA11 - Code Behind Queries</h2> <hr />
        </header>
    </section>
    <section>
        <asp:Label ID="_lblPickSupplier" runat="server" Text="Pick a Supplier"></asp:Label>
        <asp:DropDownList ID="_ddlSuppliers" runat="server" AutoPostBack="true" OnSelectedIndexChanged="_ddlSuppliers_SelectedIndexChanged"/>
        <asp:TextBox ID="_tbFilter" runat="server"/>
        <asp:Button ID="_btnFilter" runat="server" Text="Filter" OnClick="_btnFilter_Click" />
    </section>
    <section>      
             <asp:Table runat="server" ID="_tblProducts" CssClass="_table"></asp:Table>
    </section>
</asp:Content>