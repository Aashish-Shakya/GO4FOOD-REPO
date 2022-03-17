import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { User } from './user';
import { Dish } from './dish';

@Injectable({
  providedIn: 'root'
})
export class CustomerService {

  // constructor() { }


  private baseURL = "http://localhost:8090/admin/users";

  constructor(private httpClient: HttpClient) { }

  getUserList(): Observable<User[]>{

    return this.httpClient.get<User[]>(`${this.baseURL}`);
  }

}
