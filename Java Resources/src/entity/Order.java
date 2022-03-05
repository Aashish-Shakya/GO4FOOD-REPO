package entity;

public class Order {
	private int id;
	private String username;
	private Dish dish;
	private int quantity;
	private int billNo;
	private String transactionId;
	private String dateTime;
	
	public Order(int id, String username, Dish dish, int quantity, int billNo, String transactionId, String dateTime) {
		super();
		this.id = id;
		this.username = username;
		this.dish = dish;
		this.quantity = quantity;
		this.billNo = billNo;
		this.transactionId = transactionId;
		this.dateTime = dateTime;
	}

	public Order(String username, Dish dish, int quantity, String transactionId) {
		super();
		this.username = username;
		this.dish = dish;
		this.quantity = quantity;
		this.transactionId = transactionId;
	}



	public Order() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Dish getDish() {
		return dish;
	}

	public void setDish(Dish dish) {
		this.dish = dish;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getBillNo() {
		return billNo;
	}

	public void setBillNo(int billNo) {
		this.billNo = billNo;
	}

	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	
	
}
