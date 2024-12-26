<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeList.aspx.cs" Inherits="Newsletter.EmployeeList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8"/>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <meta http-equiv="Expires" content="0" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="cache-control" content="no-store" />
    <meta http-equiv="cache-control" content="must-revalidate" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="robots" content="noindex,nofollow" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
     <!--end:: external link for icon -->
    <link href="fonts1/css/font-awesome.min.css" rel="stylesheet" />
    <link href="Css1/bootstrap.min.css" rel="stylesheet" />
    <link href="Css1/animate.min.css" rel="stylesheet" />
    <link href="Css1/custom.css" rel="stylesheet" />
    <link href="Css1/iCheck/green.css" rel="stylesheet" />
    <link href="Css1/floatexamples.css" rel="stylesheet" />
    <link href="Css1/nprogress_2.0.css" rel="stylesheet" />
    <link href="Css1/index.css" rel="stylesheet" />
    <link href="Css1/select/select2.min.css" rel="stylesheet" />
    <script>
var 
    dataTableTranslation = {
        lengthMenu: "Display _MENU_ records per page",
        zeroRecords: "Nothing found - sorry",
        sZeroRecords: "Nothing found - sorry",
        info: "Showing page _PAGE_ of _PAGES_",
        infoEmpty: "No records available",
        infoFiltered: "(filtered _TOTAL_ from _MAX_ total records)",
        sSearch: "Search",
        oPaginate:{
            sFirst:"|<",
            sLast:">|",
            sNext:">>",
            sPrevious:"<<"
        }
    },
    lang_c_finished = "finished",
    lang_campaign_please_wait = "please wait...",
    lang_campaign_smtp = "Select SMTP",
    lang_campaign_bg_confirm_txt = "Please confirm background sending!",
    lang_campaign_server_connecting = "connecting to server, please wait...",
    lang_campaign_sending = "sending",
    lang_campaign_sent = "<b>CAPAIGN SENT</b> recipients: ",
    lang_jan = "jan",
    lang_feb = "feb",
    lang_mar = "mar",
    lang_apr = "apr",
    lang_may = "may",
    lang_jun = "jun",
    lang_jul = "jul",
    lang_aug = "aug",
    lang_sep = "sep",
    lang_oct = "oct",
    lang_nov = "nov",
    lang_dec = "dec",
    lang_d_prepared_overall = "prepared camaigns",
    lang_d_sent_overall = "sent",
    lang_b_ver_info = "Your bulk checks will be available on your emailable.com account",
    lang_b_ver_in_prog = "verifying in progress",
    lang_verify = "Verify",
    lang_v_working = "working",
    lang_button_check_status = "Check status",
    lang_button_down_up = "Download & Update",
    lang_response = "response",
    lang = "en",
    lang_copy = "Copy",
    lang_bridge_fill_fields = "fill all required fields before testing...",
    lang_bridge_import_in_progress = "import in progress, please wait..."
;
    </script>
     <script src="js1/jquery-3.6.0.min.js"></script> 
    <script src="js1/bootstrap.min.js"></script>
    <script src="js1/nprogress_2.0.js"></script>
    <script src="js1/index.js"></script>
    <script src="js1/custom.js"></script>
    <script src="js1/chartjs/chart.min.js"></script>
    <script src="js1/easypie/jquery.easypiechart.min.js"></script>
    <script src="js1/icheck/icheck.min.js"></script>
    <script src="js1/nicescroll/jquery.nicescroll.min.js"></script>
    <script src="js1/progressbar/bootstrap-progressbar.min.js"></script>
    <script src="js1/select2/select2.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
         <div class="container body">
        <div class="main_container">
         <%--   <div class="col-md-3 left_col">
                <div class="left_col scroll-view">
                    <div class="navbar nav_title">
                        <a href="index.php" class="site_title"><i class="fa fa-envelope fa-spin"></i> <span>E-mailer</span></a>
                    </div>
                    <div class="clearfix"></div>

                    <!-- menu prile quick info -->
                    <div class="profile">
                        <div class="profile_pic">
                            <img src="production/images/img.jpg" alt="..." class="img-circle profile_img">
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
                                        <li><a href="index.php">Dashboard</a></li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-edit"></i> Email addresses <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li><a href="index.php?manage=recipient&action=list">Recipients list</a></li>
                                        <li><a href="index.php?manage=recipient&action=add">Add recipient</a></li>
                                        <li><a href="index.php?manage=recipient&action=check_verify_list">Bulk verifications</a></li>
                                        <li><a href="index.php?manage=import_bridge&action=list">Import emails by DB bridge</a></li>
                                        <li><a href="index.php?manage=recipient&action=import">Import emails from a CSV file</a></li>
                                        <li><a href="index.php?manage=recipient&action=export">Export emails to CSV file</a></li>
                                        <li><a href="index.php?manage=tags&action=list">Tags list</a></li>
                                        <li><a href="index.php?manage=tags&action=add">Add tags</a></li>
                                        <li><a href="index.php?manage=sender&action=list">Senders list</a></li>
                                        <li><a href="index.php?manage=sender&action=add">Add sender</a></li>
                                        <li><a href="index.php?manage=campaign&action=unsubscribed">Unsubscribers list</a></li>
                                        <li><a href="index.php?manage=recipient&action=bounce">Check bounced mails</a></li>
                                        <li><a href="index.php?manage=blacklist&action=list">Blacklist</a></li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-desktop"></i> Email layouts <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li><a href="index.php?manage=templates&action=list">Templates list</a></li>
                                        <li><a href="index.php?manage=templates&action=add">Add new template</a></li>
                                        <li><a href="index.php?manage=media&action=list">Attachments</a></li>
                                        <li><a href="index.php?manage=templates_thumb&action=list">Thumbnails</a></li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-table"></i> Your campaigns <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li><a href="index.php?manage=campaign&action=prepare">Prepare new campaign</a></li>
                                        <li><a href="index.php?manage=campaign&action=waiting">Waiting list campaign</a></li>
                                        <li><a href="index.php?manage=campaign&action=proceed">Campaigns in progress</a></li>
                                        <li><a href="index.php?manage=campaign&action=sent">List sent campaigns</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="menu_section">
                            <h3>System configuration</h3>
                            <ul class="nav side-menu">
                                <li><a><i class="fa fa-cogs"></i> Settings <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li><a href="index.php?manage=settings&action=credentials">Login</a></li>
                                        <li><a href="index.php?manage=settings&action=db">Database</a></li>
                                        <li><a href="index.php?manage=settings&action=system">System params</a></li>
                                        <li><a href="index.php?manage=smtp&action=list">SMTP configuration</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="menu_section">
                            <h3>Special addons</h3>
                            <ul class="nav side-menu">
                                <li><a><i class="fa fa-bug"></i> Usefull extras <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li><a href="index.php?manage=addons&action=subscribe_widget">Subscribe widget</a></li>
                                        <li><a href="index.php?manage=addons&action=clear_db">Clear database</a></li>
                                        <li><a href="index.php?manage=addons&action=import_templates">Import sample templates</a></li>
                                        <li><a href="index.php?manage=addons&action=import_sample_data">Import sample data</a></li>
                                        <li><a href="index.php?manage=addons&action=faq">Q&A</a></li>
                                        <li><a href="docs/index.html" target="_blank">Documentation</a></li>
                                        <li><a href="index.php?manage=addons&action=about">About</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- /sidebar menu -->

                    <!-- /menu footer buttons -->
                    <div class="sidebar-footer ">
                        <a href="index.php?manage=recipient&action=add" data-toggle="tooltip" data-placement="top" title="Add recipient"><span class="fa fa-edit" aria-hidden="true"></span></a>
                        <a href="index.php?manage=templates&action=add" data-toggle="tooltip" data-placement="top" title="Add new template"><span class="fa fa-desktop" aria-hidden="true"></span></a>
                        <a href="index.php?manage=campaign&action=prepare" data-toggle="tooltip" data-placement="top" title="Prepare new campaign"><span class="fa fa-table" aria-hidden="true"></span></a>
                        <a href="index.php?action=logout" data-toggle="tooltip" data-placement="top" title="Shut down"><span class="fa fa-power-off" aria-hidden="true"></span></a>
                    </div>
                    <!-- /menu footer buttons -->
                </div>
            </div>--%>

            <!-- top navigation -->
            <div class="top_nav">
                <div class="nav_menu">
                    <nav class="" role="navigation">
                        <div class="nav toggle">
                            <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                        </div>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="index.php?action=logout"><button class="btn btn-dark btn-xs">Shut down</button></a></li>
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- /top navigation -->

            <!-- page content -->
            <div class="right_col" role="main">
                                
                
<div class="modal fade" id="recipientsTagsManager" tabindex="-1" role="dialog" aria-labelledby="recipientsTagsManagerLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="recipientsTagsManagerLabel">Recipients tags manager, selected emails: <span data-table="0" id="qtyToTagsManage">0</span></h4>
            </div>
            <form id="part1" class="hidden" action="index.php?manage=recipient&data=modify&action=tags_manager" method="post">
                <input type="hidden" name="csrf_token" value="43550ef4660ca9bc016ea99b81be5e556949758b">
                <input type="hidden" id="globalSearch" name="globalSearch" value="">
                <input type="hidden" id="globalLogic" name="globalLogic" value="">
                <input type="hidden" id="globalTags" name="globalTags" value="">
                <input type="hidden" id="recipientsArr" name="recipientsArr" class="recipientsArr" value="">
                
                <div class="modal-body">
                    <div class="form-group">
                        <p>Choose your action:</p>
                    </div>
                    <div class="radio">
                        <label data-toggle="tooltip" data-placement="top" title="" data-original-title="dodaj tagi">
                            <div class="icheckbox_flat pull-left">
                                <input id="" class="flat qry" type="radio" name="tagsLogic" value="add" checked="checked">
                                <ins class="iCheck-helper" ></ins>
                            </div>&nbsp;<span>Add tags to selected recipients</span> 
                        </label>
                    </div>
                    <div class="radio">
                        <label data-toggle="tooltip" data-placement="top" title="" data-original-title="usuń tagi">
                            <div class="icheckbox_flat pull-left">
                                <input id="" class="flat qry" type="radio" name="tagsLogic" value="remove" >
                                <ins class="iCheck-helper" ></ins>
                            </div>&nbsp;<span>Remove tags from selected recipients</span> 
                        </label>
                    </div>
                    <div class="form-group">
                        <p>Select your tags:</p>
                                            </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-danger">Save changes</button>
                </div>
            </form>
            <form id="part2" class="hidden" action="index.php?manage=recipient&data=modify&action=tags_manager" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <p>Select recipients first</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="recipientDelete" tabindex="-1" role="dialog" aria-labelledby="recipientDeleteLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="recipientDeleteLabel">Deleting</h4>
            </div>
            <form action="index.php?manage=recipient&data=modify&action=delete" method="post">
                <input type="hidden" name="csrf_token" value="43550ef4660ca9bc016ea99b81be5e556949758b" />
                <input type="hidden" name="recipientid" class="recipientid" value="" />
                <div class="modal-body">
                    <div class="form-group">
                        <label for="recipientname" class="control-label">Are you sure you want to remove?</label>
                        <input type="text" class="form-control recipientname" disabled />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="recipientsDelete" tabindex="-1" role="dialog" aria-labelledby="recipientsDeleteLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="recipientsDeleteLabel">Deleting</h4>
            </div>
            <form action="index.php?manage=recipient&data=modify&action=delete_filtered" method="post">
                <input type="hidden" name="csrf_token" value="43550ef4660ca9bc016ea99b81be5e556949758b" />
                <input type="hidden" id="del_search" name="search" value="" />
                <input type="hidden" id="del_tags" name="tags" value="" />
                <input type="hidden" id="del_logic" name="logic" value="" />
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label">Are you sure you want to remove? <span id="qtyToDelete">0</span> Recipients?</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button id="delete_recipients" type="submit" class="btn btn-danger" >Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="recipientsVerify" tabindex="-1" role="dialog" aria-labelledby="recipientsVerifyLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="recipientsVerifyLabel">Bulk recipients verification</h4>
            </div>
            <form>
                <input type="hidden" name="csrf_token" value="43550ef4660ca9bc016ea99b81be5e556949758b" />
                <input type="hidden" id="ver_search" name="search" value="" />
                <input type="hidden" id="ver_tags" name="tags" value="" />
                <input type="hidden" id="ver_logic" name="logic" value="" />
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label">Are you sure you want to send <span id="qtyToVerify">0</span> recipients for verification?</label>
                    </div>
                    <p id="verifyInfo">waiting... </p>
                </div>
                <div class="modal-footer">
                    <a id="bulk_compare" class="pull-left btn btn-success" href="index.php?manage=recipient&action=check_verify_list">check bulk verification lists</a>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="button" id="verify_recipients" class="btn btn-info" >Verify</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="page-title">
    <div class="title_left">
        <h3>Email addresses <small>(Mailing list)</small></h3>
    </div>
</div>
<div class="clearfix"></div>

<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>Your emails data base <span id="recordsTotal">(0/0)</span></h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
            <form id="filterList" class="form-horizontal">
                <input type="hidden" id="mojetagi" name="mojetagi" value="">
                <input type="hidden" id="mojequery" name="mojequery" value="OR">
				<div class="form-group ">
            <a class="btn btn-primary" href="index.php?manage=recipient&action=add">Add recipient</a>
            <a class="btn btn-primary" id="bulkTagsManager" data-toggle='modal' data-target='#recipientsTagsManager'>Bulk tags manager</a>
            <a class="btn btn-info" data-toggle='modal' data-target='#recipientsVerify'>Bulk verification</a>
                    <span class="pull-right">&nbsp;&nbsp;<a class="btn btn-primary btn-xs resetquery">Reset query</a></span>
                    <span class=" hidden ">
    <div class="radio pull-right">
        <label data-toggle="tooltip" data-placement="top" title="" data-original-title="Filter recipients from selected tags (OR&nbsp;query)">
            <div class="icheckbox_flat pull-left" style="position: relative;">
                <input id="OR" class="flat qry" style="position: absolute; opacity: 0;" type="radio" name="queryLogic" value="OR" checked="checked">
                <ins class="iCheck-helper" ></ins>
            </div>&nbsp;<span>OR</span> 
        </label>
    </div>
    <div class="radio pull-right">
        <label data-toggle="tooltip" data-placement="top" title="" data-original-title="Filter recipients being in ALL selected tags (AND&nbsp;query)">
            <div class="icheckbox_flat pull-left" style="position: relative;">
                <input id="AND" class="flat qry" style="position: absolute; opacity: 0;" type="radio" name="queryLogic" value="AND">
                <ins class="iCheck-helper" ></ins>
            </div>&nbsp;<span>AND</span> 
        </label>
    </div>
    </span>
                </div>
				<div class="form-group ">
                    Select your tags:<select class="js-example-basic-single" multiple="multiple" name="newtags" id="newtags" style="width: 100%"></select></div>
            </form>
                <table class="table table-striped responsive-utilities jambo_table" id="recipients">
                    <thead>
                        <tr>
                            <th>
                                <label id="global" class="" for="markAll">
                                        <input id="markAll" type="checkbox" value="1" name="markAll" class="flat">
                                        <ins class="iCheck-helper" ></ins>
                                </label>
                            </th>
                            <th>Person</th>
                            <th>Adres e-mail</th>
                            <th>Tags</th>
                            <th>Description</th>
                            <th>f0</th>
                            <th>f1</th>
                            <th>f2</th>
                            <th>f3</th>
                            <th>emailable.com</th>
                            <th class="buttons"></th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <a href="" class="btn btn-danger" data-toggle='modal' data-target='#recipientsDelete'>Delete recipients</a>
        </div>
    </div>
</div>

<script src="components/recipient/view.recipient.list.js"></script>

                
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
