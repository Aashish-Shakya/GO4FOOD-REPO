import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { NgbModule } from '@ng-bootstrap/ng-bootstrap';

import { AppRoutingModule , routingComponents} from './app-routing.module';
import { AppComponent } from './app.component';
 
import { BootstrapModalsComponent } from './bootstrap-modals/bootstrap-modals.component';
import { AdminHomeComponent } from './admin-home/admin-home.component';

import { HttpClientModule } from "@angular/common/http";
import { UserListComponent } from './user-list/user-list.component';
import { MenuComponent } from './menu/menu.component';
import { FormsModule } from '@angular/forms';
import { OrderListComponent } from './order-list/order-list.component';

@NgModule({
  declarations: [
    AppComponent,
    routingComponents,
    BootstrapModalsComponent,
    AdminHomeComponent,
    UserListComponent,
    MenuComponent,
    OrderListComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NgbModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
