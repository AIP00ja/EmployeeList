<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeesList.aspx.cs" Inherits="Newsletter.EmployeesList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee List</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link href="fonts1/css/font-awesome.min.css" rel="stylesheet" />
    <link href="Css1/bootstrap.min.css" rel="stylesheet" />
   <link href="Css1/animate.min.css" rel="stylesheet" />
    <link href="Css1/custom.css" rel="stylesheet" />

   <%--<link href="Css1/custom.css" rel="stylesheet" />--%>
    <link href="Css1/iCheck/green.css" rel="stylesheet" />
    <link href="Css1/floatexamples.css" rel="stylesheet" />

   

  <%-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    --%><link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
     <!-- JaveScript link -->
    <script src="js1/jquery-3.6.0.min.js"></script> 
    <script src="js1/bootstrap.min.js"></script>
    <script src="js1/nprogress_2.0.js"></script>
   <script src="js1/index.js"></script>
    <script src="js1/custom.js"></script>
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
     <div class="container body">
        <div class="main_container">
            <div class="col-md-3 left_col">
                <div class="left_col scroll-view">
                    <div class="navbar nav_title">
                        <a href="#" class="site_title"><i class="fa fa-envelope fa-spin"></i> <span>E-mailer</span></a>
                    </div>
                    <div class="clearfix"></div>

                    <!-- menu prile quick info -->
                    <div class="profile">
                        <div class="profile_pic">
                            <img src="#" alt="..." class="img-circle profile_img"/>
                        </div>
                        <div class="profile_info">
                            <span>Welcome,</span>
                            <h2>What we do?</h2>
                        </div>
                    </div>
                    <!-- /menu prile quick info -->

                    <br />

                    <!-- sidebar menu -->
                    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                        <div class="menu_section">
                            <p>&nbsp;</p>
                            <h3>Main menu</h3>
                            <ul class="nav side-menu">
                                <li><a><i class="fa fa-home"></i> Start <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li><a href="Dashboard.aspx">Dashboard</a></li>
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
                                <li><a><i class="fa fa-cogs"></i> Settings <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li><a href="#">Login</a></li>
                                        
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="menu_section">
                            <h3>Special addons</h3>
                            <ul class="nav side-menu">
                                <li><a><i class="fa fa-bug"></i> Usefull extras <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                          <li><a href="#">About</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- /sidebar menu -->

                    <!-- /menu footer buttons -->
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
            <div class="col-md-9 col-lg-10 p-4">
                    <div class="row mb-4">
                        <div class="col">
                            <h2>Welcome to the Dashboard</h2>
                            <small>Add new or manage email addresses, campaigns, and templates</small>
                        </div>
                    </div>

                    <!-- Employee List Section -->
                    <div class="card">
                        <div class="card-header">
                            <h3>Adding new email address</h3>
                        </div>
                        <div class="card-body">
                            <!-- Add Employee Button -->
                            <div class="d-flex justify-content-between">
                                <h5>Employee List</h5>
                                <asp:Button ID="txtAddEmp" runat="server" Text="+ Add Employee" CssClass="btn btn-primary" OnClick="txtAddEmp_Click"/>
                            </div>
                            <br />
                            
                            <!-- Search and Filter Section -->
                            <div class="row mb-4">
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtsearchh" runat="server" class="form-control" placeholder="Search by name, email, country..."></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="btsearch" runat="server" Text="Search" CssClass="btn btn-outline-primary w-100" OnClick="btsearch_Click" />
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#filterModal">
                                        <i class="fa fa-filter"></i> Filter
                                    </button>  
                                </div>
                            </div>
                            
                            <!-- Filter Modal -->
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
                                            
                                            <!-- Filter Options -->
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

                            <!-- Grid of Employees -->
                            <asp:GridView ID="gvEmployees" runat="server" DataKeyNames="EMP_ID" AutoGenerateColumns="False" CssClass="table table-bordered table-striped" AllowPaging="True" PageSize="5" OnPageIndexChanging="gvEmployees_PageIndexChanging">
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
                                    <asp:BoundField DataField="EMP_EMAILID" HeaderText="Email" SortExpression="EMP_EMAILID" />
                                    <asp:BoundField DataField="DEPARTMENT" HeaderText="Department" SortExpression="DEPARTMENT" />
                                    <asp:BoundField DataField="DESIGNATION" HeaderText="Designation" SortExpression="DESIGNATION" />
                                    <asp:BoundField DataField="REGION" HeaderText="Region" SortExpression="Region" />
                                    <asp:BoundField DataField="COUNTRY" HeaderText="Country" SortExpression="COUNTRY" />
                                    <asp:BoundField DataField="LOCATION" HeaderText="Location" SortExpression="LOCATION" />
                                    <asp:TemplateField HeaderText="Actions">
                                        <ItemTemplate>
                                            <div class="table-actions">
                                                <asp:Button ID="btEdit" runat="server" Text="Edit" CommandArgument='<%# Eval("EMP_ID") %>' OnClick="btEdit_Click" class="btn btn-sm btn-warning" />
                                                <asp:LinkButton ID="btDelete" runat="server" CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Are you sure you want to delete this record?');" OnClick="btDelete_Click">
                                                    <i class="bi bi-trash"></i> Delete
                                                </asp:LinkButton>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                             <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                        </div>
                    </div>
                </div>
            






      <!-- /page content -->
        </div>
    </div>
    <div id="custom_notifications" class="custom-notifications dsp_none">
        <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group"></ul>
        <div class="clearfix"></div>
        <div id="notif-group" class="tabbed_notifications"></div>
    </div>
    <!-- /footer content -->
         </form>
</body>

</html>
   

