<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Details - Hostel Management System</title>
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
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            box-shadow: 0 25px 45px rgba(0, 0, 0, 0.15);
            padding: 40px;
            max-width: 1200px;
            margin: 0 auto;
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

        .header h1 {
            color: #2c3e50;
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 10px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .header p {
            color: #7f8c8d;
            font-size: 1.1rem;
            font-weight: 400;
        }

        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 40px;
            position: relative;
            z-index: 1;
        }

        .stat-card {
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.9), rgba(248, 249, 250, 0.9));
            border-radius: 15px;
            padding: 25px;
            text-align: center;
            border: 1px solid rgba(102, 126, 234, 0.1);
            transition: all 0.3s ease;
            animation: fadeInUp 0.6s ease forwards;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }

        .stat-card:nth-child(1) { animation-delay: 0.1s; }
        .stat-card:nth-child(2) { animation-delay: 0.2s; }
        .stat-card:nth-child(3) { animation-delay: 0.3s; }

        .stat-icon {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 15px;
            font-size: 1.3rem;
            color: white;
        }

        .stat-card:nth-child(1) .stat-icon {
            background: linear-gradient(135deg, #4facfe, #00f2fe);
        }

        .stat-card:nth-child(2) .stat-icon {
            background: linear-gradient(135deg, #43e97b, #38f9d7);
        }

        .stat-card:nth-child(3) .stat-icon {
            background: linear-gradient(135deg, #fa709a, #fee140);
        }

        .stat-number {
            font-size: 2rem;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 5px;
        }

        .stat-label {
            color: #7f8c8d;
            font-size: 0.9rem;
            font-weight: 500;
        }

        .table-container {
            position: relative;
            z-index: 1;
            overflow-x: auto;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            animation: fadeInUp 0.6s ease forwards;
            animation-delay: 0.4s;
        }

        .student-table {
            width: 100%;
            border-collapse: collapse;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
        }

        .student-table th {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 18px 15px;
            text-align: left;
            font-weight: 600;
            font-size: 0.95rem;
            letter-spacing: 0.5px;
            border: none;
            position: sticky;
            top: 0;
            z-index: 10;
        }

        .student-table th:first-child {
            border-top-left-radius: 15px;
        }

        .student-table th:last-child {
            border-top-right-radius: 15px;
        }

        .student-table td {
            padding: 15px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            color: #2c3e50;
            font-weight: 500;
            transition: background-color 0.3s ease;
        }

        .student-table tr:hover td {
            background-color: rgba(102, 126, 234, 0.05);
        }

        .student-table tr:last-child td:first-child {
            border-bottom-left-radius: 15px;
        }

        .student-table tr:last-child td:last-child {
            border-bottom-right-radius: 15px;
        }

        .student-table tr:last-child td {
            border-bottom: none;
        }

        .student-id {
            font-weight: 700;
            color: #667eea;
        }

        .student-name {
            font-weight: 600;
            color: #2c3e50;
        }

        .room-number {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
            padding: 6px 12px;
            border-radius: 20px;
            font-weight: 600;
            color: #667eea;
            display: inline-block;
            min-width: 60px;
            text-align: center;
        }

        .fees-paid {
            color: #28a745;
            font-weight: 600;
        }

        .fees-pending {
            color: #dc3545;
            font-weight: 600;
        }

        .fees-pending.zero {
            color: #28a745;
        }

        .no-data {
            text-align: center;
            padding: 60px 20px;
            position: relative;
            z-index: 1;
            animation: fadeInUp 0.6s ease forwards;
        }

        .no-data-icon {
            font-size: 4rem;
            color: #cbd5e0;
            margin-bottom: 20px;
        }

        .no-data h3 {
            color: #2c3e50;
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .no-data p {
            color: #7f8c8d;
            font-size: 1rem;
            margin-bottom: 30px;
        }

        .btn-container {
            text-align: center;
            margin-top: 40px;
            position: relative;
            z-index: 1;
            animation: fadeInUp 0.6s ease forwards;
            animation-delay: 0.5s;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 15px 30px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            text-decoration: none;
            border-radius: 12px;
            font-weight: 600;
            font-size: 1rem;
            transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
            position: relative;
            overflow: hidden;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.6s;
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 30px rgba(102, 126, 234, 0.4);
        }

        .search-filter {
            position: relative;
            z-index: 1;
            margin-bottom: 30px;
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
            align-items: center;
            animation: fadeInUp 0.6s ease forwards;
            animation-delay: 0.3s;
        }

        .search-input {
            flex: 1;
            min-width: 250px;
            padding: 12px 20px 12px 45px;
            border: 2px solid rgba(102, 126, 234, 0.2);
            border-radius: 25px;
            font-size: 1rem;
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(10px);
            transition: all 0.3s ease;
            position: relative;
        }

        .search-container {
            position: relative;
            flex: 1;
            min-width: 250px;
        }

        .search-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #667eea;
            font-size: 1.1rem;
        }

        .search-input:focus {
            outline: none;
            border-color: #667eea;
            background: rgba(255, 255, 255, 0.95);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.1);
        }

        .filter-select {
            padding: 12px 15px;
            border: 2px solid rgba(102, 126, 234, 0.2);
            border-radius: 10px;
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(10px);
            font-size: 1rem;
            color: #2c3e50;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .filter-select:focus {
            outline: none;
            border-color: #667eea;
            background: rgba(255, 255, 255, 0.95);
        }

        /* Animations */
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

        /* Responsive design */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
                margin: 10px;
            }

            .header h1 {
                font-size: 2rem;
            }

            .table-container {
                border-radius: 10px;
            }

            .student-table th,
            .student-table td {
                padding: 10px 8px;
                font-size: 0.9rem;
            }

            .search-filter {
                flex-direction: column;
                align-items: stretch;
            }

            .search-container {
                min-width: auto;
            }

            .stats-container {
                grid-template-columns: 1fr;
            }
        }

        /* Loading animation */
        .loading {
            display: inline-block;
            width: 20px;
            height: 20px;
            border: 3px solid rgba(102, 126, 234, 0.3);
            border-radius: 50%;
            border-top-color: #667eea;
            animation: spin 1s ease-in-out infinite;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1><i class="fas fa-users"></i> Current Students</h1>
            <p>Comprehensive view of all registered hostel students</p>
        </div>

        <%
        List<Student> studentList = (List<Student>) request.getAttribute("studentList");
        if (studentList == null || studentList.isEmpty()) {
        %>
            <div class="no-data">
                <div class="no-data-icon">
                    <i class="fas fa-user-slash"></i>
                </div>
                <h3>No Student Records Found</h3>
                <p>There are currently no students registered in the hostel management system.</p>
                <a href="studentadd.jsp" class="btn">
                    <i class="fas fa-user-plus"></i>Add First Student
                </a>
            </div>
        <%
        } else {
            // Calculate statistics
            int totalStudents = studentList.size();
            double totalFeesPaid = 0;
            double totalPendingFees = 0;
            
            for (Student s : studentList) {
                totalFeesPaid += s.getFeesPaid();
                totalPendingFees += s.getPendingFees();
            }
        %>
            <!-- Statistics Cards -->
            <div class="stats-container">
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <div class="stat-number" id="totalStudents"><%= totalStudents %></div>
                    <div class="stat-label">Total Students</div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-dollar-sign"></i>
                    </div>
                    <div class="stat-number">$<%= String.format("%.2f", totalFeesPaid) %></div>
                    <div class="stat-label">Total Fees Collected</div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-exclamation-triangle"></i>
                    </div>
                    <div class="stat-number">$<%= String.format("%.2f", totalPendingFees) %></div>
                    <div class="stat-label">Pending Fees</div>
                </div>
            </div>

            <!-- Search and Filter -->
            <div class="search-filter">
                <div class="search-container">
                    <i class="fas fa-search search-icon"></i>
                    <input type="text" class="search-input" id="searchInput" placeholder="Search by name, ID, or room number...">
                </div>
                <select class="filter-select" id="sortFilter">
                    <option value="">Sort by...</option>
                    <option value="id">Student ID</option>
                    <option value="name">Name</option>
                    <option value="room">Room Number</option>
                    <option value="date">Admission Date</option>
                    <option value="pending">Pending Fees</option>
                </select>
            </div>

            <!-- Students Table -->
            <div class="table-container">
                <table class="student-table" id="studentsTable">
                    <thead>
                        <tr>
                            <th><i class="fas fa-id-card"></i> Student ID</th>
                            <th><i class="fas fa-user"></i> Name</th>
                            <th><i class="fas fa-door-open"></i> Room Number</th>
                            <th><i class="fas fa-calendar-alt"></i> Admission Date</th>
                            <th><i class="fas fa-check-circle"></i> Fees Paid</th>
                            <th><i class="fas fa-exclamation-triangle"></i> Pending Fees</th>
                        </tr>
                    </thead>
                    <tbody id="studentsTableBody">
                        <%
                        for (Student s : studentList) {
                        %>
                        <tr class="student-row">
                            <td class="student-id"><%= s.getStudentID() %></td>
                            <td class="student-name"><%= s.getStudentName() %></td>
                            <td><span class="room-number"><%= s.getRoomNumber() %></span></td>
                            <td><%= s.getAdmissionDate() %></td>
                            <td class="fees-paid">$<%= String.format("%.2f", s.getFeesPaid()) %></td>
                            <td class="<%= s.getPendingFees() == 0 ? "fees-pending zero" : "fees-pending" %>">
                                $<%= String.format("%.2f", s.getPendingFees()) %>
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

        <div class="btn-container">
            <a href="index.jsp" class="btn">
                <i class="fas fa-home"></i>Back to Home
            </a>
        </div>
    </div>

    <script>
        // Search functionality
        document.getElementById('searchInput').addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            const rows = document.querySelectorAll('.student-row');
            
            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                if (text.includes(searchTerm)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
            
            updateVisibleCount();
        });

        // Sort functionality
        document.getElementById('sortFilter').addEventListener('change', function() {
            const sortBy = this.value;
            if (!sortBy) return;
            
            const tbody = document.getElementById('studentsTableBody');
            const rows = Array.from(tbody.querySelectorAll('.student-row'));
            
            rows.sort((a, b) => {
                let aVal, bVal;
                
                switch(sortBy) {
                    case 'id':
                        aVal = parseInt(a.cells[0].textContent);
                        bVal = parseInt(b.cells[0].textContent);
                        return aVal - bVal;
                    case 'name':
                        aVal = a.cells[1].textContent.toLowerCase();
                        bVal = b.cells[1].textContent.toLowerCase();
                        return aVal.localeCompare(bVal);
                    case 'room':
                        aVal = a.cells[2].textContent;
                        bVal = b.cells[2].textContent;
                        return aVal.localeCompare(bVal);
                    case 'date':
                        aVal = new Date(a.cells[3].textContent);
                        bVal = new Date(b.cells[3].textContent);
                        return aVal - bVal;
                    case 'pending':
                        aVal = parseFloat(a.cells[5].textContent.replace('$', ''));
                        bVal = parseFloat(b.cells[5].textContent.replace('$', ''));
                        return bVal - aVal; // Descending order for pending fees
                    default:
                        return 0;
                }
            });
            
            // Re-append sorted rows
            rows.forEach(row => tbody.appendChild(row));
        });

        // Update visible student count
        function updateVisibleCount() {
            const visibleRows = document.querySelectorAll('.student-row[style=""], .student-row:not([style])');
            const totalStudentsElement = document.getElementById('totalStudents');
            if (totalStudentsElement) {
                totalStudentsElement.textContent = visibleRows.length;
            }
        }

        // Add loading animation to search
        let searchTimeout;
        document.getElementById('searchInput').addEventListener('input', function() {
            clearTimeout(searchTimeout);
            const originalPlaceholder = this.placeholder;
            this.placeholder = 'Searching...';
            
            searchTimeout = setTimeout(() => {
                this.placeholder = originalPlaceholder;
            }, 500);
        });

        // Highlight search terms
        function highlightSearchTerm(text, term) {
            if (!term) return text;
            const regex = new RegExp(`(${term})`, 'gi');
            return text.replace(regex, '<mark style="background: yellow; padding: 2px;">$1</mark>');
        }

        // Add row hover effects
        document.querySelectorAll('.student-row').forEach(row => {
            row.addEventListener('mouseenter', function() {
                this.style.transform = 'scale(1.01)';
                this.style.transition = 'transform 0.2s ease';
            });
            
            row.addEventListener('mouseleave', function() {
                this.style.transform = 'scale(1)';
            });
        });
    </script>
</body>
</html>