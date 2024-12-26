<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm9.aspx.cs" Inherits="Newsletter.WebForm9" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Campaign Status</title>
    <link href="Styles/Bootstrap.min.css" rel="stylesheet" />
    <style>
        .status-draft { color: gray; }
        .status-pending { color: orange; }
        .status-success { color: green; }
        .status-failed { color: red; }
    </style>
</head>
<body>
   <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblmsg" runat="server" CssClass="message"></asp:Label>

            <asp:DropDownList ID="ddlStatusFilter" runat="server" AutoPostBack="true" 
                              OnSelectedIndexChanged="ddlStatusFilter_SelectedIndexChanged">
                <asp:ListItem Value="All">All</asp:ListItem>
                <asp:ListItem Value="Draft">Draft</asp:ListItem>
                <asp:ListItem Value="Pending">Pending</asp:ListItem>
                <asp:ListItem Value="Success">Success</asp:ListItem>
                <asp:ListItem Value="Failed">Failed</asp:ListItem>
            </asp:DropDownList>

            <asp:GridView ID="gvDraftCampaigns" runat="server" AutoGenerateColumns="False" 
                          CssClass="table table-bordered">
                <Columns>
                    <asp:BoundField DataField="CampaignName" HeaderText="Campaign Name" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:BoundField DataField="CreatedDate" HeaderText="Created Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnViewEmployees" runat="server" Text="View Employees" 
                                        CommandArgument='<%# Eval("SendID") %>' OnClick="btnViewEmployees_Click" />

                            <asp:Button ID="btnResend" runat="server" Text="Resend" 
                                        CommandArgument='<%# Eval("SendID") %>' OnClick="btnResend_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
