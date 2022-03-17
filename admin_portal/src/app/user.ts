export class User {
 
        firstname: string;
        lastname: string;
        username: string ;
        emailid: string;
        mobilenumber: number;
        address: string;
        password: string;
        gender: string;
       
    constructor(firstname:string,lastname:string,username:string,emailid:string,mobilenumber:number,address:string, password: string, gender: string){
        this.firstname=firstname;
        this.lastname=lastname;
        this.username=username;
        this.emailid=emailid;
        this.mobilenumber=mobilenumber;
        this.address=address;
        this.password = password;
        this.gender = gender;
    }
     
     
}
