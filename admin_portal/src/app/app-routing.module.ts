import { NgModule, Component } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DishListComponent } from './dish-list/dish-list.component';
import { AdminHomeComponent } from './admin-home/admin-home.component';
import { UserListComponent } from './user-list/user-list.component';
import { MenuComponent } from './menu/menu.component';
import { OrderListComponent } from './order-list/order-list.component';

const routes: Routes = [
  { path: 'dish' , component:DishListComponent},
  { path: 'admin' , component: AdminHomeComponent},
  { path: 'user' , component: UserListComponent},
   { path: 'order' , component: OrderListComponent},
  { path: '' , component: AdminHomeComponent}
  // { path: '', redirectTo:'/admin-home-component', pathMatch: 'full'}
  
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
export const routingComponents = [DishListComponent]