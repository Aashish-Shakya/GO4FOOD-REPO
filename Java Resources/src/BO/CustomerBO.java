package BO;

import DAO.CustomerDAO;
import entity.Customer;

public class CustomerBO {
	CustomerDAO dao = new CustomerDAO();
	
	public int insert(Customer customer) {
		return dao.insert(customer);
	}
	
	public Customer getCustomerByUsername(String userName) {
		return dao.getCustomerByUsername(userName);
	}
}
