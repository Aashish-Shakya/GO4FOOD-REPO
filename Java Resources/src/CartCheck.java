import java.util.Map;

import BO.CartBO;
import entity.Dish;

public class CartCheck {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		CartBO bo = new CartBO();
		
//		bo.add("satya", "Samosa");
		
		for (Map.Entry<Dish, Integer> item : bo.getCartDetails("satya").entrySet()) {
//			System.out.println("Dish Id : " + item.getKey().getId());
//			System.out.println(", Dishname : " + item.getKey().getName());
			System.out.println(", Quantity : " + item.getValue());
			System.out.println("<br>");
		}
	}

}
