package BO;

import DAO.OrderDAO;
import entity.Order;

public class OrderBO {
	OrderDAO dao = new OrderDAO();
	
	public void insertOrder(Order order) {
		dao.insert(order);
	}
}
