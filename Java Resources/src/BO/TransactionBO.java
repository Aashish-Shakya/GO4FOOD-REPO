package BO;

import DAO.TransactionDAO;

public class TransactionBO {
	TransactionDAO dao = new TransactionDAO();
	
	public void startTransaction(String userName, String hash, String key, String txnid, String udf2, String service_provider, double amount, String status, String payment_mode) {
		dao.startTransaction(userName, hash, key, txnid, udf2, service_provider, amount, status, payment_mode);
	}
	
	public void startCod(String userName, double amount, String status, String payment_mode) {
		dao.startCod(userName, amount, status, payment_mode);
	}
}
