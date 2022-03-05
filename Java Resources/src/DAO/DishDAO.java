package DAO;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import entity.Dish;

public class DishDAO {
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public List<Dish> getAllDishes() {
		return jdbcTemplate.query("SELECT * FROM dish", new BeanPropertyRowMapper(Dish.class));
	}
	
	public void insertDish(Dish dish) {
		jdbcTemplate.update("INSERT INTO dish VALUES (dish_seq.nextval,?,?,?,?)", new Object[] {dish.getName(), dish.getPrice(), dish.getDiscount(), dish.getImage_url()});
	}
}
