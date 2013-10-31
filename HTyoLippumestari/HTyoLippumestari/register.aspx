<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="HTyoLippumestari.register" %>

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
        Nimi
    <br />
        <asp:TextBox ID="txtFirstname" runat="server" MaxLength="44">Etunimi</asp:TextBox>
        <asp:TextBox ID="txtLastname" runat="server" MaxLength="44">Sukunimi</asp:TextBox>
        <br />
        <br />
        Käyttäjätunnus:<br />
        <asp:TextBox ID="txtUser1" runat="server" MaxLength="44"></asp:TextBox>
        <br />
        <br />
        Anna salasana:<br />
        <asp:TextBox ID="txtPsswd" runat="server" MaxLength="40"></asp:TextBox>
        <br />
        <br />
        Varmista salasana:<br />
        <asp:TextBox ID="txtPasswd2" runat="server" MaxLength="400"></asp:TextBox>
        <br />
        <br />
        Osoite:<br />
        <asp:TextBox ID="txtAddress" runat="server" MaxLength="44"></asp:TextBox>
        <br />
        <br />
        Postinumero:<br />
        <asp:TextBox ID="txtPostal" runat="server" Width="42px" MaxLength="5"></asp:TextBox>
        <br />
        <br />
        Kaupunki:<br />
        <asp:TextBox ID="txtCity" runat="server" MaxLength="44"></asp:TextBox>
        <br />
        <br />
        Puhelinnumero:<br />
        <asp:TextBox ID="txtNro" runat="server" MaxLength="44"></asp:TextBox>
        <br />
        <br />
        E-mail:<br />
        <asp:TextBox ID="txtEmail" runat="server" MaxLength="44"></asp:TextBox>
        <br />
        <br />
        <asp:CheckBox ID="cbTos" runat="server" Text="Hyväksyn" />
        &nbsp;<a href="misc/termsofservice.aspx">Ehdot</a>
        <br />
        <asp:CheckBox ID="cbMisc" runat="server" Text="Hyväksyn" />
        &nbsp;<a href="#">LUO LINKKI JOS TÄMÄKIN!</a>
        <br />
        <br />
        <asp:Button ID="btnRegister" runat="server" Text="Rekisteröidy" OnClick="btnRegister_Click" />
        <br />
        <br />
        <asp:TextBox ID="txtDebug" runat="server" ReadOnly="True"></asp:TextBox>
        <br />
    </div>
</asp:Content>
