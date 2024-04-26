import {BrowserModule} from '@angular/platform-browser';
import {NgModule} from '@angular/core';
import {HttpClientModule} from '@angular/common/http';
import {AppRoutingModule} from '@/app-routing.module';
import {AppComponent} from './app.component';
import {MainComponent} from '@modules/main/main.component';
import {employee_loginComponent} from './modules/employee_login/employee_login.component';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import {AngularFireModule} from '@angular/fire/compat';
import {AngularFireAuthModule} from '@angular/fire/compat/auth';
import {ToastrModule} from 'ngx-toastr';

import {CommonModule, registerLocaleData} from '@angular/common';
import localeEn from '@angular/common/locales/en';

import {StoreModule} from '@ngrx/store';
import {authReducer} from './store/auth/reducer';
import {uiReducer} from './store/ui/reducer';
import {ProfabricComponentsModule} from '@profabric/angular-components';
// import {SidebarSearchComponent} from './components/sidebar-search/sidebar-search.component';
import {NgxGoogleAnalyticsModule} from 'ngx-google-analytics';
import {environment} from 'environments/environment';
import {NgxPaginationModule} from 'ngx-pagination';
import {RegisterComponent} from '@modules/Resgister/Register.component';
import {ForgotPasswordComponent} from '@modules/Forgot_Password/Forgot_Password.component';
import {MenuCompontent} from './page/Menu/Menu.component';
import {Message_Employee} from './page/Message_Employee/Message_Employee.component';
import {Box_ChatComponent} from './page/box_chat/Box_Chat.Component';
import { StompRService } from '@stomp/ng2-stompjs';
import { Admin_HomeComponent } from './page_admin/Admin_Home.Component';

registerLocaleData(localeEn, 'en-EN');

const firebaseConfig = {
    apiKey: 'AIzaSyAA1JzRNu6HWCHHJrXfvgSVxfBbPOsWXlY',
    authDomain: 'my-project-f53a2.firebaseapp.com',
    projectId: 'my-project-f53a2',
    storageBucket: 'my-project-f53a2.appspot.com',
    messagingSenderId: '890054659261',
    appId: '1:890054659261:web:11dc319cda1267be32bbd4'
};
@NgModule({
    declarations: [
        AppComponent,
        MainComponent,
        RegisterComponent,
        ForgotPasswordComponent,
        MenuCompontent,
        Message_Employee,
        Box_ChatComponent,
        employee_loginComponent,
        Admin_HomeComponent
    ],
    imports: [
        ProfabricComponentsModule,
        FormsModule,

        ReactiveFormsModule,
        CommonModule,
        BrowserModule,
        StoreModule.forRoot({auth: authReducer, ui: uiReducer}),
        HttpClientModule,
        AppRoutingModule,
        ReactiveFormsModule,
        BrowserAnimationsModule,
        CommonModule,
        NgxPaginationModule,
        AngularFireModule.initializeApp(firebaseConfig),
        AngularFireAuthModule,
        ToastrModule.forRoot({
            timeOut: 3000,
            positionClass: 'toast-top-right',
            preventDuplicates: true
        }),
        NgxGoogleAnalyticsModule.forRoot(environment.GA_ID)
    ],
    providers: [StompRService],
    bootstrap: [AppComponent]
})
export class AppModule {}
