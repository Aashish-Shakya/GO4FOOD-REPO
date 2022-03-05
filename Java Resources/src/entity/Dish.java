package entity;

public class Dish {
	private int id;
	private String name;
	private Double price;
	private Double discount = 0.0;
	private String image_url;
	private String category;
	private String visibility = "Y";
	
	public Dish() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Dish(int id, String name, Double price, Double discount, String image_url, String category) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.discount = discount;
		this.image_url = image_url;
		this.category = category;
	}

	public Dish(int id, String name, Double price, Double discount, String image_url, String category,
			String visibility) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.discount = discount;
		this.image_url = image_url;
		this.category = category;
		this.visibility = visibility;
	}
	public Dish(int id, String name, Double price, String image_url, String category, String visibility) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.image_url = image_url;
		this.category = category;
		this.visibility = visibility;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getVisibility() {
		return visibility;
	}
	public void setVisibility(String visibility) {
		this.visibility = visibility;
	}

	
	
	
}
