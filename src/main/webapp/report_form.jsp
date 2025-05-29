<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Reports - Hostel Management System</title>
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
            padding: 40px;
            width: 100%;
            max-width: 600px;
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

        .header {
            text-align: center;
            margin-bottom: 35px;
            position: relative;
            z-index: 1;
        }

        .header h2 {
            color: #2c3e50;
            font-size: 2.2rem;
            font-weight: 700;
            margin-bottom: 8px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .header p {
            color: #7f8c8d;
            font-size: 1rem;
        }

        .form-container {
            position: relative;
            z-index: 1;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            color: #2c3e50;
            font-weight: 600;
            margin-bottom: 8px;
            font-size: 0.95rem;
        }

        .form-group label i {
            margin-right: 8px;
            color: #667eea;
        }

        select, input[type="text"], input[type="date"] {
            width: 100%;
            padding: 15px 18px;
            border: 2px solid #e9ecef;
            border-radius: 12px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: white;
            color: #2c3e50;
            font-family: inherit;
        }

        select:focus, input[type="text"]:focus, input[type="date"]:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
            transform: translateY(-2px);
        }

        select {
            cursor: pointer;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%236b7280' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='M6 8l4 4 4-4'/%3e%3c/svg%3e");
            background-position: right 12px center;
            background-repeat: no-repeat;
            background-size: 16px;
            padding-right: 40px;
            appearance: none;
        }

        .conditional-field {
            opacity: 0;
            max-height: 0;
            overflow: hidden;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            transform: translateY(-10px);
        }

        .conditional-field.show {
            opacity: 1;
            max-height: 200px;
            transform: translateY(0);
        }

        .date-range-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            margin-top: 15px;
        }

        .submit-btn {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border: none;
            padding: 16px 32px;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
            margin-top: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .submit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 25px rgba(102, 126, 234, 0.4);
        }

        .submit-btn:active {
            transform: translateY(-1px);
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
            margin-top: 25px;
            padding: 12px 20px;
            border-radius: 10px;
            background: rgba(102, 126, 234, 0.1);
            transition: all 0.3s ease;
        }

        .back-link:hover {
            background: rgba(102, 126, 234, 0.2);
            transform: translateX(-5px);
        }

        .report-type-info {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
            border: 1px solid rgba(102, 126, 234, 0.2);
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 25px;
        }

        .report-type-info h4 {
            color: #2c3e50;
            font-size: 1.1rem;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .report-type-info ul {
            color: #7f8c8d;
            font-size: 0.9rem;
            line-height: 1.6;
            list-style: none;
            padding-left: 0;
        }

        .report-type-info li {
            margin-bottom: 5px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .report-type-info li i {
            color: #667eea;
            font-size: 0.8rem;
        }

        /* Animation for form elements */
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

        .form-group {
            animation: fadeInUp 0.6s ease forwards;
        }

        .form-group:nth-child(1) { animation-delay: 0.1s; }
        .form-group:nth-child(2) { animation-delay: 0.2s; }
        .form-group:nth-child(3) { animation-delay: 0.3s; }
        .form-group:nth-child(4) { animation-delay: 0.4s; }

        /* Loading state for submit button */
        .submit-btn.loading {
            pointer-events: none;
            opacity: 0.8;
        }

        .submit-btn.loading::after {
            content: '';
            width: 20px;
            height: 20px;
            border: 2px solid transparent;
            border-top: 2px solid white;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin-left: 10px;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
    <script>
        function toggleFields() {
            var reportType = document.getElementById("reportType").value;
            var roomDiv = document.getElementById("roomNumberDiv");
            var dateDiv = document.getElementById("dateRangeDiv");
            
            // Hide all conditional fields first
            roomDiv.classList.remove("show");
            dateDiv.classList.remove("show");
            
            // Show relevant field based on selection
            setTimeout(() => {
                if (reportType === "roomWise") {
                    roomDiv.classList.add("show");
                } else if (reportType === "dateRange") {
                    dateDiv.classList.add("show");
                }
            }, 100);
        }

        function handleSubmit(event) {
            var submitBtn = document.querySelector('.submit-btn');
            submitBtn.classList.add('loading');
            submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Generating Report...';
        }

        // Initialize on page load
        window.onload = function() {
            toggleFields();
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2><i class="fas fa-chart-line"></i> Generate Report</h2>
            <p>Create comprehensive reports for your hostel management</p>
        </div>

        <div class="report-type-info">
            <h4><i class="fas fa-info-circle"></i> Available Report Types</h4>
            <ul>
                <li><i class="fas fa-circle"></i> Students with pending fee payments</li>
                <li><i class="fas fa-circle"></i> Room-wise student allocation</li>
                <li><i class="fas fa-circle"></i> Date range admission reports</li>
            </ul>
        </div>

        <form action="report" method="post" onsubmit="handleSubmit(event)" class="form-container">
            <div class="form-group">
                <label for="reportType">
                    <i class="fas fa-clipboard-list"></i>Select Report Type:
                </label>
                <select id="reportType" name="reportType" onchange="toggleFields()" required>
                    <option value="">-- Choose Report Type --</option>
                    <option value="pendingFees">Students with Pending Fees</option>
                    <option value="roomWise">Students in a Particular Room</option>
                    <option value="dateRange">Students Admitted in a Date Range</option>
                </select>
            </div>

            <div id="roomNumberDiv" class="conditional-field">
                <div class="form-group">
                    <label for="roomNumber">
                        <i class="fas fa-door-open"></i>Room Number:
                    </label>
                    <input type="text" id="roomNumber" name="roomNumber" placeholder="Enter room number (e.g., 101, A-204)">
                </div>
            </div>

            <div id="dateRangeDiv" class="conditional-field">
                <div class="form-group">
                    <label>
                        <i class="fas fa-calendar-alt"></i>Admission Date Range:
                    </label>
                    <div class="date-range-container">
                        <div>
                            <label for="startDate" style="font-size: 0.85rem; color: #7f8c8d; margin-bottom: 5px;">Start Date:</label>
                            <input type="date" id="startDate" name="startDate">
                        </div>
                        <div>
                            <label for="endDate" style="font-size: 0.85rem; color: #7f8c8d; margin-bottom: 5px;">End Date:</label>
                            <input type="date" id="endDate" name="endDate">
                        </div>
                    </div>
                </div>
            </div>

            <button type="submit" class="submit-btn">
                <i class="fas fa-file-download"></i>
                Generate Report
            </button>
        </form>

        <a href="index.jsp" class="back-link">
            <i class="fas fa-arrow-left"></i>
            Back to Dashboard
        </a>
    </div>
</body>
</html>