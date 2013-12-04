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

        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="txtUser" 
            ErrorMessage="" 
            ValidationExpression="^[0-9a-zA-ZåäöÅÄÖ]{4,10}$" />
        <br />
        Salasana:
    <asp:TextBox ID="txtPasswd" runat="server" TextMode="Password"></asp:TextBox>

        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
            ControlToValidate="txtPasswd" 
            ErrorMessage="" 
            ValidationExpression="^.*(?=.{4,10})(?=.*\d)(?=.*[a-zåäöA-ZÅÄÖ]).*$" />
        <br />
        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" />
        <asp:Label ID="lblvalidlogin" runat="server"></asp:Label>
        <br />
        <br />
    </div>
</asp:Content>
