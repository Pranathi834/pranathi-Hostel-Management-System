package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.model.Student;

public class HostelDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/hostel_db"; // update DB name
    private String jdbcUsername = "root"; // update as needed
    private String jdbcPassword = "";     // update as needed

    private static final String INSERT_STUDENT_SQL = "INSERT INTO Students (StudentID, StudentName, RoomNumber, AdmissionDate, FeesPaid, PendingFees) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SELECT_ALL_STUDENTS = "SELECT * FROM Students";
    private static final String SELECT_STUDENT_BY_ID = "SELECT * FROM Students WHERE StudentID = ?";
    private static final String DELETE_STUDENT_SQL = "DELETE FROM Students WHERE StudentID = ?";
    private static final String UPDATE_STUDENT_SQL = "UPDATE Students SET StudentName=?, RoomNumber=?, AdmissionDate=?, FeesPaid=?, PendingFees=? WHERE StudentID=?";
    private static final String SELECT_PENDING_FEES = "SELECT * FROM Students WHERE PendingFees > 0";
    private static final String SELECT_BY_ROOM = "SELECT * FROM Students WHERE RoomNumber = ?";
    private static final String SELECT_BY_DATE_RANGE = "SELECT * FROM Students WHERE AdmissionDate BETWEEN ? AND ?";

    public HostelDAO() {}

    protected Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public void insertStudent(Student student) throws SQLException {
        try (Connection connection = getConnection(); PreparedStatement stmt = connection.prepareStatement(INSERT_STUDENT_SQL)) {
            stmt.setInt(1, student.getStudentID());
            stmt.setString(2, student.getStudentName());
            stmt.setString(3, student.getRoomNumber());
            stmt.setDate(4, student.getAdmissionDate());
            stmt.setDouble(5, student.getFeesPaid());
            stmt.setDouble(6, student.getPendingFees());
            stmt.executeUpdate();
        }
    }

    public List<Student> selectAllStudents() throws SQLException {
        List<Student> students = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement stmt = connection.prepareStatement(SELECT_ALL_STUDENTS); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Student student = new Student(
                    rs.getInt("StudentID"),
                    rs.getString("StudentName"),
                    rs.getString("RoomNumber"),
                    rs.getDate("AdmissionDate"),
                    rs.getDouble("FeesPaid"),
                    rs.getDouble("PendingFees")
                );
                students.add(student);
            }
        }
        return students;
    }

    public Student selectStudentByID(int id) throws SQLException {
        Student student = null;
        try (Connection connection = getConnection(); PreparedStatement stmt = connection.prepareStatement(SELECT_STUDENT_BY_ID)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                student = new Student(
                    rs.getInt("StudentID"),
                    rs.getString("StudentName"),
                    rs.getString("RoomNumber"),
                    rs.getDate("AdmissionDate"),
                    rs.getDouble("FeesPaid"),
                    rs.getDouble("PendingFees")
                );
            }
        }
        return student;
    }

    public boolean updateStudent(Student student) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement stmt = connection.prepareStatement(UPDATE_STUDENT_SQL)) {
            stmt.setString(1, student.getStudentName());
            stmt.setString(2, student.getRoomNumber());
            stmt.setDate(3, student.getAdmissionDate());
            stmt.setDouble(4, student.getFeesPaid());
            stmt.setDouble(5, student.getPendingFees());
            stmt.setInt(6, student.getStudentID());
            rowUpdated = stmt.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public boolean deleteStudent(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement stmt = connection.prepareStatement(DELETE_STUDENT_SQL)) {
            stmt.setInt(1, id);
            rowDeleted = stmt.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public List<Student> getStudentsWithPendingFees() throws SQLException {
        List<Student> students = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement stmt = connection.prepareStatement(SELECT_PENDING_FEES); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                students.add(new Student(
                    rs.getInt("StudentID"),
                    rs.getString("StudentName"),
                    rs.getString("RoomNumber"),
                    rs.getDate("AdmissionDate"),
                    rs.getDouble("FeesPaid"),
                    rs.getDouble("PendingFees")
                ));
            }
        }
        return students;
    }

    public List<Student> getStudentsInRoom(String room) throws SQLException {
        List<Student> students = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement stmt = connection.prepareStatement(SELECT_BY_ROOM)) {
            stmt.setString(1, room);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                students.add(new Student(
                    rs.getInt("StudentID"),
                    rs.getString("StudentName"),
                    rs.getString("RoomNumber"),
                    rs.getDate("AdmissionDate"),
                    rs.getDouble("FeesPaid"),
                    rs.getDouble("PendingFees")
                ));
            }
        }
        return students;
    }

    public List<Student> getStudentsByDateRange(Date startDate, Date endDate) throws SQLException {
        List<Student> students = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement stmt = connection.prepareStatement(SELECT_BY_DATE_RANGE)) {
            stmt.setDate(1, startDate);
            stmt.setDate(2, endDate);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                students.add(new Student(
                    rs.getInt("StudentID"),
                    rs.getString("StudentName"),
                    rs.getString("RoomNumber"),
                    rs.getDate("AdmissionDate"),
                    rs.getDouble("FeesPaid"),
                    rs.getDouble("PendingFees")
                ));
            }
        }
        return students;
    }
}
