import {Employee} from './../../models/LoginComponent.model';
import {FormGroup} from '@angular/forms';
import {ChatService} from '@services/chat.service';
import {
    AfterContentChecked,
    AfterViewChecked,
    ChangeDetectorRef,
    Component,
    ElementRef,
    OnInit,
    ViewChild
} from '@angular/core';
import {AngularFireAuth} from '@angular/fire/compat/auth';
import {log} from 'console';
import {Observable, catchError, map, tap} from 'rxjs';
import {HttpClient, HttpParams} from '@angular/common/http';

@Component({
    selector: 'message_admin',
    templateUrl: './Message_Admin.component.html',
    styleUrls: ['./Message_Admin.component.scss']
})
export class Message_Admin implements OnInit, AfterViewChecked {
    @ViewChild('scrollMe') private myScrollContainer: ElementRef;
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
    messageCur: any[] = [];
    messageIdList = [];
    websites: any[] = [];
    websiteSelected = false;
    ngAfterViewChecked(): void {
        this.scrollToBottom();
    }
    scrollToBottom(): void {
        try {
            this.myScrollContainer.nativeElement.scrollTop =
                this.myScrollContainer.nativeElement.scrollHeight;
        } catch (err) {
            console.log(err);
        }
    }
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

        this.getWebsite().subscribe((websites: any[]) => {
            this.websites = websites;
        });
    }
    getLastMessage() {
        const chatBoxId = this.currentUser.chatBoxId;
        console.log(this.messageData);

        const messagesLas = this.messageData.filter(
            (data) => data.chatBoxId === chatBoxId
        );

        this.users.map((user: any) => {
            if (user.chatBoxId === chatBoxId) {
                console.log(user.chatBoxId);
                user.lastMessage = messagesLas;
            }
        });

        console.log(messagesLas);
        if (messagesLas.length === 0) {
            return '';
        }
        const lastMessage = messagesLas.reduce((prev, current) =>
            prev.sendTime > current.sendTime ? prev : current
        );
        console.log(lastMessage.messageContent);
        return lastMessage.messageContent;
    }
    onUserClick(user: any) {
        this.currentUser = user;
        this.currentUser.chatBoxId = user.chatBoxId;
        this.updateMessages();
        this.ChatService.selectUser(user);
        console.log('Selected user:', user);
        let websiteName = this.websiteName;
        this.ChatService.getMessages(websiteName).subscribe({
            next: (response: any) => {
                console.log(response);
                this.messageData = response
                    .find((data: any) => data.chatBoxId === user.chatBoxId)
                    .messageList.sort((a, b) => a.sendTime - b.sendTime);
                console.log(this.messageData);
            }
        });
        this.getLastMessage();
    }
    onWebsiteChange(event) {
        this.websiteName = event.target.value;
        if (this.websiteName) {
                    this.websiteSelected = true;
            this.ChatService.getMessages(this.websiteName).subscribe(
                (users: any[]) => {
                    this.users = users;
                }
            );
        } else {
            this.users = [];
        }
    }
    updateMessages() {
        this.messageCur = this.messages.filter(
            (data) => data.chatBoxId === this.currentUser.chatBoxId
        );
        console.log(this.messageCur);
    }

    logout() {
        this.afAuth.signOut();
        this.isLoggedIn = false;
    }
    getWebsite() {
        return this.http.get(
            ' http://localhost:8080/api/web/admin/get-website-list'
        );
    }
}
