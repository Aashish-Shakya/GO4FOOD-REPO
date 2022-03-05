package BO;

import java.util.Map;

import DAO.CartDAO;
import entity.Dish;

public class CartBO {
	CartDAO dao = new CartDAO();
	
	public void deleteAll(String username) {
		dao.deleteAll(username);
	}
	
	public void add(String userName, String dishName) {
		dao.addToCart(userName, dishName);
	}
	
	public Map<Dish, Integer> getCartDetails(String username) {
		return dao.getCartDetails(username);
	}
	
	public void updateQuantity(String userName, String dishName, int quantity) {
		dao.updateQuantity(userName, dishName, quantity);
	}
	
	public void delete(String userName, String dishName) {
		dao.delete(userName, dishName);
	}
	
	public int total(String userName) {
		return dao.total(userName);
	}
}
