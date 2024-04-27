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
    users$: Observable<any>;
    selectedChatBox: any;
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
        this.ChatService.getMessageContent().subscribe((response) => {
            this.users$ = response;
        });
    }

    sendMessage(messageContent: string) {
        console.log('Sending message:', messageContent);
        this.messages.push();

        console.log(this.messages);
        this.ChatService.sendMessage(messageContent);
        this.messageContent = '';
    }

    selectChatBox(chatBox: any) {
        this.selectedChatBox = chatBox;
    }
    logout() {
        this.afAuth.signOut();
        this.isLoggedIn = false;
    }
}
