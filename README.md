# 🏨 Hostel Management System

**Subject Name**: Advanced Java
**Subject Code**: BCS613D
**Name**: Pranathi
**USN**: \[Your USN]
**Sem/Section**: VI/C

---

A comprehensive web application for managing hostel operations, built with JSP, Servlets, and MySQL, following MVC architecture principles.

## 🚀 Features

* **Complete CRUD Operations**: Add, Update, Delete, and Display hostel records
* **Advanced Search**: Search hostel records by ID
* **Comprehensive Reports**: Generate various reports including:

  * Occupancy status
  * Room availability
  * Resident details
* **Input Validation**: Client-side and server-side validation
* **Professional UI**: Bootstrap-based responsive design
* **MVC Architecture**: Clean separation of concerns
* **Database Integration**: MySQL with JDBC connectivity

## 📋 Prerequisites

Before running this application, ensure you have the following installed:

* Java Development Kit (JDK) 8 or higher
* Apache Tomcat 9.0 or higher
* MySQL Server 5.7 or XAMPP Server
* MySQL JDBC Driver (mysql-connector-java)
* IDE: Eclipse (J2EE), IntelliJ IDEA, or any Java IDE
* Web Browser: Chrome, Firefox, or Edge

## 🛠️ Project Structure

```
HostelManagementSystem/
├── src/
│   ├── dao/
│   │   └── HostelDAO.java
│   ├── model/
│   │   └── Hostel.java
│   └── servlet/
│       ├── AddHostelServlet.java
│       ├── UpdateHostelServlet.java
│       ├── DeleteHostelServlet.java
│       ├── DisplayHostelsServlet.java
│       ├── ReportServlet.java
│       └── ReportCriteriaServlet.java
├── WebContent/
│   ├── index.jsp
│   ├── hosteladd.jsp
│   ├── hostelupdate.jsp
│   ├── hosteldelete.jsp
│   ├── hosteldisplay.jsp
│   ├── reports.jsp
│   ├── report_form.jsp
│   └── report_result.jsp
├── WEB-INF/
│   └── web.xml
└── README.md
```

## 🗄️ Database Setup

### 1. Create Database

```sql
CREATE DATABASE IF NOT EXISTS hostel_management;
USE hostel_management;
```

### 2. Create Table

```sql
CREATE TABLE IF NOT EXISTS Hostel (
    HostelID INT PRIMARY KEY,
    HostelName VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL,
    Capacity INT NOT NULL,
    Occupied INT NOT NULL
);
```

### 3. Insert Sample Data

```sql
INSERT INTO Hostel VALUES
(1, 'Sunrise Hostel', 'Downtown', 100, 75),
(2, 'Moonlight Hostel', 'Uptown', 80, 60),
(3, 'Starlight Hostel', 'Suburb', 120, 90);
```

## ⚙️ Installation & Setup

### Step 1: Clone/Download the Project

Download all the project files and organize them according to the project structure above.

### Step 2: Database Configuration

* Start your MySQL server
* Run the database setup scripts provided above
* Update database credentials in `HostelDAO.java`:

```java
connection = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/hostel_management",
    "your_username",
    "your_password");
```

### Step 3: Add MySQL JDBC Driver

* Download MySQL Connector/J from the official MySQL website
* Add the JAR file to your project's `WEB-INF/lib` directory
* If using an IDE, add it to your build path

### Step 4: Deploy to Tomcat

* Create a new Dynamic Web Project in your IDE
* Copy all source files to the appropriate folders
* Deploy the project to Tomcat server
* Start the Tomcat server

### Step 5: Access the Application

Open your web browser and navigate to:

```
http://localhost:8080/HostelManagementSystem/
```

## 🖼️ Screenshots

* 🏠 Home Page
* ![Screenshot 2025-05-29 213810](https://github.com/user-attachments/assets/fc33c76e-1a31-49d0-8846-1b7d9dab54a6)

* ➕ Add Hostel Page
* 🔍 Search Hostel
* ❌ Delete Hostel
* 🆕 Update Hostel
* 📋 Display Hostels

## 🌟 Usage Application

### Adding Hostel Details

* Navigate to "Add Hostel" from the main menu
* Fill in all required fields:

  * Hostel ID (unique identifier)
  * Hostel Name
  * Location
  * Capacity
  * Occupied
* Click "Add Hostel"

### Updating Hostel Details

* Go to "Update Hostel"
* Search for a hostel by ID
* Modify the displayed information
* Click "Update Hostel"

### Deleting Hostel Details

* Go to "Delete Hostel"
* Search for a hostel by ID
* Confirm deletion by checking the confirmation box
* Click "Delete Hostel"

### Displaying Hostel Details

* Go to "Display Hostels"
* Either view all records or search by specific Hostel ID
* Use the action buttons to Edit or Delete records

### Generating Reports

* Go to "Generate Reports"
* Select report type:

  * Occupancy Report: View current occupancy status
  * Available Rooms: List of hostels with available rooms
  * Full Capacity: Hostels at full capacity
* Click "Generate Report"
* View results with statistics and print option

## 🔧 Technical Features

### Input Validation

* Client-side: JavaScript validation with Bootstrap
* Server-side: Comprehensive validation in servlets
* Database constraints: Primary key and NOT NULL constraints

### Error Handling

* Try-catch blocks for database operations
* User-friendly error messages
* Graceful handling of invalid inputs

### Security Features

* Prepared statements to prevent SQL injection
* Input validation
* Session management

### Responsive Design

* Bootstrap 5.3 framework
* Styling with hover effects
* Print-friendly report layouts

## 🧪 Testing the Application

### Test Cases to Verify:

#### Add Operations:

* Add valid hostel records
* Try adding duplicate Hostel IDs (should fail)
* Test input validation (empty fields, invalid data, etc.)

#### Update Operations:

* Update existing records
* Try updating non-existent Hostel ID
* Test field validation

#### Delete Operations:

* Delete existing records
* Try deleting non-existent Hostel ID
* Test confirmation mechanism

#### Display Operations:

* View all records
* Search by valid Hostel ID
* Search by invalid Hostel ID

#### Report Generation:

* Generate all three types of reports
* Test with different criteria values
* Verify statistics calculations

## 🎓 Outcomes

This project demonstrates:

* **MVC Architecture**: Clear separation between Model, View, and Controller
* **Database Integration**: CRUD operations with MySQL
* **Web Development**: JSP, Servlets, HTML, CSS, JavaScript
* **Input Validation**: Both client-side and server-side
* **Report Generation**: Dynamic data analysis and presentation
* **Professional UI**: Responsive design with Bootstrap
