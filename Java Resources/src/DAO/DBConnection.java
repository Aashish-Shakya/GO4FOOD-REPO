package DAO;

import java.sql.*;
public class DBConnection {
    public static Connection getConnection() throws Exception {   
        
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "HR");
		return conn;
      
    }
}

