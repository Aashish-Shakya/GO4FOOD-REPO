 

import { Component, OnInit } from '@angular/core';

import { BillService } from '../bill.service';



@Component({

  selector: 'app-order-list',

  templateUrl: './order-list.component.html',

  styleUrls: ['./order-list.component.css']

})

export class OrderListComponent implements OnInit {

  orders: any[] = [];




  constructor(private billService: BillService) { }



  ngOnInit(): void {



    this.getOrders();



  }

  private getOrders() {



    this.billService.getBillList().subscribe(data => {

      this.orders = data;

      console.log(data);

    })

  }



}

function subscribe(arg0: (data: any) => void) {

  throw new Error('Function not implemented.');

}


