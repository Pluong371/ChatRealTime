import {NgModule} from '@angular/core';
import {Routes, RouterModule} from '@angular/router';
import {MainComponent} from '@modules/main/main.component';
import { employee_loginComponent} from '@modules/employee_login/employee_login.component';
import {AuthGuard} from '@guards/auth.guard';
import {NonAuthGuard} from '@guards/non-auth.guard';
import path from 'path';
import {HomeComponent} from './page/home/home.component';
import {RegisterComponent} from '@modules/Resgister/Register.component';
import {ForgotPasswordComponent} from '@modules/Forgot_Password/Forgot_Password.component';
import {Message_Employee} from './page/Message_Employee/Message_Employee.component';
import {Test} from './page/page_test/home.component';
import {Box_ChatComponent} from './page/box_chat/Box_Chat.Component';
import { Admin_HomeComponent } from './page_admin/Admin_Home.Component';

const routes: Routes = [
    {
        path: '',
        component: MainComponent,
        canActivate: [AuthGuard],
        canActivateChild: [AuthGuard],
        children: [
            {
                path: 'employee_home',
                component: HomeComponent,
                canActivate: [AuthGuard]
            },
            {
                path: 'message_employee',
                component: Message_Employee,
                canActivate: [AuthGuard]
            },
            {
                path: 'admin_home',
                component: Admin_HomeComponent,
                canActivate: [AuthGuard]
            },
        ]
    },

    {
        path: 'register',
        component: RegisterComponent,
        canActivate: [NonAuthGuard]
    },
    {
        path: 'forgot-password',
        component: ForgotPasswordComponent,
        canActivate: [NonAuthGuard]
    },
    {
        path: 'employee_login',
        component: employee_loginComponent,
        canActivate: [NonAuthGuard]
    },
    {
        path: 'test',
        component: Test,
        canActivate: [NonAuthGuard]
    },
    {
        path: 'box-chat',
        component: Box_ChatComponent
    },

    {path: '**', redirectTo: ''}
];

@NgModule({
    imports: [RouterModule.forRoot(routes, {})],
    exports: [RouterModule]
})
export class AppRoutingModule {}
