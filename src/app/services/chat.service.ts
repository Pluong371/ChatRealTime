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
export class ChatService implements OnInit{
    private chatBox = '17500ab4-bfac-472b-acad-10da130fd17d';
    private userAccountId_static = 'e1edc6ed-af33-4a72-acfc-9219ce778d46';
    private changeMessage = new BehaviorSubject<Message>(null);

    messages: Observable<Message> = this.changeMessage.asObservable();
    selectedUser: any;
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
        this.subscribeToMessages();
    }
    ngOnInit() {
        this.getMessageContent().subscribe((chatBoxId: string) => {
            this.chatBox = chatBoxId;
        });
    }
    selectUser(user: any) {
        this.selectedUser = user;
    }
    subscribeToMessages() {
        this.stompService
            .subscribe(`/topic/messages/${this.chatBox}`)
            .subscribe((message: Message) => {
                console.log(JSON.parse(message.body));
                this.changeMessage.next(
                    JSON.parse(message.body).messageContent
                );
            });
    }
    // getMessages(websiteName: string, customerId: string): Observable<any> {
    //     return this.http.get(
    //         `http://localhost:8080/api/message/get?websiteName=${websiteName}&customerId=${customerId}`
    //     );
    // }
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
                }),

                catchError((error: any) => {
                    console.error('Get message content failed!', error);
                    throw error;
                })
            );
    }

    sendMessage(messageContent: string) {
        if (messageContent && this.stompService.connected()) {
            const chatMessage = {
                chatBoxId: this.chatBox,
                senderId: this.userAccountId_static,
                messageContent: messageContent.trim(),
                messageType: 0,
                status: 0
            };
            this.stompService.publish(
                `/app/chat/${this.chatBox}`,
                JSON.stringify(chatMessage)
            );
        }
    }
}
