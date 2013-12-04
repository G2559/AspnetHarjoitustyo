<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="usersummary.aspx.cs" Inherits="HTyoLippumestari.usersummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="cssmenu">
        <ul>
            <li class="active"><a href="default.aspx"><span>Etusivu</span></a></li>
            <li><a href="music.aspx"><span>Musiikki</span></a></li>
            <li><a href="theater.aspx"><span>Teatteri</span></a></li>
            <li><a href="sports.aspx"><span>Urheilu</span></a></li>
            <li><a href="family.aspx"><span>Perhe</span></a></li>
            <li class="last"><a href="clubs.aspx"><span>Klubit</span></a></li>
        </ul>
    </div>

    <div id="content">
        <asp:FormView DataKeyNames="userID" ID="FVUser" runat="server" CellPadding="4" ForeColor="#333333" Font-Names="Georgia" Width="360px">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />

            <HeaderTemplate>
                <asp:Label ID="lblHeader" runat="server" Text="Tietosi" />
            </HeaderTemplate>


            <ItemTemplate>
                <table>
                    <tr hidden="hidden">
                        <td hidden="hidden">userID:
                        </td>
                        <td hidden="hidden">
                            <asp:TextBox ID="txtUserID" runat="server" ReadOnly="True" Text='<%# Eval("userID") %>' Visible="False" />
                        </td>
                    </tr>
                    <tr>
                        <td>Käyttäjänimi:
                        </td>
                        <td>
                            <asp:TextBox ID="txtUsername" runat="server" ReadOnly="True" Text='<%# Eval("username") %>' />
                        </td>
                    </tr>
                    <tr hidden="hidden">
                        <td>Salasana:
                        </td>
                        <td>
                            <asp:TextBox ID="txtPassword" runat="server" ReadOnly="True" Text='<%# Eval("password") %>' TextMode="Password" Visible="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>Etunimi:

                        </td>
                        <td>
                            <asp:TextBox ID="txtFirstname" runat="server" ReadOnly="True" Text='<%# Eval("firstname") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>Sukunimi:
                        </td>
                        <td>
                            <asp:TextBox ID="txtLastname" runat="server" ReadOnly="True" Text='<%# Eval("lastname") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>Osoite:
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddress" runat="server" ReadOnly="True" Text='<%# Eval("address") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>Postinumero:
                        </td>
                        <td>
                            <asp:TextBox ID="txtPostal" runat="server" ReadOnly="True" Text='<%# Eval("postalcode") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>Postipaikka:
                        </td>
                        <td>
                            <asp:TextBox ID="txtCity" runat="server" ReadOnly="True" Text='<%# Eval("city") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>Puhelin:
                        </td>
                        <td>
                            <asp:TextBox ID="txtPuhnro" runat="server" ReadOnly="True" Text='<%# Eval("phone") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>Email:
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" ReadOnly="True" Text='<%# Eval("email") %>' />
                        </td>
                    </tr>

                </table>
            </ItemTemplate>
        </asp:FormView>

        <table id="tblEdit" runat="server">
            <tr hidden="hidden">
                <td>userID:
                </td>
                <td>
                    <asp:TextBox ID="txtUserid" runat="server" ReadOnly="True" />
                </td>
            </tr>
            <tr>
                <td>Käyttäjänimi:
                </td>
                <td>
                    <asp:TextBox ID="txtUsername" runat="server" ReadOnly="True" />
                </td>

            </tr>
            <tr>
                <td>Salasana:

                </td>
                <td>
                    <asp:TextBox ID="txtPassword1" runat="server" TextMode="Password" />
                </td>
                <td>
                    <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="txtPassword1" errormessage="Anna salasana!" />

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ControlToValidate="txtPassword1" 
                        ErrorMessage="4-10 kirjaiminen salasana, vähintään 1 numero ja isoja sekä pieniä kirjaimia" 
                        ValidationExpression="^.*(?=.{4,10})(?=.*\d)(?=.*[a-zåäöA-ZÅÄÖ]).*$" />
                </td>
            </tr>
            <tr>
                <td>Varmista salasana:

                </td>
                <td>
                    <asp:TextBox ID="txtPassword2" runat="server" TextMode="Password" />
                </td>
                <td>
                    <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" controltovalidate="txtPassword2" errormessage="Varmista salasana! " />

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                        ControlToValidate="txtPassword2" 
                        ErrorMessage="" 
                        ValidationExpression="^.*(?=.{4,10})(?=.*\d)(?=.*[a-zåäöA-ZÅÄÖ]).*$" />

                    <asp:CompareValidator id="comparePasswords" 
                      runat="server"
                      ControlToCompare="txtPassword1"
                      ControlToValidate="txtPassword2"
                      ErrorMessage="Salasanat eivät ole samat!"
                      Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td>Etunimi:

                </td>
                <td>
                    <asp:TextBox ID="txtFirstname" runat="server" />
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="txtFirstname" 
            ErrorMessage="Etunimen täytyy sisältää vähintään 3 kirjainta" 
            ValidationExpression="^[a-zA-ZåäöÅÄÖ-]{3,40}$" />

                </td>
            </tr>
            <tr>
                <td>Sukunimi:
                </td>
                <td>
                    <asp:TextBox ID="txtLastname" runat="server" />
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
            ControlToValidate="txtLastname" 
            ErrorMessage="Sukunimen täytyy sisältää vähintään 3 kirjainta" 
            ValidationExpression="^[a-zA-ZåäöÅÄÖ-]{3,40}$" />
                </td>
            </tr>
            <tr>
                <td>Osoite:
                </td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" />
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                        ControlToValidate="txtAddress" 
                        ErrorMessage="Osoitteen tulee sisältää vähintään 3 kirjainta ja vähintään yhden numeron" 
                        ValidationExpression="^^.*(?=.{3,40})(?=.*\d)(?=.*[a-zåäöA-ZÅÄÖ]).*$" />
                </td>
            </tr>
            <tr>
                <td>Postinumero:
                </td>
                <td>
                    <asp:TextBox ID="txtPostal" runat="server" />
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" 
                        ControlToValidate="txtPostal" 
                        ErrorMessage="Postinumeron tulee sisältää 5 numeroa" 
                        ValidationExpression="^[0-9]{5}$" />
                </td>
            </tr>
            <tr>
                <td>Postipaikka:
                </td>
                <td>
                    <asp:TextBox ID="txtCity" runat="server" />
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" 
                        ControlToValidate="txtCity" 
                        ErrorMessage="Kaupunki ei voi olla tyhjä tai sisältää erikoismerkkejä" 
                        ValidationExpression="^[a-zA-ZåäöÅÄÖ-]{2,40}$" />
                </td>
            </tr>
            <tr>
                <td>Puhelin:
                </td>
                <td>
                    <asp:TextBox ID="txtPuhnro" runat="server" />
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" 
                        ControlToValidate="txtPuhnro" 
                        ErrorMessage="Puhelinnumeron tulee sisältää 6-10 numeroa" 
                        ValidationExpression="^[0-9]{6,10}$" />
                </td>
            </tr>
            <tr>
                <td>Email:
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" />
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" 
                        ControlToValidate="txtEmail" 
                        ErrorMessage="Sähköpostiosoite muotoa esimerkki@sposti.com" 
                        ValidationExpression="^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$" />
                </td>
            </tr>
        </table>

        <br />
        <asp:Button ID="btnUpdate" runat="server" Text="Muuta tietoja" OnClick="btnUpdate_Click" />
        <asp:Button ID="btnReady" runat="server" Text="Valmis" OnClick="btnReady_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Peruuta" OnClick="btnCancel_Click" CausesValidation="false"/>
        <br />
        <br />
        <br />
    </div>
</asp:Content>
