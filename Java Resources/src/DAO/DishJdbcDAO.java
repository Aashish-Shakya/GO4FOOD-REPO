package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Dish;

public class DishJdbcDAO {

	public List<Dish> list() throws Exception {

		List<Dish> al = new ArrayList<>();

		Connection conn = DBConnection.getConnection();

		ResultSet rs = conn.createStatement().executeQuery("SELECT * FROM dish");

		while (rs.next()) {
			al.add(new Dish(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getDouble(4), rs.getString(5),
					rs.getString(6), rs.getString(7)));
		}

		rs.close();
		conn.close();
		return al;
	}

	public void addDish(Dish dish) throws Exception {
		Connection conn = DBConnection.getConnection();

		PreparedStatement stmt = conn.prepareStatement("INSERT INTO dish VALUES (dish_seq.nextval,?,?,?,?,?,?)");
		stmt.setString(1, dish.getName());
		stmt.setDouble(2, dish.getPrice());
		stmt.setDouble(3, dish.getDiscount());
		stmt.setString(4, dish.getImage_url());
		stmt.setString(5, dish.getCategory());
		stmt.setString(6, dish.getVisibility());

		stmt.executeUpdate();
		conn.commit();
		
		conn.close();
	
	}

	public Dish getDishByName(String dishName) {
		
		Dish dish = null;
		try {
			Connection conn = DBConnection.getConnection();
				
				PreparedStatement stmt = conn.prepareStatement("SELECT * FROM DISH WHERE NAME = ?");
				stmt.setString(1, dishName.trim());

				ResultSet rs = stmt.executeQuery();
				
				while (rs.next()) {
					return new Dish(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getDouble(4), rs.getString(5),
							rs.getString(6), rs.getString(7));
				}
				conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dish;
	}
}
