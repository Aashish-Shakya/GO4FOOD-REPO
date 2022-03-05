package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entity.Order;

public class OrderDAO {
	BillDAO bill = new BillDAO();
	DishJdbcDAO dao = new DishJdbcDAO();
	
	public List<Order> getOrderByBill(String username, int bill) {
		List<Order> al = new ArrayList<Order>();
		
		try {
			
			Connection conn = DBConnection.getConnection();
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM ORDER_TABLE WHERE BILL_NO = ? AND USERNAME = ?");
			stmt.setInt(1, bill);
			stmt.setString(2, username);
			
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				al.add(new Order(rs.getInt(1), rs.getString(2), dao.getDishByName(rs.getString(3)), rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7)));
			}
			
			conn.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return al;
	}
	
	public void insert(Order order) {
		try {
			
			Connection conn = DBConnection.getConnection();
			PreparedStatement stmt = conn.prepareStatement("INSERT INTO ORDER_TABLE (ID, USERNAME, DISH_NAME, QUANTITY, BILL_NO, TRANSACTION_ID) VALUES (ORDER_SEQ.NEXTVAL, ?, ?, ?, ?, ?)");
			stmt.setString(1, order.getUsername());
			stmt.setString(2, order.getDish().getName());
			stmt.setInt(3, order.getQuantity());
			stmt.setInt(4, bill.getBillByUsername(order.getUsername()).get(0).getBillNo());
			stmt.setString(5, order.getTransactionId());
			
			stmt.executeUpdate();
			
			conn.commit();
			conn.close();
			
			System.out.println("Order Created Successfully");
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("ORDER GOT EXCEPTION");
			e.printStackTrace();
		}
	}
}
