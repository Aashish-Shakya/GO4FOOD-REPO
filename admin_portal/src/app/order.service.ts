import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Order } from './order';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class OrderService {

  // constructor() { }
  // private baseURL = "http://localhost:8090/admin/bill/all";

  // constructor(private httpClient: HttpClient) { }

  // getOrderList(): Observable<Order[]>{

  //   return this.httpClient.get<Order[]>(`${this.baseURL}`);
  // }

}
