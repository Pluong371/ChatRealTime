import {FormGroup} from '@angular/forms';
import {ChatService} from '@services/chat.service';
import {ChangeDetectorRef, Component, OnInit} from '@angular/core';
import {AngularFireAuth} from '@angular/fire/compat/auth';
import { log } from 'console';

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
    messages: any[]=[];

    constructor(
        private afAuth: AngularFireAuth,
        private ChatService: ChatService,
        private changeDetector: ChangeDetectorRef
    ) {
        this.messages = [];
    }

    ngOnInit() {
        console.log('box-chat');
        this.ChatService.messages.subscribe((message) => {
            if (message) {
                this.messages.push(message);
                this.changeDetector.detectChanges();
            }
        });
    }

    sendMessage(messageContent: string) {
        console.log('Sending message:',messageContent);
        this.messages.push();

        console.log(this.messages);
        this.ChatService.sendMessage(messageContent);
        this.messageContent = '';

        
    }

    logout() {
        this.afAuth.signOut();
        this.isLoggedIn = false;
    }

    getMessageContent() {
        const websiteName = 'localhost:4200'; // replace with actual value
        const customerId = 'e1edc6ed-af33-4a72-acfc-9219ce778d46';
        this.ChatService.getMessages(customerId, websiteName);
    }
}
