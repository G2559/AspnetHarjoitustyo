<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pswdhash.aspx.cs" Inherits="HTyoLippumestari.pswdhash" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="txtPwd" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnConvert" runat="server" Text="Häshää" OnClick="btnConvert_Click" />
    </div>
        <p>
        <asp:TextBox ID="txtHash" runat="server" Height="104px" TextMode="MultiLine" Width="992px"></asp:TextBox> 
        </p>
    </form>
</body>
</html>
