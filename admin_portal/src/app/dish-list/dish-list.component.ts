import { Component, OnInit } from '@angular/core';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Dish } from '../dish';
import { Router } from '@angular/router';
import { DishService } from '../dish.service';
import { catchError, map, throwError, Observable } from 'rxjs';
import { HttpErrorResponse, HttpEvent, HttpHandler, HttpRequest, HttpResponse, HttpClient, HttpParams } from '@angular/common/http';

@Component({
  selector: 'app-dish-list',
  templateUrl: './dish-list.component.html',
  styleUrls: ['./dish-list.component.css']
})
export class DishListComponent implements OnInit {

  dishes: Dish[] = [];

  ngOnInit(): void {

    this.getDishes();

  }
  private getDishes() {

    this.dishService.getDishList().subscribe(data => {
      this.dishes = data;
      console.log(data);
    })
  }





  closeResult: string = "";

  constructor(private modalService: NgbModal, private router: Router, private dishService: DishService, private http: HttpClient) { }

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

  // d: Dish[];


  // p1= new Dish(12,"Pwb",120,20,"assets/images/team.png","200");

  // productArray:Array<Dish>=[this.p1];

  intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {

    const token = localStorage.getItem('token');

    if (token) {
      request = request.clone({
        setHeaders: {
          'Authorization': token
        }
      });
    }

    if (!request.headers.has('Content-Type')) {
      request = request.clone({
        setHeaders: {
          'content-type': 'application/json'
        }
      });
    }

    request = request.clone({
      headers: request.headers.set('Accept', 'application/json')
    });

    return next.handle(request).pipe(
      map((event: HttpEvent<any>) => {
        if (event instanceof HttpResponse) {
          console.log('event--->>>', event);
        }
        return event;
      }),
      catchError((error: HttpErrorResponse) => {
        if (error.status === 401) {
          if (error.error.success === false) {
            this.presentToast('Login failed');
          } else {
            console.log(' route this to right place');
            //   this.router.navigate(['auth/login']);
          }
        }
        if (error.status === 500) {
          if (error.error.success === false) {
            this.presentToast('Something went wrong, Please contact Administrator');
          } else {
            console.log(' route this to right place');
            //   this.router.navigate(['auth/login']);
          }
        }
        //431

        if (error.status === 431) {
          if (error.error.success === false) {
            this.presentToast('Something went wrong with the HttpRequest, Please contact Administrator');
          } else {
            console.log(' route this to right place');
            //   this.router.navigate(['auth/login']);
          }
        }

        // add all the other error codes here 
        return throwError(error);
      }));
  }
  presentToast(arg0: string) {
    throw new Error('Method not implemented.');
  }




  dishname: string = "";





  dd(name: string) {

    this.dishname = name;

    console.log(this.dishname);



  }



  baseURL: string = "http://localhost:8090/admin/dish";

  delete() {

    console.log("deleted called");

    let queryParams = new HttpParams();

    queryParams = queryParams.append("name", this.dishname);
    this.http.delete(`${this.baseURL}/delete?name=${this.dishname}`, { responseType: 'text' }).subscribe(res => console.log("Done"));

    

  }

  dish:Dish = new Dish(0, "", 0, 0, "", "", "Y") ;

  setDish(dish:Dish) {
    this.dish = dish;
    console.log(this.dish)
  }



  update() {
    this.dish.category = (<HTMLInputElement>document.getElementById("dishCat")).value;
    this.dish.name = (<HTMLInputElement>document.getElementById("dishTitle")).value;
    this.dish.image_url = (<HTMLInputElement>document.getElementById("dishImg")).value;
    this.dish.price = Number((<HTMLInputElement>document.getElementById("dishPrice")).value);
    this.dish.discount = Number((<HTMLInputElement>document.getElementById("dishDP")).value);

    console.log(JSON.stringify(this.dish))

    

    this.http.post(`${this.baseURL}/edit`, JSON.stringify(this.dish), {'headers':{ 'content-type': 'application/json'}}).subscribe(res => console.log("Done"));  
    
  }

  

  toggleVisibility(id:number) {
    this.http.post(`${this.baseURL}/toggle?id=${id}`, { responseType: 'text' }).subscribe(res => console.log("Done"));  
  }

  refresh() {
    this.router.navigate(['/dish'])
      .then(() => {
        window.location.reload();
      });
  }



  // deleteDish(name:string){}

  // }



}






