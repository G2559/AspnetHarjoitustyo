<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="HTyoLippumestari._default" %>

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
        <div id="admincontent" runat="server">
            <asp:Button ID="Button1" runat="server" Text="Button" />
            <asp:Button ID="Button2" runat="server" Text="Button" />
            <asp:Button ID="Button3" runat="server" Text="Button" />
            <asp:Button ID="Button4" runat="server" Text="Button" />
            <asp:Button ID="Button5" runat="server" Text="Button" />
            <asp:Button ID="Button6" runat="server" Text="Button" />
        </div>

        <asp:Repeater ID="repEvent" runat="server">
            <ItemTemplate>
                <table style="margin-bottom:15px; width:700px;">
                    <tr>
                        <div style="background-color:black;color:white; float:left; width:500px;"><%# DataBinder.Eval(Container.DataItem, "eventname") %> - <%# DataBinder.Eval(Container.DataItem, "venuename") %> - <%# DataBinder.Eval(Container.DataItem, "date", "{0:dd/MM/yyyy | H:mm}") %><br />
                            <div style="background-color:pink; color:black;"><%# DataBinder.Eval(Container.DataItem, "description") %></div>
                            <div style="float:left;">Ikäraja: <%# DataBinder.Eval(Container.DataItem, "agelimit") %></div> <br />
                            <div style="float:left;"><a href="#">OSTA LIPPU!</a></div>
                        </div>
                        <div style="width:200px; float:left;">IMG</div>
                        <br />
                    </tr>
                </table>
                <br />
            </ItemTemplate>
        </asp:Repeater>

    </div>
</asp:Content>
