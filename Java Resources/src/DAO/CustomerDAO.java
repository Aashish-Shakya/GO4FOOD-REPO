package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import entity.Customer;

public class CustomerDAO {
	
	public int insert(Customer customer) {

		String d = "INSERT INTO customer VALUES(?,?,?,?,?,?,?,?)";
		int result = 0;
		
		try {
			Connection c = DBConnection.getConnection();
			PreparedStatement ps = c.prepareStatement(d);

			ps.setString(1, customer.getFIRSTNAME());
			ps.setString(2, customer.getLASTNAME());
			ps.setString(3, customer.getUSERNAME());
			ps.setString(4, customer.getEMAILID());
			ps.setLong(5, customer.getMOBILENUMBER());
			ps.setString(6, customer.getADDRESS());
			ps.setString(7, customer.getPASSWORD());
			ps.setString(8, customer.getGENDER());

			result = ps.executeUpdate();
			
			c.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public Customer getCustomerByUsername(String userName) {
		Customer customer = null;
		try {
			
			Connection con = DBConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from customer where USERNAME='" + userName + "'");
			
			while (rs.next()) {
				customer = new Customer(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getLong(5), rs.getString(6), rs.getString(7), rs.getString(8));
			}
			
			con.close();
			
		} catch (Exception e) {}
		
		return customer;
	}

}
