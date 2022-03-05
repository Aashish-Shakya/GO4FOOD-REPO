package BO;

import DAO.BillDAO;
import entity.Bill;

public class BillBO {
	BillDAO dao = new BillDAO();
	
	public void insertBill(Bill bill) {
		dao.insert(bill);
	}
}
