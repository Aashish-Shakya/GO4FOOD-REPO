package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedHashMap;
import java.util.Map;

import entity.Dish;

public class CartDAO {
	
	DishJdbcDAO dishDao = new DishJdbcDAO();
	
	public Map<Dish, Integer> getCartDetails(String userName) {

		
		Map<Dish, Integer> map = new LinkedHashMap<>();
		
		try {
			Connection conn = DBConnection.getConnection();

			PreparedStatement stmt = conn.prepareStatement("SELECT DETAILS, QUANTITY FROM CART WHERE USERNAME = ? ORDER BY DETAILS");
			stmt.setString(1, userName);

			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				Dish dish = dishDao.getDishByName(rs.getString(1));
				map.put(dish, rs.getInt(2));
			}
			conn.close();
			return map;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public void deleteAll(String userName) {
		try {
			Connection conn = DBConnection.getConnection();

			PreparedStatement stmt = conn.prepareStatement("DELETE FROM CART WHERE USERNAME = ?");
			stmt.setString(1, userName);

			stmt.executeUpdate();
			conn.commit();
			conn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void addToCart(String userName, String dishName) {

		try {
			Connection conn = DBConnection.getConnection();

			PreparedStatement stmt1 = conn.prepareStatement("INSERT INTO CART (USERNAME, DETAILS) VALUES (?, ?)");
			stmt1.setString(1, userName);
			stmt1.setString(2, dishName);

			stmt1.executeUpdate();
			conn.commit();
			conn.close();
		} catch (Exception e) {

		}
	}
	
	public void updateQuantity(String userName, String dishName, int quantity) {
		try {
			Connection conn = DBConnection.getConnection();
			
			System.out.println("UPDATE CART SET QUANTITY = " + quantity + " WHERE USERNAME = '" + userName + "' AND DETAILS = '" +dishName+"'");
			
			PreparedStatement stmt = conn.prepareStatement("UPDATE CART SET QUANTITY = ? WHERE USERNAME = ? AND DETAILS = ?");
			stmt.setInt(1, quantity);
			stmt.setString(2, userName);
			stmt.setString(3, dishName);
			
			stmt.executeUpdate();
			conn.commit();
			conn.close();
		} catch (Exception e) {

		}
	}
	
	public void delete(String userName, String dishName) {
		try {
			Connection conn = DBConnection.getConnection();

			PreparedStatement stmt = conn.prepareStatement("DELETE FROM CART WHERE USERNAME = ? AND DETAILS = ?");
			stmt.setString(1, userName);
			stmt.setString(2, dishName);

			stmt.executeUpdate();
			conn.commit();
			conn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public int total(String userName) {
		int total = 0;
		try {
			Connection conn = DBConnection.getConnection();

			PreparedStatement stmt = conn.prepareStatement("select count(*) from cart where username = ?");
			
			stmt.setString(1, userName);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				total =  rs.getInt(1);
			}
			conn.close();
			return total;
		} catch (Exception e) {
			
		}

		return total;
	}
}