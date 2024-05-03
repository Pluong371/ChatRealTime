import {Employee} from './../../models/LoginComponent.model';
import {FormGroup} from '@angular/forms';
import {ChatService} from '@services/chat.service';
import {ChangeDetectorRef, Component, OnInit} from '@angular/core';
import {AngularFireAuth} from '@angular/fire/compat/auth';
import {log} from 'console';
import {Observable, catchError, map, tap} from 'rxjs';
import {HttpClient} from '@angular/common/http';

@Component({
    selector: 'message_employee',
    templateUrl: './Message_Employee.component.html',
    styleUrls: ['./Message_Employee.component.scss']
})
export class Message_Employee implements OnInit {
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
        this.ChatService.messages.subscribe((message) => {
            if (message) {
                this.messages.push(message);
                this.changeDetector.detectChanges();
            }
        });
        this.ChatService.getMessageContent().subscribe({
            next: (res: any) => {
                console.log(res);
                this.users = res;
                console.log(this.users);
            }
        });
    }

    onUserClick(user: any) {
        this.currentUser = user;
        this.ChatService.selectUser(user);
        console.log('Selected user:', user);
        let websiteName = window.location.host;
        this.ChatService.getMessages(websiteName).subscribe({
            next: (response: any) => {
                console.log(response);
                this.messageData = response.find((data: any) => data.chatBoxId === user.chatBoxId).messageList;
                console.log(this.messageData)
            }
        });
    }

    sendMessage() {
        console.log('Sending message:', this.messageContent);
        this.messages.push();
        console.log(this.currentUser)
      
        this.ChatService.sendMessageEmployee(this.messageContent, 1, this.currentUser.employeeId);
         this.changeDetector.detectChanges();
        this.messageContent = '';
    }

    logout() {
        this.afAuth.signOut();
        this.isLoggedIn = false;
    }
}
