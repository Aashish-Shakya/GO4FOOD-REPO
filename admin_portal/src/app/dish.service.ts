import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Dish } from './dish';

@Injectable({
  providedIn: 'root'
})
export class DishService {

  private baseURL = "http://localhost:8090/admin/dish";

  constructor(private httpClient: HttpClient) { }

  getDishList(): Observable<Dish[]>{

    return this.httpClient.get<Dish[]>(`${this.baseURL}`);
  }


  
  // deleteDish(name:string): Observable<Object>{
  //   return this.httpClient.delete(`${this.baseURL}/${name}`);
  //   }
}
