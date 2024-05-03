import {HttpClient, HttpParams} from '@angular/common/http';
import {Injectable, OnInit} from '@angular/core';
import {StompRService} from '@stomp/ng2-stompjs';
import {Message} from '@stomp/stompjs';
import { log } from 'console';
import {BehaviorSubject, Observable} from 'rxjs';
import {catchError, map} from 'rxjs/operators';

@Injectable({
    providedIn: 'root'
})
export class ChatService implements OnInit {
    private chatBox = '17500ab4-bfac-472b-acad-10da130fd17d';
    private userAccountId_static = '6dc6e559-54fe-4f27-9b7a-d34a828cc6e1';
    private changeMessage = new BehaviorSubject<Message>(null);

    messages: Observable<Message> = this.changeMessage.asObservable();
    selectedUser: any = {};
    constructor(
        private stompService: StompRService,
        private http: HttpClient
    ) {
        this.stompService.config = {
            url: 'ws://localhost:8080/chat',
            headers: {},
            heartbeat_in: 0,
            heartbeat_out: 20000,
            reconnect_delay: 5000,
            debug: true
        };
        this.stompService.initAndConnect();
        this.subscribeToMessages(true);
        this.subscribeToMessages(false);
        
    }
    ngOnInit() {
        this.getMessageContent().subscribe((chatBoxId: string) => {
            this.chatBox = chatBoxId;
        });
    }

    selectUser(user: any) {
        this.selectedUser.chatBoxId = user.chatBoxId;
        console.log(user.customerId);
        this.selectedUser.employeeId = user.employeeId;
        console.log(this.selectedUser.employeeId);
    }
    subscribeToMessages(userType: boolean) {
       
        let topic = '';
        if (userType) {
            topic = `/topic/messages/${this.selectedUser.chatBoxId}`;
        } else {
            topic = `/topic/messages/${'this is employee chatbox id'}`;
        }
        this.stompService
            .subscribe(topic)
            .subscribe((message: Message) => {
                console.log(JSON.parse(message.body));
                this.changeMessage.next(
                    JSON.parse(message.body).messageContent
                );
            });
    }
    getMessageContent(): Observable<any> {
        const authentication = JSON.parse(
            localStorage.getItem('authentication')
        );
        const employeeId = authentication.employeeId;
        console.log(employeeId);
        return this.http
            .post<any>('http://localhost:8080/api/chatbox/employee/get', {
                employeeId
            })
            .pipe(
                map((response: any) => {
                    console.log('Get message content successfully!', response);
                    return response;
                }),

                catchError((error: any) => {
                    console.error('Get message content failed!', error);
                    throw error;
                })
            );
    }
    getMessages(websiteName: string): Observable<any> {
        console.log(this.selectedUser.employeeId);
        let employeeId = this.selectedUser.employeeId;
        console.log(employeeId);
        const params = new HttpParams()
            .set('website_name', websiteName)
            .set('employee_id', employeeId);
            this.subscribeToMessages(true);
        

        return this.http.get('http://localhost:8080/api/chatbox/employee/get', {
            params
        });
    }

    sendMessageEmployee(messageContent: string, messageType: number, senderId: string) {
        if (messageContent && this.stompService.connected()) {
            console.log('Sending message:', this.selectedUser);
            const chatMessage = {
                chatBoxId: this.selectedUser.chatBoxId,
               senderId: senderId,
                messageContent: messageContent.trim(),
                messageType: messageType,
                status: 0
            };
            console.log(chatMessage);
            this.stompService.publish(
                `/app/chat/${this.selectedUser.chatBoxId}`,
                JSON.stringify(chatMessage)
            );

        }
    }
     sendMessageCustomer(messageContent: string, messageType: number, senderId: string) {
        if (messageContent && this.stompService.connected()) {
           
            const chatMessage = {
                // chatBoxId: this.selectedUser.chatBoxId,
               senderId: senderId,
                messageContent: messageContent.trim(),
                messageType: messageType,
                status: 0
            };
            console.log(chatMessage);
            this.stompService.publish(
                `/app/chat/${"this is employee chatbox id"}`,
                JSON.stringify(chatMessage)
            );

        }
    }
}
