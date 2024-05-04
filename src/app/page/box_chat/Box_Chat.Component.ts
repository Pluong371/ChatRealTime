import {Message} from '@stomp/stompjs';
import {ChatService} from '@services/chat.service';
import {AfterViewChecked, ChangeDetectorRef, Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import {HttpClient, HttpParams} from '@angular/common/http';
import {ApiService} from '@services/api.service';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {AngularFireAuth} from '@angular/fire/compat/auth';
import firebase from 'firebase/compat/app';
import {log} from 'console';
import { After } from 'v8';

@Component({
    selector: 'box_chat',
    templateUrl: './Box_Chat.component.html',
    styleUrls: ['./Box_Chat.Component.scss'],
    providers: [ChatService]
})
export class Box_ChatComponent implements OnInit,AfterViewChecked {
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
    messages = [];
    messageData: any[] = [];
    customerId: any;
    chatBoxId: any;
    messageIdList = [];
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
        private apiService: ApiService,
        private formBuilder: FormBuilder,
        private http: HttpClient,
        private afAuth: AngularFireAuth,
        private ChatService: ChatService,
        private changeDetector: ChangeDetectorRef
    ) {
        this.form_login_customer = this.formBuilder.group({
            name: ['', Validators.required],
            phoneNumber: ['', Validators.required]
        });
        this.messages = [];
    }
    ngOnInit() {
        console.log('box-chat');

        this.ChatService.messages.subscribe((message) => {
            console.log('Received message:', message);
            if (message) {
                console.log(this.ChatService.messageBody);
                let temp = this.ChatService.messageBody;
                if (!this.messageIdList.includes(temp.messageId)) {
                    this.messageIdList.push(temp.messageId);
                    this.messages.push({
                        message: temp.messageContent,
                        messageType: temp.messageType
                    });
                    this.changeDetector.detectChanges();
                    console.log(message);
                }
            }
        });
        this.ChatService.setChatBoxId(this.chatBoxId);
    }
    sendMessage() {
        this.ChatService.sendMessageCustomer(
            this.messageContent,
            0,
            this.customerId
        );
        this.messages.push();
        console.log(this.customerId);

        this.messageContent = '';
    }

    loginByGoogle() {
        return this.afAuth
            .signInWithPopup(new firebase.auth.GoogleAuthProvider())
            .then((result) => {
                console.log(result);
                this.isLoggedIn = true;
                this.customerName = result.additionalUserInfo.profile['name'];
                console.log(this.customerName);
                this.getMessageCustomer();

                return {
                    customerName: this.customerName,
                    isLoggedIn: this.isLoggedIn
                };
            })
            .catch((error) => {
                console.error(error);
            });
    }

    logout() {
        this.afAuth.signOut();
        this.isLoggedIn = false;
    }

    toggleChatBox() {
        this.showChatBox = !this.showChatBox;
    }

    testBox() {
        this.websiteName = window.location.host;
        console.log(this.websiteName);
        this.apiService.openBoxChat({websiteName: this.websiteName}).subscribe({
            next: (response) => {
                this.response = response;
                console.log(response);
                this.apiResult = response; // Store the result of the API call
            },
            error: (error) => {
                console.log(error);
            }
        });
    }
    loginCustomer() {
        const customerName = this.form_login_customer.get('name').value;
        const phoneNumber = this.form_login_customer.get('phoneNumber').value;
        const websiteName = window.location.host;
        this.http
            .post('http://localhost:8080/api/customer/login-process', {
                customerName,
                phoneNumber,
                websiteName
            })
            .subscribe({
                next: (response) => {
                    console.log(response);
                    this.isLoggedIn = true;
                    this.customerName = customerName;
                    this.customerId = response['customerId'];
                    this.getMessageCustomer();
                },

                error: (error) => {
                    console.log(error);
                }
            });
    }
    getMessageCustomer() {
        const websiteName = window.location.host;
        const customerId = this.customerId;
        const params = new HttpParams()
            .set('website_name', websiteName)
            .set('customer_id', customerId);

        this.http
            .get('http://localhost:8080/api/chatbox/customer/get', {params})
            .subscribe({
                next: (response: any) => {
                    console.log(response);
                    this.chatBoxId = response[0].chatBoxId;
                    this.messageData = response[0].messageList.sort(
                        (a, b) => a.sendTime - b.sendTime
                    ); // assuming the response contains a 'messages' property

                    console.log(this.messageData);
                    this.ChatService.setChatBoxId(response[0].chatBoxId);
                    this.ChatService.subscribeToMessages(false);
                },

                error: (error) => {
                    console.log(error);
                }
            });
    }
}
