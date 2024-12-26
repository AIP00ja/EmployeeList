<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNewEmployee.aspx.cs" Inherits="Newsletter.AddNewEmployee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblEmpname" runat="server" Text="Employee Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtname" runat="server" Height="26px" Width="139px" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblemail" runat="server" Text="Email Id"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtemail" runat="server" Height="26px" Width="139px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lbldept" runat="server" Text="Department"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtdept" runat="server" Height="26px" Width="139px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lbldesign" runat="server" Text="Designation"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtdesignation" runat="server" Height="26px" Width="139px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblRegions" runat="server" Text="Regions"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlRegions" runat="server">
                        <asp:ListItem>Select</asp:ListItem>
                        <asp:ListItem>Africa</asp:ListItem>
                        <asp:ListItem>Asia</asp:ListItem>
                        <asp:ListItem>Europe</asp:ListItem>
                        <asp:ListItem>Americas</asp:ListItem>
                        <asp:ListItem>Oceania</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblcountries" runat="server" Text="Countries"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtcountries" runat="server" Height="26px" Width="139px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lbllocation" runat="server" Text="Location"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtlocation" runat="server" Height="26px" Width="139px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                   <asp:Button ID="btInsert" runat="server" Text="Save" OnClick="btInsert_Click" Visible="false" />
                   <asp:Button ID="btnUpdate" runat="server" Text="Update Employee" OnClick="btnUpdate_Click" Visible="false" />
                 
                    </td>
            </tr>
        </table>
        
    </form>
</body>
</html>
