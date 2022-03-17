import { Component, OnInit } from '@angular/core';
import { NgbModal, ModalDismissReasons } from '@ng-bootstrap/ng-bootstrap';
import { Router } from '@angular/router';
import { DishService } from '../dish.service';
import { HttpClient } from '@angular/common/http';
import { User } from '../user';
import { CustomerService } from '../customer.service';

@Component({
  selector: 'app-user-list',
  templateUrl: './user-list.component.html',
  styleUrls: ['./user-list.component.css']
})
export class UserListComponent implements OnInit {

  // constructor() { }
  users: User[]=[];
 
 

  
  closeResult: string="";
  
  constructor(private modalService: NgbModal,private router: Router , private dishService: DishService, private customerService: CustomerService,private http: HttpClient) {}
    
  open(content: any) {
    this.modalService.open(content, {centered: true,ariaLabelledBy: 'modal-basic-title'}).result.then((result) => {
      this.closeResult = `Closed with: ${result}`;
    }, (reason) => {
      this.closeResult = `Dismissed ${this.getDismissReason(reason)}`;
    });
  }
  
  private getDismissReason(reason: any): string {
    if (reason === ModalDismissReasons.ESC) {
      return 'by pressing ESC';
    } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
      return 'by clicking on a backdrop';
    } else {
      return  `with: ${reason}`;
    }
  }
 
 

  ngOnInit(): void {
 
  // this.users = [
      
  //   {
  //     "FIRSTNAME":"Ram",
  //     "LASTNAME":"Ram",
  //     "USERNAME":"Ram",
  //     "EMAILID":"Ram",
  //     "MOBILENUMBER":123456789,
  //     "ADDRESS":"Ram",
  //     "PASSWORD":"Ram",
  //     "GENDER":"Ram"
        
  //       }
        
        
  //   ];

this.getUsers();
  }
 
  private getUsers(){
  this.customerService.getUserList().subscribe(data => {
    this.users = data;

    console.log(data);
  })
  
  }

}
