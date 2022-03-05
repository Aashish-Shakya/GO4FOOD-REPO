package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entity.Bill;

public class BillDAO {

	public void insert(Bill bill) {
		try {
			
			Connection conn = DBConnection.getConnection();
			PreparedStatement stmt = conn.prepareStatement("INSERT INTO BILL (BILL_NO, USERNAME, TOTAL_AMOUNT, ADDRESS, TRANSACTION_ID, STATUS) VALUES (BILL_SEQ.NEXTVAL, ?, ?, ?, ?, ?)");
			stmt.setString(1, bill.getUsername());
			stmt.setDouble(2, bill.getTotalAmount());
			stmt.setString(3, bill.getAddress());
			stmt.setString(4, bill.getTransactionId());
			stmt.setString(5, bill.getStatus());
			
			stmt.executeUpdate();
			
			conn.commit();
			conn.close();
			
			System.out.println("Bill made successfully");
			
		} catch (Exception e) {
			System.out.println("BILL GOT EXCEPTION");
			e.printStackTrace();
		}
	}
	
	public List<Bill> getBillByUsername(String username) {
		
		OrderDAO dao = new OrderDAO();
		
		List<Bill> al = new ArrayList<Bill>();
		try {
			
			Connection conn = DBConnection.getConnection();
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM BILL WHERE USERNAME = ? ORDER BY BILL_NO DESC");
			stmt.setString(1, username);
			
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				al.add(new Bill(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), dao.getOrderByBill(username, rs.getInt(1))));
			}
			
			conn.close();
			
			return al;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	
}
