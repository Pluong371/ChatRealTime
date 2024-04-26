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
    }

    onCreateWeb() {
        this.website_name = this.AddWebForm.get('website_name').value;
        this.url = this.AddWebForm.get('url').value;

        const groupData = {
            groups: [
                {allowGuest: 1},
                {allowGuest: 0}
            ]
        };
        console.log(groupData);
      groupData.groups.forEach((group) => {
        console.log(group)
          this.http
              .post('http://localhost:8080/api/group/create', group)
            .subscribe((groupResponse: any) => {
                console.log(groupResponse)
                  console.log(groupResponse);
                  let group;
                  let group_id;
                  this.allow_guest = this.AddWebForm.get('allowGuest').value
                      ? 1
                      : 0;
                  if (Array.isArray(groupResponse)) {
                      group = groupResponse.filter(
                          (g) => g.allowGuest === this.allow_guest
                      );
                      group_id = groupResponse
                          ? group.groupId
                          : undefined;
                  }
                  const webData = {
                      websiteName: this.website_name,
                      allowGuest: this.allow_guest,
                      groupId: group_id
                  };
                  this.http
                      .post('http://localhost:8080/api/web/create', webData)
                      .subscribe((webResponse: any) => {
                          console.log(webResponse);
                      });
              });
      });
    }
}
