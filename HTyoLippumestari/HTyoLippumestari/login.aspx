<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="HTyoLippumestari.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="cssmenu">
        <ul>
            <li><a href="default.aspx"><span>Etusivu</span></a></li>
            <li><a href="music.aspx"><span>Musiikki</span></a></li>
            <li><a href="theater.aspx"><span>Teatteri</span></a></li>
            <li><a href="sports.aspx"><span>Urheilu</span></a></li>
            <li><a href="family.aspx"><span>Perhe</span></a></li>
            <li class="last"><a href="clubs.aspx"><span>Klubit</span></a></li>
        </ul>
    </div>

    <div id="content">
        Käyttäjä:
    <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
        <br />
        Salasana:
    <asp:TextBox ID="txtPasswd" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" />
        <br />
        <asp:TextBox ID="txtB1" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtB2" runat="server" Width="942px"></asp:TextBox>
        <br />
    </div>
</asp:Content>
