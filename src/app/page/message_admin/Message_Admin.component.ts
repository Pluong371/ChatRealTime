import {Employee} from '../../models/LoginComponent.model';
import {FormGroup} from '@angular/forms';
import {ChatService} from '@services/chat.service';
import {ChangeDetectorRef, Component, OnInit} from '@angular/core';
import {AngularFireAuth} from '@angular/fire/compat/auth';
import {log} from 'console';
import {Observable, catchError, map, tap} from 'rxjs';
import {HttpClient, HttpParams} from '@angular/common/http';

@Component({
    selector: 'message_admin',
    templateUrl: './Message_Admin.component.html',
    styleUrls: ['./Message_Admin.component.scss']
})
export class Message_Admin implements OnInit {
    response: any;
    websiteName: any;
    form_login_customer: FormGroup;
    public showChatBox = false;
    isLoggedIn = false;
    customerName = '';
    apiResult = null;
    allowGuest = false;
    messageContent: string;
    messages: any[] = [];
    users: any = [];
    currentUser: any = {};
    messageData: any[] = [];

    constructor(
        private afAuth: AngularFireAuth,
        private ChatService: ChatService,
        private changeDetector: ChangeDetectorRef,
        private http: HttpClient
    ) {
        this.messages = [];
    }

    ngOnInit() {
        this.ChatService.getMessageContent().subscribe({
            next: (res: any) => {
                console.log(res);
                this.users = res;
                console.log(this.users);
            }
        });
        const auth = JSON.parse(localStorage.getItem('authentication'));
        this.getWebsite(auth.employeeId).subscribe({});
    }

    onUserClick(user: any) {
        this.currentUser = user;
        this.ChatService.selectUser(user);
        console.log('Selected user:', user);
        let websiteName = window.location.host;

        this.ChatService.getMessages(websiteName).subscribe({
            next: (response: any) => {
                console.log(response);
                this.messageData = response
                    .find((data: any) => data.chatBoxId === user.chatBoxId)
                    .messageList.sort((a, b) => a.sendTime - b.sendTime);
                console.log(this.messageData);
            }
        });
    }
    getWebsite(employeeId: string) {
        const params = new HttpParams().set('employee_id', employeeId);
        return this.http.get('/get-website-list', {params});
    }

    logout() {
        this.afAuth.signOut();
        this.isLoggedIn = false;
    }
}
