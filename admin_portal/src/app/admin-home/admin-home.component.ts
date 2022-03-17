import { Component, OnInit } from '@angular/core';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Router } from '@angular/router';
import { Dish } from '../dish';
import { HttpClient } from '@angular/common/http';
import { DishService } from '../dish.service';
import { Observable } from 'rxjs';
import { isInteger } from '@ng-bootstrap/ng-bootstrap/util/util';

@Component({
  selector: 'app-admin-home',
  templateUrl: './admin-home.component.html',
  styleUrls: ['./admin-home.component.css']
})
export class AdminHomeComponent implements OnInit {
  [x: string]: any;

  dishes: Dish[] = [];


  ngOnInit(): void {
    this.getNoOfDish();
    this.getNoOfUsers();
    this.getNoOfBills();
  }

  //Dish Count
  getDishCount(): Observable<number> {

    // console.log(`${this.baseURL}/dc`)
    return this.http.get<number>(`${this.baseURL}/dc`);
  }

  countDish: number = 0;
  getNoOfDish() {
    this.getDishCount().subscribe((data: number) => {
      this.countDish = data;
      console.log(this.countDish);
    })
  }


  //User count

  countURL: string = "http://localhost:8090/admin/users";
  getUserCount(): Observable<number> {

    return this.http.get<number>(`${this.countURL}/cc`);
  }

  countUser: number = 0;
  getNoOfUsers() {
    this.getUserCount().subscribe((data: number) => {
      this.countUser = data;
      console.log(this.countUser);
    })
  }



  //  Order Count

  countBillURL: string = "http://localhost:8090/admin/bill/";
  getBillCount(): Observable<number> {

    return this.http.get<number>(`${this.countBillURL}`);
  }

  countBill: number = 0;
  getNoOfBills() {
    this.getBillCount().subscribe((data: number) => {
      this.countBill = data;
      console.log(this.countBill);
    })
  }



  onSubmit() {
    // console.log(this.dish);
  }

  closeResult: string = "";

  constructor(private modalService: NgbModal, private router: Router, private http: HttpClient) { }

  open(content: any) {
    this.modalService.open(content, { centered: true, ariaLabelledBy: 'modal-basic-title' }).result.then((result) => {
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
      return `with: ${reason}`;
    }
  }



  buttonTitle: string = "Hide";
  visible: boolean = true;
  showhideUtility() {
    this.visible = this.visible ? false : true;
    this.buttonTitle = this.visible ? "Hide" : "Show";
  }



  goToDish() {
    this.router.navigate(['/dish'])
  }



  dish: Dish = new Dish(0, "", 0, 0, "", "", "Y");
  baseURL: string = "http://localhost:8090/admin/dish";
  add() {
    this.dish.category = (<HTMLInputElement>document.getElementById("addCat")).value;
    this.dish.name = (<HTMLInputElement>document.getElementById("addTitle")).value;
    this.dish.image_url = (<HTMLInputElement>document.getElementById("addImg")).value;
    this.dish.price = Number((<HTMLInputElement>document.getElementById("addPrice")).value);
    this.dish.discount = Number((<HTMLInputElement>document.getElementById("addDP")).value);
    console.log(JSON.stringify(this.dish))

  }

  save() {
    this.http.post(`${this.baseURL}/add`, JSON.stringify(this.dish), { 'headers': { 'content-type': 'application/json' } }).subscribe(res => console.log("Done"));
    this.router.navigate(['/dish'])
      .then(() => {
        window.location.reload();
      });

    console.log(this.dish.category);
  }

  data: any = null;

  validate() {


    var error = 0;
    //validate Price 
    if (Number((<HTMLInputElement>document.getElementById("addPrice")).value) < 1 || isNaN(Number((<HTMLInputElement>document.getElementById("addPrice")).value))) {

      (<HTMLInputElement>document.getElementById("addPrice")).classList.add("wrong")

      error++;
    } else {
      (<HTMLInputElement>document.getElementById("addPrice")).classList.remove("wrong")

      error--;
    }
    //Validate Discounted Price
    if (Number((<HTMLInputElement>document.getElementById("addDP")).value) >= Number(Number((<HTMLInputElement>document.getElementById("addPrice")).value) || isNaN(Number((<HTMLInputElement>document.getElementById("addDP")).value)))) {

      (<HTMLInputElement>document.getElementById("addDP")).classList.add("wrong")

      error++;
    } else {
      (<HTMLInputElement>document.getElementById("addDP")).classList.remove("wrong")

      error--;
    }
    if (Number((<HTMLInputElement>document.getElementById("addDP")).value) >= Number((<HTMLInputElement>document.getElementById("addPrice")).value) && !isNaN(Number((<HTMLInputElement>document.getElementById("addDP")))) || (<HTMLInputElement>document.getElementById("addImg")).value == "" || (<HTMLInputElement>document.getElementById("addTitle")).value == "" || (<HTMLInputElement>document.getElementById("addCat")).value == "" || (<HTMLInputElement>document.getElementById("addPrice")).value == "" || Number((<HTMLInputElement>document.getElementById("addPrice")).value) < 1 || isNaN(Number((<HTMLInputElement>document.getElementById("addPrice")).value) ) || error>0 ) {


      (<HTMLInputElement>document.getElementById("previewBtn")).disabled = true;

    } else {
      (<HTMLInputElement>document.getElementById("previewBtn")).disabled = false;
    }
  }
}
