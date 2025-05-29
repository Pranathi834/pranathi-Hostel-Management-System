<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report Results - Hostel Management System</title>
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
            padding: 20px;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            box-shadow: 0 25px 45px rgba(0, 0, 0, 0.15);
            padding: 40px;
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

        .results-summary {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
            border: 1px solid rgba(102, 126, 234, 0.2);
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            gap: 15px;
            position: relative;
            z-index: 1;
        }

        .results-summary i {
            font-size: 1.5rem;
            color: #667eea;
        }

        .results-summary-text h4 {
            color: #2c3e50;
            font-size: 1.1rem;
            margin-bottom: 5px;
        }

        .results-summary-text p {
            color: #7f8c8d;
            font-size: 0.9rem;
        }

        .no-results {
            text-align: center;
            padding: 60px 20px;
            background: linear-gradient(135deg, rgba(255, 193, 7, 0.1), rgba(255, 152, 0, 0.1));
            border: 2px dashed rgba(255, 193, 7, 0.3);
            border-radius: 15px;
            margin-bottom: 30px;
        }

        .no-results i {
            font-size: 4rem;
            color: #ffc107;
            margin-bottom: 20px;
        }

        .no-results h3 {
            color: #2c3e50;
            font-size: 1.4rem;
            margin-bottom: 10px;
        }

        .no-results p {
            color: #7f8c8d;
            font-size: 1rem;
        }

        .table-container {
            position: relative;
            z-index: 1;
            overflow-x: auto;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 15px;
            overflow: hidden;
        }

        th {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 18px 15px;
            text-align: left;
            font-weight: 600;
            font-size: 0.95rem;
            letter-spacing: 0.5px;
            border: none;
        }

        th i {
            margin-right: 8px;
        }

        td {
            padding: 15px;
            border-bottom: 1px solid #e9ecef;
            color: #2c3e50;
            font-size: 0.9rem;
            border: none;
        }

        tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        tr:hover {
            background-color: rgba(102, 126, 234, 0.05);
            transform: scale(1.01);
            transition: all 0.2s ease;
        }

        .student-id {
            font-weight: 600;
            color: #667eea;
        }

        .student-name {
            font-weight: 500;
        }

        .room-number {
            background: linear-gradient(135deg, #4facfe, #00f2fe);
            color: white;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
            display: inline-block;
        }

        .fees-paid {
            color: #28a745;
            font-weight: 600;
        }

        .pending-fees {
            color: #dc3545;
            font-weight: 600;
        }

        .pending-fees.zero {
            color: #28a745;
        }

        .actions {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-top: 30px;
            position: relative;
            z-index: 1;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 12px 24px;
            border-radius: 12px;
            text-decoration: none;
            font-weight: 500;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
        }

        .btn-secondary {
            background: linear-gradient(135deg, #43e97b, #38f9d7);
            color: white;
        }

        .btn-export {
            background: linear-gradient(135deg, #fa709a, #fee140);
            color: white;
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }

        .export-options {
            display: flex;
            gap: 10px;
            justify-content: center;
            margin-bottom: 20px;
            position: relative;
            z-index: 1;
        }

        .stats-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
            position: relative;
            z-index: 1;
        }

        .stat-card {
            background: white;
            border-radius: 12px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            border: 1px solid rgba(0, 0, 0, 0.05);
        }

        .stat-card i {
            font-size: 2rem;
            margin-bottom: 10px;
        }

        .stat-card h4 {
            color: #2c3e50;
            font-size: 1.5rem;
            margin-bottom: 5px;
        }

        .stat-card p {
            color: #7f8c8d;
            font-size: 0.9rem;
        }

        .stat-card:nth-child(1) i { color: #667eea; }
        .stat-card:nth-child(2) i { color: #28a745; }
        .stat-card:nth-child(3) i { color: #dc3545; }

        /* Animation for table rows */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        tr {
            animation: fadeInUp 0.4s ease forwards;
        }

        /* Stagger animation for rows */
   
    </style>
    <script>
        function exportToCSV() {
            const table = document.querySelector('table');
            if (!table) return;
            
            let csv = [];
            const rows = table.querySelectorAll('tr');
            
            for (let i = 0; i < rows.length; i++) {
                const row = [], cols = rows[i].querySelectorAll('td, th');
                for (let j = 0; j < cols.length; j++) {
                    row.push('"' + cols[j].innerText.replace(/"/g, '""') + '"');
                }
                csv.push(row.join(','));
            }
            
            const csvFile = new Blob([csv.join('\n')], { type: 'text/csv' });
            const downloadLink = document.createElement('a');
            downloadLink.download = 'hostel_report_' + new Date().toISOString().split('T')[0] + '.csv';
            downloadLink.href = window.URL.createObjectURL(csvFile);
            downloadLink.style.display = 'none';
            document.body.appendChild(downloadLink);
            downloadLink.click();
            document.body.removeChild(downloadLink);
        }

        function printReport() {
            window.print();
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2><i class="fas fa-chart-bar"></i> Report Results</h2>
            <p>Generated report based on your selected criteria</p>
        </div>

        <%
        List<Student> studentList = (List<Student>) request.getAttribute("reportList");
        if (studentList == null || studentList.isEmpty()) {
        %>
        <div class="no-results">
            <i class="fas fa-search"></i>
            <h3>No Records Found</h3>
            <p>No students match the selected criteria. Please try different parameters.</p>
        </div>
        <%
        } else {
            // Calculate statistics
            int totalStudents = studentList.size();
            int studentsWithPendingFees = 0;
            double totalPendingAmount = 0;
            
            for (Student s : studentList) {
                if (s.getPendingFees() > 0) {
                    studentsWithPendingFees++;
                    totalPendingAmount += s.getPendingFees();
                }
            }
        %>
        
        <div class="results-summary">
            <i class="fas fa-info-circle"></i>
            <div class="results-summary-text">
                <h4>Report Summary</h4>
                <p>Found <%= totalStudents %> student(s) matching your criteria</p>
            </div>
        </div>

        <div class="stats-cards">
            <div class="stat-card">
                <i class="fas fa-users"></i>
                <h4><%= totalStudents %></h4>
                <p>Total Students</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-check-circle"></i>
                <h4><%= totalStudents - studentsWithPendingFees %></h4>
                <p>Fees Cleared</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-exclamation-circle"></i>
                <h4><%= studentsWithPendingFees %></h4>
                <p>Pending Fees</p>
            </div>
        </div>

        <div class="export-options">
            <button onclick="exportToCSV()" class="btn btn-export">
                <i class="fas fa-download"></i> Export CSV
            </button>
            <button onclick="printReport()" class="btn btn-secondary">
                <i class="fas fa-print"></i> Print Report
            </button>
        </div>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th><i class="fas fa-id-badge"></i>Student ID</th>
                        <th><i class="fas fa-user"></i>Name</th>
                        <th><i class="fas fa-door-open"></i>Room Number</th>
                        <th><i class="fas fa-calendar"></i>Admission Date</th>
                        <th><i class="fas fa-money-check-alt"></i>Fees Paid</th>
                        <th><i class="fas fa-exclamation-triangle"></i>Pending Fees</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    for (Student s : studentList) {
                    %>
                    <tr>
                        <td class="student-id"><%= s.getStudentID() %></td>
                        <td class="student-name"><%= s.getStudentName() %></td>
                        <td><span class="room-number"><%= s.getRoomNumber() %></span></td>
                        <td><%= s.getAdmissionDate() %></td>
                        <td class="fees-paid">₹<%= String.format("%.2f", s.getFeesPaid()) %></td>
                        <td class="<%= s.getPendingFees() == 0 ? "pending-fees zero" : "pending-fees" %>">
                            <%= s.getPendingFees() == 0 ? "Cleared" : "₹" + String.format("%.2f", s.getPendingFees()) %>
                        </td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
        <%
        }
        %>

        <div class="actions">
            <a href="report_form.jsp" class="btn btn-primary">
                <i class="fas fa-arrow-left"></i> Back to Report Form
            </a>
            <a href="index.jsp" class="btn btn-secondary">
                <i class="fas fa-home"></i> Back to Dashboard
            </a>
        </div>
    </div>
</body>
</html>