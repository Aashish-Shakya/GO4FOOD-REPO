import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Bill } from './bill';

@Injectable({
  providedIn: 'root'
})
export class BillService {

  // constructor() { }
//  

 

  private baseURL = "http://localhost:8090/admin/bill/all";



  constructor(private httpClient: HttpClient) { }



  getBillList(): Observable<any[]>{

    console.log(this.httpClient.get<any[]>(`${this.baseURL}`))

    return this.httpClient.get<any[]>(`${this.baseURL}`);

   

  }



}