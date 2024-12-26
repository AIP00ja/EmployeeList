﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Newsletter.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <!-- CSS Links -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="fonts1/css/font-awesome.min.css" rel="stylesheet" />
    <link href="Css1/bootstrap.min.css" rel="stylesheet" />
   
<link href="Css/Stylee.css" rel="stylesheet" />
    <!-- JavaScript Links -->
    <script src="js1/jquery-3.6.0.min.js"></script>
    <script src="js1/bootstrap.min.js"></script>
    <script src="js1/nprogress_2.0.js"></script>
    <script src="js1/index.js"></script>
    <script src="js1/custom.js"></script>
</head>
<body class="nav-md">
    <form id="form1" runat="server">
        <div class="container body">
            <div class="main_container">
                <!-- Sidebar -->
                <div class="col-md-3 left_col">
                    <div class="left_col scroll-view">
                        <div class="navbar nav_title">
                            <a href="#" class="site_title"><i class="fa fa-envelope fa-spin"></i> <span>E-mailer</span></a>
                        </div>
                        <div class="clearfix"></div>
                        <!-- Profile Info -->
                        <div class="profile">
                            <div class="profile_pic">
                                <img src="#" alt="..." class="img-circle profile_img" />
                            </div>
                            <div class="profile_info">
                                <span>Welcome,</span>
                                <h2>What we do?</h2>
                            </div>
                        </div>
                        <br />
                        <!-- Sidebar Menu -->
                        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                            <div class="menu_section">
                                <h3>Main menu</h3>
                                <ul class="nav side-menu">
                                    <li><a><i class="fa fa-home"></i> Start <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="Dashboard.aspx">Dashboard</a></li>
                                        </ul>
                                    </li>
                                    <li><a><i class="fa fa-edit"></i> Email Addresses <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="EmployeesList.aspx">Recipients List</a></li>
                                            <li><a href="AddNewEmployee.aspx">Add Recipient</a></li>
                                        </ul>
                                    </li>
                                    <li><a><i class="fa fa-table"></i> Your Campaigns <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="#">Prepare New Campaign</a></li>
                                            <li><a href="#">List Sent Campaigns</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Top Navigation -->
                <div class="top_nav">
                    <div class="nav_menu">
                        <nav class="" role="navigation">
                            <div class="nav toggle">
                                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                            </div>
                        </nav>
                    </div>
                </div>
                <!-- Main Content -->
                <div class="right_col" role="main">
                    <div class="container my-5">
                        <!-- Employee List Section -->
                        <div>
                            <h2>Employee List</h2>
                            <asp:Button ID="txtAddEmp" runat="server" Text="+ Add Employee" CssClass="btn btn-primary" />
                        </div>
                        <br />
                        <div class="mb-4 row">
                            <div class="col-md-4">
                                <asp:TextBox ID="txtsearchh" runat="server" CssClass="form-control" Placeholder="Search by name, email, country..." />
                            </div>
                            <div class="col-md-2">
                                <asp:Button ID="btsearch" runat="server" Text="Search" CssClass="btn btn-primary w-100" />
                            </div>
                            <div class="col-md-2">
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#filterModal">Filter</button>
                                <div class="modal fade" id="filterModal" tabindex="-1" aria-labelledby="filterModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="filterModalLabel">Filter Options</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <!-- Filter Options -->
                                                <asp:Repeater ID="rptFilters" runat="server">
                                                    <ItemTemplate>
                                                        <div class="form-check">
                                                            <asp:CheckBox ID="chkFilter" runat="server" Text='<%# Eval("FilterName") %>' Value='<%# Eval("FilterValue") %>' />
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                <asp:Button ID="btFilters" runat="server" Text="Apply Filters" CssClass="btn btn-primary" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <asp:GridView ID="gvEmployees" runat="server" DataKeyNames="EMP_ID" ShowHeader="true" AutoGenerateColumns="False"
                            CssClass="table table-striped table-hover" AllowPaging="True" PageSize="5">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="ChkHeader" runat="server" AutoPostBack="true" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="ChkEmpty" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="EMP_ID" HeaderText="ID" />
                                <asp:BoundField DataField="EMP_NAME" HeaderText="Employee Name" />
                                <asp:BoundField DataField="EMP_EMAILID" HeaderText="Email Id" />
                                <asp:BoundField DataField="DEPARTMENT" HeaderText="Department" />
                                <asp:BoundField DataField="DESIGNATION" HeaderText="Designation" />
                                <asp:BoundField DataField="LOCATION" HeaderText="Location" />
                                <asp:BoundField DataField="COUNTRY" HeaderText="Country" />
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:Button ID="btEdit" runat="server" Text="Edit" CommandArgument='<%# Eval("EMP_ID") %>' />
                                        <asp:LinkButton ID="btDelete" runat="server" OnClientClick="return confirm('Are you sure?');">
                                            Delete
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>