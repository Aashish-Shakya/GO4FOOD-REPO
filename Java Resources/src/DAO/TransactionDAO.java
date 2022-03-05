package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class TransactionDAO {
	
	public void startTransaction(String userName, String hash, String key, String txnid, String udf2, String service_provider, double amount, String status, String payment_mode) {
		
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement stmt = conn.prepareStatement("INSERT INTO TRANSACTION (ID, USERNAME, HASH, KEY, TXNID, UDF2, SERVICE_PROVIDER, AMOUNT, STATUS, PAYMENT_MODE) VALUES (TRANSACTION_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			stmt.setString(1, userName);
			stmt.setString(2, hash);
			stmt.setString(3, key);
			stmt.setString(4, txnid);
			stmt.setString(5, udf2);
			stmt.setString(6, service_provider);
			stmt.setDouble(7, amount);
			stmt.setString(8, status);
			stmt.setString(9, payment_mode);
			
			stmt.executeUpdate();
			
			conn.commit();
			
			conn.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public void startCod(String userName, double amount, String status, String payment_mode) {
		
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement stmt = conn.prepareStatement("INSERT INTO TRANSACTION (ID, USERNAME, AMOUNT, STATUS, PAYMENT_MODE) VALUES (TRANSACTION_SEQ.NEXTVAL, ?, ?, ?, ?)");
			stmt.setString(1, userName);
			stmt.setDouble(2, amount);
			stmt.setString(3, status);
			stmt.setString(4, payment_mode);
			
			stmt.executeUpdate();
			
			conn.commit();
			
			conn.close();
			System.out.println("Transaction made successfully.");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("TRANSACTION GOT EXCEPTION");
		}
	}
}
