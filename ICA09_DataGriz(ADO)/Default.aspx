<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" MasterPageFile="~/MasterPage.master" Title="Default Page" %>

<asp:Content ID="_DefaultPage" runat="server" ContentPlaceHolderID="_Main">
    <asp:Label Text="DemoLabel" ID="_lblDefault" runat="server" skinID="demoLbl"/>
    <ul>
        <li> <asp:LinkButton ID="Default" Text="Default" runat="server" PostBackUrl="~/Default.aspx" /></li>
         <li> <asp:LinkButton ID="ICA09" Text="ICA-09" runat="server" PostBackUrl="~/ica09_Wonhyuk.aspx" /></li>
        <li> <asp:LinkButton ID="LinkButton1" Text="ICA-10" runat="server" PostBackUrl="~/ica10_Wonhyukcho.aspx" /></li>
        <li> <asp:LinkButton ID="LinkButton2" Text="ICA-11" runat="server" PostBackUrl="~/ica11_Wonhyuk.aspx" /></li>
         <li> <asp:LinkButton ID="LinkButton3" Text="ICA-12" runat="server" PostBackUrl="~/ICA_12WonhyukCho.aspx" /></li>
          <li> <asp:LinkButton ID="LinkButton4" Text="ICA-13" runat="server" PostBackUrl="~/ica13_WonhyukCHo.aspx" /></li>
    </ul>
</asp:Content>
