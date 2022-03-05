import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import BO.DishBO;
import DAO.DishDAO;
import DAO.DishJdbcDAO;
import entity.Dish;

public class DishAdd {

	public static void main(String[] args) throws Exception {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
//		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//
//		DishDAO dao = context.getBean("DishDAO", DishDAO.class);
//		
//		DishBO bo = new DishBO();
//		
//		for (Dish d : bo.getAllDishList()) {
//			System.out.println(d.getName());
//		}
		
//		do {
//			Dish dish = new Dish();
//			
//			System.out.println("Enter dish name");
//			dish.setName(br.readLine());
//			
//			System.out.println("Enter dish price");
//			dish.setPrice(Double.parseDouble(br.readLine()));
//			
//			System.out.println("Enter discount");
//			dish.setDiscount(Double.parseDouble(br.readLine()));
//			
//			dao.insertDish(dish);
//			
//			System.out.println("Value successfully inserted");
//			
//			System.out.println("Do you want to add more? Y/N");
//			
//			if (br.readLine().trim().equalsIgnoreCase("N")) {
//				System.exit(0);
//			}
//		} while (true);
		
	 	List<Dish> nd = new ArrayList<Dish>();
//	  	nd.add(new Dish(1, "Pav Bhaji", 200.0, 1.0,
//				"https://www.rajbhog.com/wp-content/uploads/2021/02/Pav-Bhaji-870x635.jpg", "NORTHERN"));
//		nd.add(new Dish(2, "Chhole Bhature", 100.0, 2.0, "images/chb.jfif", "NORTHERN"));
//		
//		nd.add(new Dish(3, "Samose", 20.0, 5.0, "images/samose.jfif", "NORTHERN"));
// 		nd.add(new Dish(4, "Chilli Potato", 80.0, 10.0, "images/chilli_potato.png", "NORTHERN"));
// 		nd.add(new Dish(5, "Gol Gappe", 30.0, 2.0, "images/ggp.jfif", "NORTHERN"));
// 		nd.add(new Dish(6, "Kachori", 25.0, 5.0, "images/kachorrii.jfif", "NORTHERN"));
// 		nd.add(new Dish(7, "Shai Paneer", 350.0, 20.0, "images/panneer.jfif", "NORTHERN"));
// 		nd.add(new Dish(8, "Tandoori Chicken", 550.0, 50.0, "images/cct.jfif", "NORTHERN"));
// 		nd.add(new Dish(8, "Malai Chicken", 450.0, 50.0, "images/chick.png", "NORTHERN"));
// 		nd.add(new Dish(8, "Boiled Chicken", 350.0, 50.0, "images/diet.jpg", "NORTHERN"));
// 		nd.add(new Dish(8, "Dhokla", 140.0, 20.0, "images/ddk.jfif", "NORTHERN"));
// 		nd.add(new Dish(8, "Golgappe", 40.0, 5.0, "images/ggp.jfif", "NORTHERN"));
		nd.add(new Dish(8, "Mix Salad", 80.0, 20.0, "images/mixsalad.png", "NORTHERN"));
// 		nd.add(new Dish(8, "Matar Paneer", 350.0, 20.0, "images/paneer.jpg", "NORTHERN"));
// 		nd.add(new Dish(8, "Paranthe", 50.0, 20.0, "images/Paranthai.png", "NORTHERN"));
 		
 		

 	//	List<Dish> it = new ArrayList<Dish>();
//	 
//		it.add(new Dish(1, "Lasagna", 170.0, 20.0, "images/Lasagna.jfif", "ITALIAN")); 
 //		it.add(new Dish(1, "Pizza Burger", 170.0, 20.0, "images/pzb.png", "ITALIAN")); 
 	//	it.add(new Dish(1, "Pizza", 170.0, 20.0, "images/pizza.jfif", "ITALIAN"));
// 		
 		

//		List<Dish> sw = new ArrayList<Dish>();
//		sw.add(new Dish(1, "Jalebi", 140.0, 20.0, "images/jalebi.jfif", "SWEET"));
//		sw.add(new Dish(1, "Rasmalai", 160.0, 20.0, "images/rasmalyai.jfif", "SWEET"));
//		sw.add(new Dish(1, "Rasgulle", 250.0, 20.0, "images/rassgulle.jfif", "SWEET"));
 		
// 		
// 		List<Dish> ri = new ArrayList<Dish>();
//		ri.add(new Dish(1, "Biryani", 220.0, 20.0, "images/biryani.jfif", "RICE"));
// 		ri.add(new Dish(1, "Bolied Rice", 70.0, 20.0, "images/rice.jfif", "RICE"));
// 		ri.add(new Dish(1, "Rajma Chawal", 220.0, 20.0, "images/rjrc.jfif", "RICE"));

 		
 		
// 		List<Dish> ch = new ArrayList<Dish>();
//		ch.add(new Dish(1, "Chilli Potato", 120.0, 20.0, "images/chilli_potato.png", "CHINESE"));
// 		ch.add(new Dish(1, "Chowmein", 120.0, 20.0, "images/chowminnew.png", "CHINESE"));
// 		ch.add(new Dish(1, "Manchurian", 120.0, 10.0, "images/manchuriyan.png", "CHINESE"));
// 		ch.add(new Dish(1, "Roll", 70.0, 10.0, "images/MicrosoftTeams-image (33).png", "CHINESE"));
// 		ch.add(new Dish(1, "Spring Roll", 70.0, 10.0, "images/springrolls.jfif", "CHINESE"));
// 		ch.add(new Dish(1, "Pasta", 90.0, 20.0, "images/pasta.jfif", "CHINESE"));
// 		ch.add(new Dish(1, "Momos", 80.0, 20.0, "images/momos.jfif", "CHINESE"));
// 		ch.add(new Dish(1, "Noodles", 100.0, 20.0, "images/noodles.jfif", "CHINESE"));
// 		
 		
 		
//		List<Dish> sd = new ArrayList<Dish>();
//		sd.add(new Dish(1, "Dosa", 60.0, 10.0, "images/dosa.jfif", "SOUTHERN"));
// 		sd.add(new Dish(2, "Idli", 60.0, 10.0, "images/idli.jfif", "SOUTHERN"));
// 		sd.add(new Dish(3, "Uttapam", 80.0, 10.0, "images/Oothappam.jfif", "SOUTHERN"));
	
		
		//Remains
//		sd.add(new Dish(3, "Masala Dosa", 75.0, 4.0,
//				"https://i.ndtvimg.com/i/2017-08/masala-dosa_620x330_81504097859.jpg", "SOUTHERN"));
 		

//		List<Dish> bv = new ArrayList<Dish>();
//		bv.add(new Dish(1, "Fruit Juice", 40.0, 5.0, "images/drinks.jpg", "BEVERAGES"));
// 		bv.add(new Dish(1, "ThumsUp", 40.0, 5.0, "images/ThumsUp.jpg", "BEVERAGES"));
 		
 		
 		
 		
 
 	
		DishJdbcDAO dao = new DishJdbcDAO();
		
		for (Dish dish : nd) {
			dao.addDish(dish);
			System.out.println(dish.getName() + " added.\n" );
		}
		
		System.out.println("Done.");
	}

}
