<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard3.aspx.cs" Inherits="Newsletter.Dashboard3" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Hello</title>
    <!-- css link -->
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
     <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="fonts1/css/font-awesome.min.css" rel="stylesheet" />
    <link href="Css1/bootstrap.min.css" rel="stylesheet" />
   
    <link href="Css1/custom.css" rel="stylesheet" />

    <!-- JaveScript link -->
    <script src="js1/jquery-3.6.0.min.js"></script> 
    <script src="js1/bootstrap.min.js"></script>
    <script src="js1/nprogress_2.0.js"></script>
   <script src="js1/index.js"></script>
    <script src="js1/custom.js"></script>
     <style type="text/css">
         .auto-style1 {
             left: -51px;
             top: 0px;
             width: 241px;
         }
         .auto-style2 {
             left: -37px;
             top: 0px;
             width: 225px;
         }
         .auto-style3 {
             left: -35px;
             top: 0px;
             width: 225px;
         }
         .auto-style4 {
             left: -37px;
             top: 0px;
             width: 227px;
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
                                <li class="auto-style4"><a><i class="fa fa-home"></i> Start <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li><a href="Dashboard.aspx">Dashboard</a></li>
                                    </ul>
                                </li>
                                <li class="auto-style3"><a><i class="fa fa-edit"></i> Email addresses <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li><a href="EmployeesList.aspx">Recipients list</a></li>
                                        <li><a href="AddNewEmployee.aspx">Add recipient</a></li>
                                       
                                    </ul>
                                </li>
                                <li class="auto-style3"><a><i class="fa fa-desktop"></i> Email layouts <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li><a href="#">Templates list</a></li>
                                        <li><a href="#">Add new template</a></li>
                                       
                                    </ul>
                                </li>
                                <li class="auto-style3"><a><i class="fa fa-table"></i> Your campaigns <span class="fa fa-chevron-down"></span></a>
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
                                        <li><a href="#">Login</a></li>
                                        
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="menu_section">
                            <h3>Special addons</h3>
                            <ul class="nav side-menu">
                                <li class="auto-style1"><a><i class="fa fa-bug"></i> Usefull extras <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                          <li><a href="#">About</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- /sidebar menu -->

                    <!-- /menu footer buttons -->
                    <%--<div class="sidebar-footer ">
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add recipient"><span class="fa fa-edit" aria-hidden="true"></span></a>
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add new template"><span class="fa fa-desktop" aria-hidden="true"></span></a>
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Prepare new campaign"><span class="fa fa-table" aria-hidden="true"></span></a>
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Shut down"><span class="fa fa-power-off" aria-hidden="true"></span></a>
                    </div>--%>
                    <!-- /menu footer buttons -->
                </div>
            </div>

            <!-- top navigation -->
           
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
               
            
            </div>
        </div>
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
