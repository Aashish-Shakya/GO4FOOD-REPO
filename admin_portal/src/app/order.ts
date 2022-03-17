import { Dish } from './dish';
export class Order {
 
id:number=0;
username:string="";
dish:Dish = new Dish(0, "", 0, 0, "", "", "Y") ;
quantity:number=0;
billNo:number=0;
transactionId:string="";
dateTime:string="";
 
constructor(id:number,username:string,dish:Dish,quantity:number,billNo:number,transactionId:string,dateTime:string){
this.billNo =billNo;
}


}
// private int id;
// private String username;
// private Dish dish;
// private int quantity;
// private int billNo;
// private String transactionId;
// private String dateTime;