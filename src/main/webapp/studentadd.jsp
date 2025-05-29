<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Student - Hostel Management System</title>
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
            font-size: 2.2rem;
            font-weight: 700;
            margin-bottom: 10px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .header p {
            color: #7f8c8d;
            font-size: 1rem;
            font-weight: 400;
        }

        .form-container {
            position: relative;
            z-index: 1;
        }

        .form-group {
            margin-bottom: 25px;
            animation: fadeInUp 0.6s ease forwards;
        }

        .form-group:nth-child(1) { animation-delay: 0.1s; }
        .form-group:nth-child(2) { animation-delay: 0.15s; }
        .form-group:nth-child(3) { animation-delay: 0.2s; }
        .form-group:nth-child(4) { animation-delay: 0.25s; }
        .form-group:nth-child(5) { animation-delay: 0.3s; }
        .form-group:nth-child(6) { animation-delay: 0.35s; }

        label {
            display: block;
            color: #2c3e50;
            font-weight: 600;
            font-size: 0.95rem;
            margin-bottom: 8px;
            position: relative;
        }

        label i {
            margin-right: 8px;
            color: #667eea;
            width: 16px;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid rgba(102, 126, 234, 0.2);
            border-radius: 12px;
            font-size: 1rem;
            font-family: inherit;
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(10px);
            transition: all 0.3s ease;
            color: #2c3e50;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="date"]:focus {
            outline: none;
            border-color: #667eea;
            background: rgba(255, 255, 255, 0.95);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.15);
            transform: translateY(-2px);
        }

        input[type="text"]::placeholder,
        input[type="number"]::placeholder {
            color: #a0aec0;
            font-style: italic;
        }

        .btn-container {
            display: flex;
            gap: 15px;
            margin-top: 40px;
            animation: fadeInUp 0.6s ease forwards;
            animation-delay: 0.4s;
        }

        .btn {
            flex: 1;
            padding: 15px 25px;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            text-decoration: none;
            font-family: inherit;
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 30px rgba(102, 126, 234, 0.4);
        }

        .btn-secondary {
            background: rgba(108, 117, 125, 0.1);
            color: #6c757d;
            border: 2px solid rgba(108, 117, 125, 0.2);
        }

        .btn-secondary:hover {
            background: rgba(108, 117, 125, 0.2);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(108, 117, 125, 0.2);
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

        /* Form validation styles */
        input:invalid {
            border-color: rgba(220, 53, 69, 0.3);
        }

        input:valid {
            border-color: rgba(40, 167, 69, 0.3);
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .container {
                margin: 10px;
                padding: 30px 25px;
            }

            .header h1 {
                font-size: 1.8rem;
            }

            .btn-container {
                flex-direction: column;
            }

            input[type="text"],
            input[type="number"],
            input[type="date"] {
                padding: 12px 16px;
            }
        }

        /* Loading animation for form submission */
        .form-container.loading {
            pointer-events: none;
            opacity: 0.7;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1><i class="fas fa-user-plus"></i> Add New Student</h1>
            <p>Register a new student to the hostel management system</p>
        </div>

        <div class="form-container">
            <form action="addStudent" method="post" id="studentForm">
                <div class="form-group">
                    <label for="studentID">
                        <i class="fas fa-id-card"></i>Student ID
                    </label>
                    <input type="number" id="studentID" name="studentID" required min="1" placeholder="Enter unique student ID">
                </div>

                <div class="form-group">
                    <label for="studentName">
                        <i class="fas fa-user"></i>Student Name
                    </label>
                    <input type="text" id="studentName" name="studentName" required placeholder="Enter full name">
                </div>

                <div class="form-group">
                    <label for="roomNumber">
                        <i class="fas fa-door-open"></i>Room Number
                    </label>
                    <input type="text" id="roomNumber" name="roomNumber" required placeholder="e.g., A-101, B-205">
                </div>

                <div class="form-group">
                    <label for="admissionDate">
                        <i class="fas fa-calendar-alt"></i>Admission Date
                    </label>
                    <input type="date" id="admissionDate" name="admissionDate" required>
                </div>

                <div class="form-group">
                    <label for="feesPaid">
                        <i class="fas fa-dollar-sign"></i>Fees Paid
                    </label>
                    <input type="number" step="0.01" id="feesPaid" name="feesPaid" required min="0" placeholder="0.00">
                </div>

                <div class="form-group">
                    <label for="pendingFees">
                        <i class="fas fa-exclamation-triangle"></i>Pending Fees
                    </label>
                    <input type="number" step="0.01" id="pendingFees" name="pendingFees" required min="0" placeholder="0.00">
                </div>

                <div class="btn-container">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i>Add Student
                    </button>
                    <a href="index.jsp" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i>Back to Home
                    </a>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Add some interactivity
        document.getElementById('studentForm').addEventListener('submit', function(e) {
            const formContainer = document.querySelector('.form-container');
            formContainer.classList.add('loading');
            
            // Remove loading class after a delay (in case of validation errors)
            setTimeout(() => {
                formContainer.classList.remove('loading');
            }, 2000);
        });

        // Auto-calculate pending fees when fees paid changes
        document.getElementById('feesPaid').addEventListener('input', function() {
            const feesPaid = parseFloat(this.value) || 0;
            const pendingFeesInput = document.getElementById('pendingFees');
            
            // You can set a default total fee amount here
            // For now, just ensure pending fees is not negative
            if (pendingFeesInput.value === '' || parseFloat(pendingFeesInput.value) < 0) {
                pendingFeesInput.value = '0.00';
            }
        });

        // Set default date to today
        document.getElementById('admissionDate').valueAsDate = new Date();
    </script>
</body>
</html>