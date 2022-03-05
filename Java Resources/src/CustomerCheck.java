import DAO.CustomerDAO;
import entity.Customer;

public class CustomerCheck {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		CustomerDAO dao = new CustomerDAO();
		
		Customer cust = dao.getCustomerByUsername("satyajeet");
		System.out.println(cust.getFIRSTNAME());
	}

}
