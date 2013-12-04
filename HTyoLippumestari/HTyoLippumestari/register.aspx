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
        <asp:Label ID="lblRegister" runat="server" ReadOnly="false"></asp:Label>
        <br />
        Etunimi:
    <br />
        <asp:TextBox ID="txtFirstname" placeholder="Etunimi" runat="server" MaxLength="44"></asp:TextBox>

      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="txtFirstname" 
            ErrorMessage="Etunimen täytyy sisältää vähintään 3 kirjainta" 
            ValidationExpression="^[a-zA-ZåäöÅÄÖ-]{3,40}$" />

        <br />
        <br />
        Sukunimi:
        <br />
        <asp:TextBox ID="txtLastname" placeholder="Sukunimi" runat="server" MaxLength="44"></asp:TextBox>

        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
            ControlToValidate="txtLastname" 
            ErrorMessage="Sukunimen täytyy sisältää vähintään 3 kirjainta" 
            ValidationExpression="^[a-zA-ZåäöÅÄÖ-]{3,40}$" />

        <br />
        <br />
        Käyttäjätunnus:<br />
        <asp:TextBox ID="txtUser1" runat="server" MaxLength="44"></asp:TextBox>*

        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator3" controltovalidate="txtUser1" errormessage="Anna käyttäjätunnnus!" />

        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
            ControlToValidate="txtUser1" 
            ErrorMessage="Käyttäjätunnuksen pituus 4-10 numeroa tai kirjainta (a-z) eikä saa sisältää erikoismerkkejä" 
            ValidationExpression="^[0-9a-zA-Z]{4,10}$" />

        <br />
        <br />
        Anna salasana:<br />
        <asp:TextBox ID="txtPsswd" runat="server" MaxLength="40" TextMode="Password"></asp:TextBox>*

        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="txtPsswd" errormessage="Anna salasana!" />

        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
            ControlToValidate="txtPsswd" 
            ErrorMessage="4-10 kirjaiminen salasana, vähintään 1 numero ja isoja sekä pieniä kirjaimia" 
            ValidationExpression="^.*(?=.{4,50})(?=.*\d)(?=.*[a-zåäö])(?=.*[A-ZÅÄÖ]).*$" />

        <br />
        <br />
        Varmista salasana:<br />
        <asp:TextBox ID="txtPasswd2" runat="server" MaxLength="400" TextMode="Password"></asp:TextBox>*

        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" controltovalidate="txtPasswd2" errormessage="Varmista salasana! " />

        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
            ControlToValidate="txtPasswd2" 
            ErrorMessage="" 
            ValidationExpression="^.*(?=.{4,50})(?=.*\d)(?=.*[a-zåäö])(?=.*[A-ZÅÄÖ]).*$" />

        <asp:CompareValidator id="comparePasswords" 
          runat="server"
          ControlToCompare="txtPsswd"
          ControlToValidate="txtPasswd2"
          ErrorMessage="Salasanat eivät ole samat!"
          Display="Dynamic" />

        <br />
        
        <br />
        Osoite:<br />
        <asp:TextBox ID="txtAddress" runat="server" MaxLength="44"></asp:TextBox>

        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
            ControlToValidate="txtAddress" 
            ErrorMessage="Osoitteen tulee sisältää vähintään 3 kirjainta ja vähintään yhden numeron" 
            ValidationExpression="^^.*(?=.{3,40})(?=.*\d)(?=.*[a-zåäöA-ZÅÄÖ]).*$" />

        <br />
        <br />
        Postinumero:<br />
        <asp:TextBox ID="txtPostal" runat="server" Width="42px" MaxLength="5"></asp:TextBox>

        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" 
            ControlToValidate="txtPostal" 
            ErrorMessage="Postinumeron tulee sisältää 5 numeroa" 
            ValidationExpression="^[0-9]{5}$" />

        <br />
        <br />
        Kaupunki:<br />
        <asp:TextBox ID="txtCity" runat="server" MaxLength="44"></asp:TextBox>

        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" 
            ControlToValidate="txtCity" 
            ErrorMessage="Kaupunki ei voi olla tyhjä tai sisältää erikoismerkkejä" 
            ValidationExpression="^[a-zA-ZåäöÅÄÖ-]{2,40}$" />

        <br />
        <br />
        Puhelinnumero:<br />
        <asp:TextBox ID="txtNro" runat="server" MaxLength="44"></asp:TextBox>

        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" 
            ControlToValidate="txtNro" 
            ErrorMessage="Puhelinnumeron tulee sisältää 6-10 numeroa" 
            ValidationExpression="^[0-9]{6,10}$" />
        <br />
        <br />
        E-mail:<br />
        <asp:TextBox ID="txtEmail" runat="server" MaxLength="44"></asp:TextBox>*

        <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" 
            ControlToValidate="txtEmail" 
            ErrorMessage="Sähköpostiosoite muotoa esimerkki@sposti.com" 
            ValidationExpression="^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$" />

        <br />
        <br />
        <asp:CheckBox ID="cbTos" runat="server" Text="Hyväksyn"  />
        &nbsp;<a href="misc/termsofservice.aspx">Ehdot</a>

        <asp:CustomValidator runat="server" ID="CheckBoxRequired" EnableClientScript="true"
            OnServerValidate="CheckBoxRequired_ServerValidate" >Sinun täytyy hyväksyä ehdot</asp:CustomValidator>

        <br />
        <br />

        <asp:Button ID="btnRegister" runat="server" Text="Rekisteröidy" OnClick="btnRegister_Click" Enabled="true" />
        <br />

    </div>
</asp:Content>
