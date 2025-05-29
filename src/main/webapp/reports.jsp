<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reports - Hostel Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            box-shadow: 0 25px 45px rgba(0, 0, 0, 0.15);
            padding: 50px 40px;
            width: 100%;
            max-width: 800px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            position: relative;
            overflow: hidden;
        }

        .container::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle, rgba(102, 126, 234, 0.1) 0%, transparent 70%);
            pointer-events: none;
        }

        .container::after {
            content: '';
            position: absolute;
            bottom: -50%;
            left: -50%;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle, rgba(118, 75, 162, 0.1) 0%, transparent 70%);
            pointer-events: none;
        }

        .header {
            text-align: center;
            margin-bottom: 40px;
            position: relative;
            z-index: 1;
        }

        .header h2 {
            color: #2c3e50;
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 15px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .header p {
            color: #7f8c8d;
            font-size: 1.1rem;
            line-height: 1.6;
            max-width: 600px;
            margin: 0 auto;
        }

        .reports-section {
            position: relative;
            z-index: 1;
            margin-bottom: 40px;
        }

        .section-title {
            color: #2c3e50;
            font-size: 1.4rem;
            font-weight: 600;
            margin-bottom: 25px;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .section-title i {
            color: #667eea;
            font-size: 1.2rem;
        }

        .reports-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            margin-bottom: 30px;
        }

        .report-card {
            background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
            border-radius: 15px;
            padding: 30px 25px;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            border: 1px solid rgba(0, 0, 0, 0.08);
            position: relative;
            overflow: hidden;
            cursor: pointer;
            text-decoration: none;
            color: inherit;
            display: block;
        }

        .report-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent);
            transition: left 0.6s;
        }

        .report-card:hover::before {
            left: 100%;
        }

        .report-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
            border-color: rgba(102, 126, 234, 0.3);
        }

        .report-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background: linear-gradient(135deg, #667eea, #764ba2);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
            font-size: 1.8rem;
            color: white;
            position: relative;
            z-index: 1;
        }

        .report-content h3 {
            color: #2c3e50;
            font-size: 1.4rem;
            font-weight: 600;
            margin-bottom: 12px;
            position: relative;
            z-index: 1;
        }

        .report-content p {
            color: #7f8c8d;
            font-size: 0.95rem;
            line-height: 1.6;
            margin-bottom: 20px;
            position: relative;
            z-index: 1;
        }

        .report-features {
            list-style: none;
            margin-bottom: 20px;
            position: relative;
            z-index: 1;
        }

        .report-features li {
            color: #7f8c8d;
            font-size: 0.85rem;
            margin-bottom: 6px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .report-features li i {
            color: #28a745;
            font-size: 0.7rem;
        }

        .btn {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 8px;
            font-weight: 500;
            font-size: 0.9rem;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            position: relative;
            z-index: 1;
            text-decoration: none;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.4);
        }

        .info-section {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
            border: 1px solid rgba(102, 126, 234, 0.2);
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 30px;
            position: relative;
            z-index: 1;
        }

        .info-section h4 {
            color: #2c3e50;
            font-size: 1.2rem;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .info-section h4 i {
            color: #667eea;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
        }

        .info-item {
            display: flex;
            align-items: center;
            gap: 12px;
            color: #7f8c8d;
            font-size: 0.9rem;
        }

        .info-item i {
            color: #667eea;
            font-size: 1rem;
        }

        .navigation {
            display: flex;
            justify-content: center;
            gap: 20px;
            position: relative;
            z-index: 1;
        }

        .nav-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 14px 28px;
            border-radius: 12px;
            text-decoration: none;
            font-weight: 500;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .nav-btn.primary {
            background: linear-gradient(135deg, #43e97b, #38f9d7);
            color: white;
        }

        .nav-btn.secondary {
            background: rgba(102, 126, 234, 0.1);
            color: #667eea;
            border: 1px solid rgba(102, 126, 234, 0.3);
        }

        .nav-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }

        /* Animation */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .report-card, .info-section {
            animation: fadeInUp 0.6s ease forwards;
        }

        .report-card { animation-delay: 0.2s; }
        .info-section { animation-delay: 0.4s; }
        .navigation { animation-delay: 0.6s; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2><i class="fas fa-chart-line"></i> Hostel Management Reports</h2>
            <p>Generate comprehensive reports to analyze your hostel operations, track student information, and monitor financial data with powerful filtering options.</p>
        </div>

        <div class="info-section">
            <h4><i class="fas fa-info-circle"></i> Report Capabilities</h4>
            <div class="info-grid">
                <div class="info-item">
                    <i class="fas fa-users"></i>
                    <span>Student Management</span>
                </div>
                <div class="info-item">
                    <i class="fas fa-money-bill-wave"></i>
                    <span>Fee Tracking</span>
                </div>
                <div class="info-item">
                    <i class="fas fa-door-open"></i>
                    <span>Room Allocation</span>
                </div>
                <div class="info-item">
                    <i class="fas fa-calendar-alt"></i>
                    <span>Date Range Analysis</span>
                </div>
                <div class="info-item">
                    <i class="fas fa-file-export"></i>
                    <span>Export Options</span>
                </div>
                <div class="info-item">
                    <i class="fas fa-print"></i>
                    <span>Print Ready</span>
                </div>
            </div>
        </div>

        <div class="reports-section">
            <h3 class="section-title">
                <i class="fas fa-clipboard-list"></i>
                Available Reports
            </h3>
            
            <div class="reports-grid">
                <a href="report_form.jsp" class="report-card">
                    <div class="report-icon">
                        <i class="fas fa-chart-bar"></i>
                    </div>
                    <div class="report-content">
                        <h3>Generate Custom Reports</h3>
                        <p>Create detailed reports with flexible filtering options to analyze your hostel data.</p>
                        
                        <ul class="report-features">
                            <li><i class="fas fa-check-circle"></i> Students with pending fees</li>
                            <li><i class="fas fa-check-circle"></i> Room-wise student allocation</li>
                            <li><i class="fas fa-check-circle"></i> Date range admission reports</li>
                            <li><i class="fas fa-check-circle"></i> Export to CSV format</li>
                            <li><i class="fas fa-check-circle"></i> Print-friendly layouts</li>
                        </ul>
                        
                        <div class="btn">
                            Start Generating <i class="fas fa-arrow-right"></i>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <div class="navigation">
            <a href="report_form.jsp" class="nav-btn primary">
                <i class="fas fa-plus-circle"></i>
                Generate New Report
            </a>
            <a href="index.jsp" class="nav-btn secondary">
                <i class="fas fa-home"></i>
                Back to Dashboard
            </a>
        </div>
    </div>
</body>
</html>