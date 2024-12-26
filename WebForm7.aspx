<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm7.aspx.cs" Inherits="Newsletter.WebForm7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 58%;
        }
        .auto-style2 {
            width: 243px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Newsletter Campaign</h2>
            <table cellpadding="2" class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblCampaign1" runat="server" Text="Campaign Name:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCompaign" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblRecipients" runat="server" Text="Recipients:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRecipients" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblLayout" runat="server" Text="Layout:"></asp:Label>
                    </td>
                    <td>
                       <asp:DropDownList ID="dropLayout" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dropLayout_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblThumbnail" runat="server" Text="Thumbnail:"></asp:Label>
                    </td>
                    <td>
                        <asp:Image ID="ImageThumbnail" runat="server" ImageUrl="~/Image/JLR-Logo.png" Height="100px" Width="100px" />
                   </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblEmail" runat="server" Text="Sender Email:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="dropEmail" runat="server">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>taskt4638@gmail.com</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                  <asp:Button ID="btnDraft" runat="server" Text="Draft Campaign" OnClick="btnDraft_Click" />
                  <asp:Button ID="btnSend" runat="server" Text="Send Campaign" OnClick="btnSend_Click" />
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
        </div>
    </form>
  
</body>
</html>
