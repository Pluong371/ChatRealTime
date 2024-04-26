
import {Component, OnInit} from '@angular/core';
import {Router} from '@angular/router';

@Component({
    selector: 'app-menu',
    templateUrl: './Menu.component.html',
    styleUrls: ['./Menu.component.scss']
})
export class MenuCompontent implements OnInit {
    constructor(private router: Router) {}
    roleId: String;
    name:string;

    ngOnInit(): void {
        const auth = JSON.parse(localStorage.getItem('authentication'));
        console.log(auth);
        this.roleId = auth.roleEntityDtoList[0].roleId;
        this.name = auth.employeeName;
    }
    logout() {
        localStorage.removeItem('authentication');
        this.router.navigate(['/employee_login']);
    }
}
