import {Component, Injectable, OnInit} from '@angular/core';
import {FormGroup, FormBuilder, Validators} from '@angular/forms';
import {AppService} from '@services/app.service';

@Injectable({ providedIn: 'root' })
@Component({
    selector: 'employee-login',
    templateUrl: './employee_login.component.html',
    styleUrls: ['./employee_login.component.scss']
})
export class employee_loginComponent implements OnInit {
    public loginForm: FormGroup;
    public isAuthLoading = false;
    public isGoogleLoading = false;
    public isFacebookLoading = false;
    public submitted = false;

    constructor(
        private appService: AppService,
        private formBuilder: FormBuilder
    ) { }

    ngOnInit() {
        this.loginForm = this.formBuilder.group({
            username: ['', Validators.required],
            password: ['', Validators.required]
        });
    }
    async loginByAuth() {
        this.submitted = true;
        const username = this.loginForm.get('username').value;
        const password = this.loginForm.get('password').value;
        console.log(this.loginForm);

        if (this.loginForm.status === 'VALID') {
            this.isAuthLoading = true;
            await this.appService.authLogin(username, password).toPromise();
            this.isAuthLoading = false;
        } else {
            return;
        }
        console.log(this.isAuthLoading);
    }
}
