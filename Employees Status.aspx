<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employees Status.aspx.cs" Inherits="Newsletter.Employees_Status" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
         <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>

<div class="container mt-5">
    <h2>Employee List</h2>
    <asp:GridView ID="gvEmployees" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
        <Columns>
            <asp:BoundField DataField="EMP_NAME" HeaderText="Employee Name" />
            <asp:BoundField DataField="EMP_EMAILID" HeaderText="Email" />
            <asp:BoundField DataField="DEPARTMENT" HeaderText="Department" />
            <asp:BoundField DataField="Status" HeaderText="Status" />
        </Columns>
    </asp:GridView>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>  </form>
</body>
</html>
