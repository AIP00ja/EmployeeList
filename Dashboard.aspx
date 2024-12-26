<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Newsletter.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hello</title>
     <link href="fonts1/css/font-awesome.min.css" rel="stylesheet" />
     <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"/>
   <%-- <link href="Css1/custom.css" rel="stylesheet" />--%>
    <link href="Css1/custom.css" rel="stylesheet" />
    <!-- JaveScript link -->
    <script src="js1/jquery-3.6.0.min.js"></script> 
    <script src="js1/bootstrap.min.js"></script>
    <script src="js1/nprogress_2.0.js"></script>
   <script src="js1/index.js"></script>
    <script src="js1/custom.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function showOptions(optionId) {
            document.querySelectorAll('.filter-options').forEach(option => option.classList.add('d-none'));
            document.getElementById(optionId).classList.remove('d-none');
        }
    </script>
    <style type="text/css">
        .auto-style1 {
            left: -38px;
            top: 0px;
            width: 228px;
        }
        .auto-style2 {
            left: -36px;
            top: 0px;
            width: 226px;
        }
        .auto-style3 {
            padding: 25px 10px 10px;
            width: 89%;
            float: left;
        }
    </style>
</head>
<body class="nav-md">
    <form id="form1" runat="server">
    <div class="container body">
        <div class="main_container">
            <div class="col-md-3 left_col">
                <div class="left_col scroll-view">
                    <div class="navbar nav_title">
                        <a href="#" class="site_title"><i class="fa fa-envelope fa-spin"></i> <span>E-mailer</span></a>
                    </div>
                    <div class="clearfix"></div>
                  
                    <div class="profile">
                        <div class="profile_pic">
                            <img src="#" alt="..." class="img-circle profile_img"/>
                        </div>
                        <div class="profile_info">
                            <span>Welcome,</span>
                            <h2>What we do?</h2>
                        </div>
                    </div>
                   
                    <br />
                 
                    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">

                        <div class="menu_section">
                            <p>&nbsp;</p>
                            <h3>Main menu</h3>
                            <ul class="nav side-menu" style="margin-left: 2px">
                                 <li><a><i class="fa fa-home"></i> Start <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li><a href="EmployeesList.aspx">Dashboard</a></li>
                                        <li><a href="AddNewEmployee.aspx">Dashboard</a></li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-edit"></i> Email addresses <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li><a href="EmployeesList.aspx">Recipients list</a></li>
                                        <li><a href="AddNewEmployee.aspx">Add recipient</a></li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-desktop"></i> Email layouts <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li><a href="#">Templates list</a></li>
                                        <li><a href="#">Add new template</a></li>                                       
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-table"></i> Your campaigns <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li><a href="#">Prepare new campaign</a></li>
                                        <li><a href="#">Waiting list campaign</a></li>
                                        <li><a href="#">Campaigns in progress</a></li>
                                        <li><a href="#">List sent campaigns</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>

                        <div class="menu_section">
                            <h3>System configuration</h3>
                            <ul class="nav side-menu">
                                <li class="auto-style2"><a><i class="fa fa-cogs"></i> Settings <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li><a href="#">Prepare new campaign</a></li>
                                         <li><a href="#">Prepare new campaign</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="menu_section">
                            <h3>Special addons</h3>
                            <ul class="nav side-menu">
                                <li class="auto-style1"><a><i class="fa fa-bug"></i> Usefull extras <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                         <li><a href="#"> Usefull About System configuration</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="sidebar-footer ">
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add recipient"><span class="fa fa-edit" aria-hidden="true"></span></a>
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add new template"><span class="fa fa-desktop" aria-hidden="true"></span></a>
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Prepare new campaign"><span class="fa fa-table" aria-hidden="true"></span></a>
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Shut down"><span class="fa fa-power-off" aria-hidden="true"></span></a>
                    </div>
                    <!-- /menu footer buttons -->
                </div>
            </div>

            <!-- top navigation -->
            <div class="top_nav">
                <div class="nav_menu">
                    <nav class="" role="navigation">
                        <div class="nav toggle">
                           <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                        </div>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#"><%--<button class="btn btn-dark btn-xs">shut down</button>--%></a></li>
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- /top navigation -->
            <!-- page content -->
            <div class="right_col" role="main">
                <div class="page-title">
    <div class="title_left">
        <h3>Welcome to Dashboard <small><%--(Add new)--%></small></h3>
    </div>
</div>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>Adding new email address</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">               
                <div class="container my-5">
             <!-- Add Emp -->
             <div>
                <h2>Employee List</h2>
                <asp:Button ID="txtAddEmp" runat="server" Text="+ Add Employee" CssClass="btn btn-primary" OnClick="txtAddEmp_Click"/>   
            </div>
            <br />
               <div class="mb-4 row">
                    <!-- Search -->
                <div class="col-md-4">
                    <asp:TextBox ID="txtsearchh" runat="server" class="form-control" placeholder="Search by name, email, country..."></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btsearch" runat="server" Text="Search" CssClass="btn btn-primary w-100" OnClick="btsearch_Click" />
                </div>
                    <!-- Filters -->
                <div class="col-md-2">
              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#filterModal">
                Filter
            </button>  
                     <div class="modal fade" id="filterModal" tabindex="-1" aria-labelledby="filterModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="filterModalLabel">Filter Options</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="btn-group mb-3" role="group">
                                <button type="button" class="btn btn-secondary" onclick="showOptions('departmentOptions')">Department</button>
                                <button type="button" class="btn btn-secondary" onclick="showOptions('designationOptions')">Designation</button>
                                <button type="button" class="btn btn-secondary" onclick="showOptions('locationOptions')">Location</button>
                                <button type="button" class="btn btn-secondary" onclick="showOptions('regionOptions')">Region</button>
                                <button type="button" class="btn btn-secondary" onclick="showOptions('countryOptions')">Country</button>
                            </div>
                            <div id="departmentOptions" class="filter-options d-none">
                                <h6>Department</h6>
                                <asp:Repeater ID="rptDepartment" runat="server">
                                    <ItemTemplate>
                                        <div class="form-check">
                                            <asp:CheckBox ID="chkDepartment" runat="server" Text='<%# Eval("DEPARTMENT") %>' Value='<%# Eval("DEPARTMENT") %>' />                                         
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div id="designationOptions" class="filter-options d-none">
                                <h6>Designation</h6>
                                <asp:Repeater ID="rptDesignation" runat="server">
                                    <ItemTemplate>
                                        <div class="form-check">
                                            <asp:CheckBox ID="chkDesignation" runat="server" Text='<%# Eval("DESIGNATION") %>' Value='<%# Eval("DESIGNATION") %>' />
                                              </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div id="locationOptions" class="filter-options d-none">
                                <h6>Location</h6>
                                <asp:Repeater ID="rptLocation" runat="server">
                                    <ItemTemplate>
                                        <div class="form-check">
                                             <asp:CheckBox ID="chkLocation" runat="server" Text='<%# Eval("LOCATION") %>' Value='<%# Eval("LOCATION") %>' />
                                               </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div id="regionOptions" class="filter-options d-none">
                                <h6>Region</h6>
                                <asp:Repeater ID="rptRegion" runat="server">
                                    <ItemTemplate>
                                        <div class="form-check">
                                            <asp:CheckBox ID="chkRegion" runat="server" Text='<%# Eval("REGION") %>' Value='<%# Eval("REGION") %>' />                                         
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div id="countryOptions" class="filter-options d-none">
                                <h6>Country</h6>
                                <asp:Repeater ID="rptCountry" runat="server">
                                    <ItemTemplate>
                                        <div class="form-check">
                                            <asp:CheckBox ID="chkCountry" runat="server" Text='<%# Eval("COUNTRY") %>' Value='<%# Eval("COUNTRY") %>' />                               
                                           </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <asp:Button ID="btFilters" runat="server" Text="Apply Filters" class="btn btn-primary" OnClick="btFilters_Click" />
                        </div>
                    </div>
                </div>
            </div>               
                </div>
            </div>
            <asp:LinkButton ID="btDeleteAlll" runat="server" CssClass="btn btn-outline-danger btn-sm" OnClientClick="return confirm('Are you sure you want to delete this record?');" OnClick="btDeleteAlll_Click">
      <i class="bi bi-trash"></i>
      </asp:LinkButton>
           <asp:GridView ID="gvEmployees" runat="server" DataKeyNames="EMP_ID" ShowHeader="true" AutoGenerateColumns="False" 
    CssClass="table table-striped table-hover" AllowPaging="True" PageSize="5" OnPageIndexChanging="gvEmployees_PageIndexChanging"> <Columns>
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
                    <asp:BoundField DataField="DESIGNATION" HeaderText="Designation" SortExpression="DESIGNATION" />
                    <asp:BoundField DataField="REGION" HeaderText="Region" SortExpression="Region" />
                    <asp:BoundField DataField="COUNTRY" HeaderText="Country" SortExpression="COUNTRY" />
                    <asp:BoundField DataField="LOCATION" HeaderText="Location" SortExpression="LOCATION" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <div class="table-actions">
                                <asp:Button ID="btEdit" runat="server" Text="Edit" CommandArgument='<%# Eval("EMP_ID") %>' OnClick="btEdit_Click" />

                                <asp:LinkButton ID="btDelete" runat="server" CssClass="btn btn-outline-danger btn-sm" OnClientClick="return confirm('Are you sure you want to delete this record?');" OnClick="btDelete_Click">
                                    <i class="bi bi-trash"></i>
                                </asp:LinkButton>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>   
                </Columns>  
               <PagerSettings Mode="Numeric" Position="Bottom" />
               <PagerStyle HorizontalAlign="Center" />               
            </asp:GridView> 
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
        </div>
            </div>
        </div>
    </div>
</div>               
</div>           
  <!-- /page content -->
   </div>
    </div>
    <!-- /footer content -->
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>

</html>
