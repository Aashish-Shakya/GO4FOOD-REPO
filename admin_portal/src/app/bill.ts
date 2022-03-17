import { Order } from './order';
export class Bill {
 
    billNo:number =0;
    username:string="";
    totalAmount:number=0;
    address:string="";
    transactionId:string="";
    status:string="";
    dateTime:string="";
    orderList: Order[] =[];

	constructor(billNo:number,username:string,totalAmount:number, address:string,transactionId:string, status:string, dateTime:string,orderList: Order[]){
        this.billNo =billNo;
        this.username =username;
        this.totalAmount =totalAmount;
        this.address =address;
        this.transactionId =transactionId;
        this.status =status;
        this.dateTime =dateTime;
        this.orderList =orderList;

    // private List<Order> ordersList = new ArrayList<>();
    // private Integer billNo;
	// private String username;
	// private Double totalAmount;
	// private String address;
	// private String transactionId;
	// private String status;
	// private String dateTime;


        }
}