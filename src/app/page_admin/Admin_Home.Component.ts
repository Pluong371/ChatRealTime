import {group} from '@angular/animations';
import {HttpClient} from '@angular/common/http';
import {Component} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {log} from 'console';

@Component({
    selector: 'admin_home',
    templateUrl: './Admin_Home.component.html',
    styleUrls: ['./Admin_Home.component.scss']
})
export class Admin_HomeComponent {
    AddWebForm: FormGroup;
    website_name: string;
    url: string;
    allow_guest: number;
    group: any[]=[]
    constructor(
        private http: HttpClient,
        private formBuilder: FormBuilder
    ) {}
    ngOnInit() {
        this.AddWebForm = this.formBuilder.group({
            website_name: ['', Validators.required],
            url: ['', Validators.required],
            allowGuest: [false]
        });
        this.group = [];
    }

    onCreateWeb() {
        this.website_name = this.AddWebForm.get('website_name').value;
        this.url = this.AddWebForm.get('url').value;
        this.allow_guest = this.AddWebForm.get('allowGuest').value;
        let groupId = this.allow_guest
            ? '223e4571-6a04-430a-8007-464575416ea1'
            : 'fb3ec2a4-a9bf-4564-8790-d2eba9500720';
        let allowGuest = this.allow_guest ? 1 : 0;
        const webData = {
            websiteName: this.website_name,
            allowGuest: allowGuest,
            groupId: groupId,
        };
        this.http
            .post('http://localhost:8080/api/web/create', webData)
            .subscribe((webResponse: any) => {
                console.log(webResponse);
            });
    }
}
