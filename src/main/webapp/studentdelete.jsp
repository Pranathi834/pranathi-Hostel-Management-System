<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Student - Hostel Management System</title>
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
            max-width: 550px;
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

        .warning-banner {
            background: linear-gradient(135deg, rgba(220, 53, 69, 0.1), rgba(255, 193, 7, 0.1));
            border: 2px solid rgba(220, 53, 69, 0.2);
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 30px;
            text-align: center;
            position: relative;
            z-index: 1;
            animation: fadeInUp 0.6s ease forwards;
        }

        .warning-banner i {
            color: #dc3545;
            font-size: 2rem;
            margin-bottom: 10px;
            display: block;
        }

        .warning-banner h3 {
            color: #dc3545;
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .warning-banner p {
            color: #6c757d;
            font-size: 0.9rem;
            line-height: 1.5;
        }

        .form-container {
            position: relative;
            z-index: 1;
        }

        .form-group {
            margin-bottom: 30px;
            animation: fadeInUp 0.6s ease forwards;
            animation-delay: 0.2s;
        }

        label {
            display: block;
            color: #2c3e50;
            font-weight: 600;
            font-size: 1rem;
            margin-bottom: 12px;
            position: relative;
        }

        label i {
            margin-right: 10px;
            color: #667eea;
            width: 20px;
        }

        input[type="number"] {
            width: 100%;
            padding: 18px 24px;
            border: 2px solid rgba(102, 126, 234, 0.2);
            border-radius: 12px;
            font-size: 1.1rem;
            font-family: inherit;
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(10px);
            transition: all 0.3s ease;
            color: #2c3e50;
            text-align: center;
            font-weight: 500;
        }

        input[type="number"]:focus {
            outline: none;
            border-color: #dc3545;
            background: rgba(255, 255, 255, 0.95);
            box-shadow: 0 8px 25px rgba(220, 53, 69, 0.15);
            transform: translateY(-2px);
        }

        input[type="number"]::placeholder {
            color: #a0aec0;
            font-style: italic;
            font-weight: 400;
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
            padding: 16px 25px;
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

        .btn-danger {
            background: linear-gradient(135deg, #dc3545, #c82333);
            color: white;
        }

        .btn-danger:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 30px rgba(220, 53, 69, 0.4);
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

        /* Confirmation modal styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(5px);
        }

        .modal-content {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            margin: 15% auto;
            padding: 30px;
            border-radius: 20px;
            width: 90%;
            max-width: 400px;
            text-align: center;
            box-shadow: 0 25px 45px rgba(0, 0, 0, 0.2);
            animation: modalSlideIn 0.3s ease;
        }

        @keyframes modalSlideIn {
            from {
                transform: translateY(-50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .modal h3 {
            color: #dc3545;
            margin-bottom: 15px;
            font-size: 1.3rem;
        }

        .modal p {
            color: #6c757d;
            margin-bottom: 25px;
            line-height: 1.5;
        }

        .modal-buttons {
            display: flex;
            gap: 10px;
            justify-content: center;
        }

        .modal .btn {
            flex: none;
            min-width: 100px;
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
                margin: 10px;
                padding: 30px 25px;
            }

            .header h1 {
                font-size: 1.8rem;
            }

            .btn-container {
                flex-direction: column;
            }

            input[type="number"] {
                padding: 15px 20px;
                font-size: 1rem;
            }
        }

        /* Loading state */
        .form-container.loading {
            pointer-events: none;
            opacity: 0.7;
        }

        .pulse {
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
            100% {
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1><i class="fas fa-user-minus"></i> Delete Student</h1>
            <p>Remove a student record from the hostel management system</p>
        </div>

        <div class="warning-banner">
            <i class="fas fa-exclamation-triangle"></i>
            <h3>Warning: Permanent Action</h3>
            <p>This action cannot be undone. Please ensure you have the correct Student ID before proceeding.</p>
        </div>

        <div class="form-container">
            <form id="deleteForm" method="post">
                <div class="form-group">
                    <label for="studentID">
                        <i class="fas fa-id-card"></i>Student ID to Delete
                    </label>
                    <input type="number" id="studentID" name="studentID" required min="1" 
                           placeholder="Enter the student ID to remove">
                </div>

                <div class="btn-container">
                    <button type="button" class="btn btn-danger" id="deleteBtn">
                        <i class="fas fa-trash-alt"></i>Delete Student
                    </button>
                    <a href="index.jsp" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i>Back to Home
                    </a>
                </div>
            </form>
        </div>
    </div>

    <!-- Confirmation Modal -->
    <div id="confirmModal" class="modal">
        <div class="modal-content">
            <h3><i class="fas fa-exclamation-triangle"></i> Confirm Deletion</h3>
            <p>Are you sure you want to delete student with ID <strong id="confirmStudentId"></strong>?</p>
            <p style="color: #dc3545; font-size: 0.9rem;">This action cannot be reversed.</p>
            <div class="modal-buttons">
                <button type="button" class="btn btn-danger" id="confirmDelete">
                    <i class="fas fa-check"></i>Yes, Delete
                </button>
                <button type="button" class="btn btn-secondary" id="cancelDelete">
                    <i class="fas fa-times"></i>Cancel
                </button>
            </div>
        </div>
    </div>

    <script>
        // Get modal elements
        const modal = document.getElementById('confirmModal');
        const deleteBtn = document.getElementById('deleteBtn');
        const confirmDelete = document.getElementById('confirmDelete');
        const cancelDelete = document.getElementById('cancelDelete');
        const studentIdInput = document.getElementById('studentID');
        const confirmStudentId = document.getElementById('confirmStudentId');
        const deleteForm = document.getElementById('deleteForm');

        // Show confirmation modal
        deleteBtn.addEventListener('click', function(e) {
            e.preventDefault();
            
            const studentId = studentIdInput.value.trim();
            
            if (!studentId) {
                studentIdInput.focus();
                studentIdInput.style.borderColor = '#dc3545';
                setTimeout(() => {
                    studentIdInput.style.borderColor = '';
                }, 2000);
                return;
            }

            confirmStudentId.textContent = studentId;
            modal.style.display = 'block';
        });

        // Handle confirmation
        confirmDelete.addEventListener('click', function() {
            modal.style.display = 'none';
            
            // Add loading state
            const formContainer = document.querySelector('.form-container');
            formContainer.classList.add('loading');
            
            // Submit the form
            deleteForm.action = 'deleteStudent';
            deleteForm.submit();
        });

        // Handle cancellation
        cancelDelete.addEventListener('click', function() {
            modal.style.display = 'none';
        });

        // Close modal when clicking outside
        window.addEventListener('click', function(event) {
            if (event.target === modal) {
                modal.style.display = 'none';
            }
        });

        // Add pulse effect to warning banner
        setTimeout(() => {
            document.querySelector('.warning-banner').classList.add('pulse');
        }, 1000);

        // Input validation and formatting
        studentIdInput.addEventListener('input', function() {
            this.style.borderColor = '';
            
            // Remove any non-numeric characters
            this.value = this.value.replace(/[^0-9]/g, '');
        });

        // Focus input on page load
        window.addEventListener('load', function() {
            studentIdInput.focus();
        });
    </script>
</body>
</html>