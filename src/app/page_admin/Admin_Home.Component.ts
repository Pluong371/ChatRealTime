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
    AddGroupForm: FormGroup;
    website_name: string;
    employee_id: string;
    allow_guest: number;
    group_name: string;
    url: string;
    groups = [];
    selectedGroup = null;
    group: any[] = [];
    selectedGroupId: string;
    constructor(
        private http: HttpClient,
        private formBuilder: FormBuilder
    ) {}
    ngOnInit() {
        this.AddWebForm = this.formBuilder.group({
            website_name: ['', Validators.required],
            url: ['', Validators.required]
        });
        this.AddGroupForm = this.formBuilder.group({
            group_name: ['', Validators.required],
            allowGuest: [false]
        });
        this.group = [];
        this.getGroup();
    }
    onCreateGroup() {
        const groupName = this.AddGroupForm.get('group_name').value;
        const allowGuest = this.AddGroupForm.get('allowGuest').value;

        let allow_guest = allowGuest ? 1 : 0;
        const groupData = {
            groupName: groupName,
            employeeId: '6dc6e559-54fe-4f27-9b7a-d34a828cc6e1',
            allowGuest: allow_guest
        };
        console.log(groupData);
        this.http
            .post('http://localhost:8080/api/group/create', groupData)
            .subscribe((groupResponse: any) => {
                console.log(groupResponse);
            });
    }
    updateSelectedGroup(groupId: string) {
        console.log(groupId);
        console.log(this.selectedGroup)
        this.selectedGroup = this.groups.find(
            (group) => group.groupId === groupId
        );
    }
    onCreateWeb() {
        this.website_name = this.AddWebForm.get('website_name').value;
        this.url = this.AddWebForm.get('url').value;
        console.log(this.selectedGroup);
        const webData = {
            websiteName: this.website_name,

            groupId: '223e4571-6a04-430a-8007-464575416ea1', 
            // groupId: this.selectedGroup.groupId,
        };
        this.http
            .post('http://localhost:8080/api/web/create', webData)
            .subscribe((webResponse: any) => {
                console.log(webResponse);
            });
    }
    getGroup() {
        this.http
            .get('http://localhost:8080/api/group/getall')
            .subscribe((groupResponse: any) => {
                this.groups = groupResponse;
                console.log(this.groups);
            });
    }
}
