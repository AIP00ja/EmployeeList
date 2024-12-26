<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recipients list.aspx.cs" Inherits="Newsletter.Recipients_list" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>E-mailer</title>

    <meta charset="utf-8" />
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <meta http-equiv="Expires" content="0" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="cache-control" content="no-store" />
    <meta http-equiv="cache-control" content="must-revalidate" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="robots" content="noindex,nofollow" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <%-- <link rel="shortcut icon" type="image/x-icon" href="production/images/favicon.ico" />--%>
    <!--start:: external link for icon Font awsome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
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
                oPaginate: {
                    sFirst: "|<",
                    sLast: ">|",
                    sNext: ">>",
                    sPrevious: "<<"
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
<body class="nav-md">
    <form id="form1" runat="server">
        <div class="container body">

            <!-- page content -->
            <div class="right_col" role="main">
                <div class="page-title">
                    <div class="title_left">
                        <h3>Email Addresses <small>(Add New)</small></h3>
                    </div>
                </div>
                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-12">
                        <!-- Full-width card -->
                        <div class="x_panel" style="width: 100%; margin: 0 auto;">
                            <div class="x_title">
                                <h2>Adding New Email Address</h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <!-- Form Start -->
                                <form>
                                    <!-- Common Row Style -->
                                    <div class="row form-group align-items-center">
                                        <!-- Labels on the left -->
                                        <div class="col-md-3">
                                            <label for="recipientname" class="control-label">Employee Name</label>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="recipientname" runat="server" name="recipientname" placeholder="Enter full name" class="form-control" Style="width: 80%;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <!-- Email -->
                                    <div class="row form-group align-items-center">
                                        <div class="col-md-3">
                                            <label for="recipientmail" class="control-label">Email*</label>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="recipientmail" runat="server" type="email" name="recipientmail" placeholder="Enter email" class="form-control" Style="width: 80%;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <!-- Only TXT Emails -->
                                   <%-- <div class="row form-group align-items-center">
                                        <div class="col-md-3">
                                            <label for="CheckBox1" class="control-label">Only TXT Emails</label>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:CheckBox ID="CheckBox1" runat="server" class="flat" Style="background: rgb(255, 255, 255)" />
                                        </div>
                                    </div>--%>
                                    <!-- Description -->
                                    <div class="row form-group align-items-center">
                                        <div class="col-md-3">
                                            <label for="recipientcomment" class="control-label">Description</label>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="recipientcomment" runat="server" name="recipientcomment" placeholder="Enter description" class="form-control" Style="width: 80%;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <!-- Additional Fields -->
                                    <div class="row form-group align-items-center">
                                        <div class="col-md-3">
                                            <label for="recipientwebsite" class="control-label">Country Name</label>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="recipientwebsite" runat="server" name="recipientwebsite" placeholder="Enter field 0" class="form-control" Style="width: 80%;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row form-group align-items-center">
                                        <div class="col-md-3">
                                            <label for="recipientf01" class="control-label">States name</label>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="recipientf01" runat="server" name="recipientf01" placeholder="Enter field 1" class="form-control" Style="width: 80%;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row form-group align-items-center">
                                        <div class="col-md-3">
                                            <label for="recipientf02" class="control-label">Department</label>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="recipientf02" runat="server" name="recipientf02" placeholder="Enter field 2" class="form-control" Style="width: 80%;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row form-group align-items-center">
                                        <div class="col-md-3">
                                            <label for="recipientf03" class="control-label">designation</label>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="recipientf03" runat="server" name="recipientf03" placeholder="Enter field 3" class="form-control" Style="width: 80%;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <!-- Tags -->
                                    <div class="row form-group align-items-center">
                                        <div class="col-md-3">
                                            <label for="tagsname" class="control-label">Tags</label>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="tagsname" runat="server" name="tagsname" placeholder="Enter tags" class="form-control" Style="width: 80%;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <!-- Buttons -->
                                    <div class="row form-group text-center">
                                        <div class="col-md-12">
                                            <button type="button" class="btn btn-success me-3">
                                                <!-- Adding margin-right -->
                                                <i class="fa fa-times"></i>Cancel
                                            </button>
                                            <button type="submit" class="btn btn-primary ms-3">
                                                <!-- Adding margin-left -->
                                                <i class="fa fa-save"></i>Save
                                            </button>
                                        </div>
                                    </div>


                                </form>
                                <!-- Form End -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <!-- /page content -->
            <%-- </div>--%>
        </div>

        <%-- <div id="custom_notifications" class="custom-notifications dsp_none">
        <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group"></ul>
        <div class="clearfix"></div>
        <div id="notif-group" class="tabbed_notifications"></div>
    </div>--%>
        <!-- /footer content -->
    </form>
</body>

</html>
