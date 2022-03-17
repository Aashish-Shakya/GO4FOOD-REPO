import { Component } from '@angular/core';
import { Router } from '@angular/router'; 
import {NgbModal, ModalDismissReasons} from '@ng-bootstrap/ng-bootstrap';
  
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'appBootstrap';
  
  closeResult: string="";
  
  constructor(private modalService: NgbModal,private router: Router) {}
    
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
 
 
 
   buttonTitle:string = "Hide";
   visible:boolean = true;
   showhideUtility(){
     this.visible = this.visible?false:true;
     this.buttonTitle = this.visible?"Hide":"Show";
   }
  


goToDish(){
  this.router.navigate(['/dish'])
}

}