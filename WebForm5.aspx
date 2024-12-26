<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="Newsletter.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Email Dashboard</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
            margin: 0;
        }
        /* Sidebar Styling */
        .sidebar {
            height: 100vh;
            background-color: #343a40;
            color: white;
            padding-top: 20px;
        }
        .sidebar h4 {
            font-size: 1.2rem;
            margin-bottom: 20px;
            text-align: center;
            font-weight: bold;
        }
        .sidebar p {
            text-align: center;
            margin-bottom: 30px;
        }
        .sidebar a {
            color: #ddd;
            display: block;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 5px;
        }
        .sidebar a.active, .sidebar a:hover {
            background-color: #495057;
            color: #fff;
        }
        .menu-title {
            font-size: 0.9rem;
            text-transform: uppercase;
            margin: 20px 0 10px;
            color: #aaa;
            padding-left: 20px;
        }

        /* Card Styling */
        .stat-card {
            background-color: white;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .stat-card h3 {
            margin: 10px 0;
        }

        /* Chart Section */
        .chart-container {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <div class="col-md-2 sidebar">
                    <h4>E-mailer</h4>
                    <p>Welcome,<br>What we do?</p>
                    <a href="#" class="active"><i class="fas fa-home mr-2"></i> Start</a>
                    <a href="#"><i class="fas fa-tachometer-alt mr-2"></i> Dashboard</a>
                    <a href="#"><i class="fas fa-envelope mr-2"></i> Email Addresses</a>
                    <a href="#"><i class="fas fa-layer-group mr-2"></i> Email Layouts</a>
                    <a href="#"><i class="fas fa-bullhorn mr-2"></i> Your Campaigns</a>
                    <div class="menu-title">System Configuration</div>
                    <a href="#"><i class="fas fa-cog mr-2"></i> Settings</a>
                </div>

                <!-- Main Content -->
                <div class="col-md-10 p-4">
                    <!-- Cards Row -->
                    <div class="row mb-4">
                        <div class="col-md-3">
                            <div class="stat-card">
                                <h5>Email Data Base</h5>
                                <h3>6</h3>
                                <button class="btn btn-success btn-sm">Add new email</button>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stat-card">
                                <h5>Email Templates</h5>
                                <h3>8</h3>
                                <button class="btn btn-success btn-sm">Add new template</button>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stat-card">
                                <h5>Sent Emails</h5>
                                <h3>0</h3>
                                <small>0.00% Efficiency</small>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stat-card">
                                <h5>Campaigns</h5>
                                <h3>3</h3>
                                <button class="btn btn-success btn-sm">New campaign</button>
                            </div>
                        </div>
                    </div>

                    <!-- Chart Section -->
                    <div class="chart-container">
                        <h4>Statistics 2024 - Your advertising campaigns</h4>
                        <canvas id="campaignChart" width="400" height="150"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <!-- Chart Script -->
        <script>
            var ctx = document.getElementById('campaignChart').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                    datasets: [{
                        label: 'Prepared Campaigns',
                        data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3],
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 2,
                        fill: true,
                        backgroundColor: 'rgba(75, 192, 192, 0.2)'
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
    </form>
</body>
</html>