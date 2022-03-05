package entity;

import java.util.ArrayList;
import java.util.List;

public class Bill {
	private Integer billNo;
	private String username;
	private Double totalAmount;
	private String address;
	private String transactionId;
	private String status;
	private String dateTime;
	
	private List<Order> ordersList = new ArrayList<>();
	
	public Bill(String username, Double totalAmount, String address, String transactionId, String status) {
		super();
		this.username = username;
		this.totalAmount = totalAmount;
		this.address = address;
		this.transactionId = transactionId;
		this.status = status;
	}
	public Bill(Integer billNo, String username, Double totalAmount, String address, String transactionId,
			String status, String dateTime, List<Order> ordersList) {
		super();
		this.billNo = billNo;
		this.username = username;
		this.totalAmount = totalAmount;
		this.address = address;
		this.transactionId = transactionId;
		this.status = status;
		this.dateTime = dateTime;
		this.ordersList = ordersList;
	}
	public Bill(Integer billNo, String username, Double totalAmount, String address, String transactionId,
			String status, String dateTime) {
		super();
		this.billNo = billNo;
		this.username = username;
		this.totalAmount = totalAmount;
		this.address = address;
		this.transactionId = transactionId;
		this.status = status;
		this.dateTime = dateTime;
	}
	public Integer getBillNo() {
		return billNo;
	}
	public void setBillNo(Integer billNo) {
		this.billNo = billNo;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	public List<Order> getOrdersList() {
		return ordersList;
	}
	public void setOrdersList(List<Order> ordersList) {
		this.ordersList = ordersList;
	}

	
	
	 
}
