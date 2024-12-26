<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm6.aspx.cs" Inherits="Newsletter.WebForm6" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Employee List</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .badge-active { background-color: #28a745; color: white; }
        .badge-inactive { background-color: #dc3545; color: white; }
        .badge-on-leave { background-color: #ffc107; color: black; }
        .table-actions button { margin-right: 5px; }
        .form-control, .form-select { max-width: 300px; display: inline-block; }   
      
    </style>
    <script>
        function showOptions(optionId) {
            document.querySelectorAll('.filter-options').forEach(option => option.classList.add('d-none'));
            document.getElementById(optionId).classList.remove('d-none');
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container my-5">
             
      <asp:Button ID="btnProceedd" runat="server" Text="Proceed to all" CssClass="btn btn-primary" OnClick="btnProceedd_Click"/>
           <asp:GridView ID="gvEmployees" runat="server" DataKeyNames="EMP_ID" ShowHeader="true" AutoGenerateColumns="False" 
                      CssClass="table table-striped table-hover" AllowPaging="True" PageSize="5" OnPageIndexChanging="gvEmployees_PageIndexChanging">
           <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:CheckBox ID="ChkHeader" runat="server" AutoPostBack="true" OnCheckedChanged="ChkHeader_CheckedChanged" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="ChkEmpty" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="EMP_ID" HeaderText="ID" SortExpression="EMP_ID" />
                    <asp:BoundField DataField="EMP_NAME" HeaderText="Employee Name" SortExpression="EMP_NAME" />
                    <asp:BoundField DataField="EMP_EMAILID" HeaderText="Email Id" SortExpression="EMP_EMAILID" />
                    <asp:BoundField DataField="DEPARTMENT" HeaderText="Department" SortExpression="DEPARTMENT" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <div class="table-actions">
 <asp:Button ID="btnProceed" runat="server" Text="Proceed to Campaign" CssClass="btn btn-primary" OnClick="btnProceed_Click" />
                            
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>   
                </Columns>  
                <PagerSettings Mode="Numeric" Position="Bottom" />
            <PagerStyle HorizontalAlign="Center" />             
            </asp:GridView> 
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>

