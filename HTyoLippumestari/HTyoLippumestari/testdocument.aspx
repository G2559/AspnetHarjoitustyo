<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testdocument.aspx.cs" Inherits="HTyoLippumestari.testdocument" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
            <asp:GridView ID="GVUser" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
            <Columns>

                <asp:BoundField DataField="userID" HeaderText="ID" Visible="False" ShowHeader="False" />
                <asp:BoundField DataField="username" HeaderText="Käyttäjätunnus" />
                <asp:BoundField DataField="firstname" HeaderText="Etunimi" />
                <asp:BoundField DataField="lastname" HeaderText="Sukunimi" />
                <asp:BoundField DataField="address" HeaderText="Osoite" />
                <asp:BoundField DataField="postalcode" HeaderText="Postinumero" />
                <asp:BoundField DataField="city" HeaderText="Postipaikka" />
                <asp:BoundField DataField="puhnro" HeaderText="Puhelinnumero" />
                <asp:BoundField DataField="email" HeaderText="Email" />

            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>

    </div>
    </form>
</body>
</html>
