<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hostel Management System</title>
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
            max-width: 900px;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .header {
            text-align: center;
            margin-bottom: 50px;
        }

        .header h1 {
            color: #2c3e50;
            font-size: 2.8rem;
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

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            margin-top: 30px;
        }

        .card {
            background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
            border-radius: 15px;
            padding: 30px 25px;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            border: 1px solid rgba(0, 0, 0, 0.08);
            position: relative;
            overflow: hidden;
            cursor: pointer;
        }

        .card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent);
            transition: left 0.6s;
        }

        .card:hover::before {
            left: 100%;
        }

        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
            border-color: rgba(102, 126, 234, 0.3);
        }

        .card-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
            font-size: 1.8rem;
            color: white;
            position: relative;
            z-index: 1;
        }

        .card:nth-child(1) .card-icon {
            background: linear-gradient(135deg, #4facfe, #00f2fe);
        }

        .card:nth-child(2) .card-icon {
            background: linear-gradient(135deg, #43e97b, #38f9d7);
        }

        .card:nth-child(3) .card-icon {
            background: linear-gradient(135deg, #fa709a, #fee140);
        }

        .card:nth-child(4) .card-icon {
            background: linear-gradient(135deg, #a8edea, #fed6e3);
        }

        .card:nth-child(5) .card-icon {
            background: linear-gradient(135deg, #667eea, #764ba2);
        }

        .card-content h3 {
            color: #2c3e50;
            font-size: 1.4rem;
            font-weight: 600;
            margin-bottom: 12px;
            position: relative;
            z-index: 1;
        }

        .card-content p {
            color: #7f8c8d;
            font-size: 0.95rem;
            line-height: 1.6;
            margin-bottom: 20px;
            position: relative;
            z-index: 1;
        }

        .card-link {
            text-decoration: none;
            color: inherit;
            display: block;
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
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.4);
        }

        .welcome-text {
            text-align: center;
            margin-bottom: 30px;
            padding: 25px;
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
            border-radius: 15px;
            border: 1px solid rgba(102, 126, 234, 0.2);
        }

        .welcome-text h2 {
            color: #2c3e50;
            font-size: 1.6rem;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .welcome-text p {
            color: #7f8c8d;
            font-size: 1rem;
        }

        /* Subtle animations */
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

        .card {
            animation: fadeInUp 0.6s ease forwards;
        }

        .card:nth-child(1) { animation-delay: 0.1s; }
        .card:nth-child(2) { animation-delay: 0.2s; }
        .card:nth-child(3) { animation-delay: 0.3s; }
        .card:nth-child(4) { animation-delay: 0.4s; }
        .card:nth-child(5) { animation-delay: 0.5s; }

        /* Decorative elements */
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
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1><i class="fas fa-building"></i> Hostel Management System</h1>
            <p>Streamlined hostel administration made simple</p>
        </div>

        <div class="welcome-text">
            <h2>Welcome Administrator</h2>
            <p>Manage your hostel operations efficiently with our comprehensive dashboard</p>
        </div>

        <div class="dashboard-grid">
            <a href="studentadd.jsp" class="card-link">
                <div class="card">
                    <div class="card-icon">
                        <i class="fas fa-user-plus"></i>
                    </div>
                    <div class="card-content">
                        <h3>Add New Student</h3>
                        <p>Register new students and assign them to available rooms with complete profile setup.</p>
                        <div class="btn">
                            Get Started <i class="fas fa-arrow-right"></i>
                        </div>
                    </div>
                </div>
            </a>

            <a href="studentupdate.jsp" class="card-link">
                <div class="card">
                    <div class="card-icon">
                        <i class="fas fa-user-edit"></i>
                    </div>
                    <div class="card-content">
                        <h3>Update Student Info</h3>
                        <p>Modify existing student records, room assignments, and personal information.</p>
                        <div class="btn">
                            Update Now <i class="fas fa-arrow-right"></i>
                        </div>
                    </div>
                </div>
            </a>

            <a href="studentdelete.jsp" class="card-link">
                <div class="card">
                    <div class="card-icon">
                        <i class="fas fa-user-minus"></i>
                    </div>
                    <div class="card-content">
                        <h3>Remove Student</h3>
                        <p>Safely remove student records from the system when they check out.</p>
                        <div class="btn">
                            Manage <i class="fas fa-arrow-right"></i>
                        </div>
                    </div>
                </div>
            </a>

            <a href="displayStudents" class="card-link">
                <div class="card">
                    <div class="card-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <div class="card-content">
                        <h3>View All Students</h3>
                        <p>Browse through all registered students with detailed information and filters.</p>
                        <div class="btn">
                            View List <i class="fas fa-arrow-right"></i>
                        </div>
                    </div>
                </div>
            </a>

            <a href="report_form.jsp" class="card-link">
                <div class="card">
                    <div class="card-icon">
                        <i class="fas fa-chart-bar"></i>
                    </div>
                    <div class="card-content">
                        <h3>Generate Reports</h3>
                        <p>Create comprehensive reports for occupancy, payments, and analytics.</p>
                        <div class="btn">
                            Create Report <i class="fas fa-arrow-right"></i>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </div>
</body>
</html>