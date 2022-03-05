import java.util.List;

import DAO.BillDAO;
import entity.Bill;
import entity.Order;

public class YourOrdersCheck {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BillDAO dao = new BillDAO();
		
		List<Bill> al = dao.getBillByUsername("aashish");
		
		if (al.isEmpty()) {
			System.out.println("This user has no orders yet.");
		} else {
			for (Bill bill: al) {
				System.out.println("Bill No : " + bill.getBillNo());
				System.out.println("Username : " + bill.getUsername());
				System.out.println("Total Amount : " + bill.getTotalAmount());
				System.out.println("Address : " + bill.getAddress());
				System.out.println("Transaction id : " + bill.getTransactionId());
				System.out.println("Status : " + bill.getStatus());
				System.out.println("Orders :");
				if (bill.getOrdersList().isEmpty()) {
					System.out.println("Tranaction successfull but delay in order place.");
				} else {
					for (Order order : bill.getOrdersList()) {
						System.out.println("Order Id : " + order.getId());
						System.out.println("Dish Name : " + order.getDish().getName());
						System.out.println("Quantity : " + order.getQuantity());
						System.out.println("Order placed at " + order.getDateTime());
					}
				}
			}
		}
	}

}
