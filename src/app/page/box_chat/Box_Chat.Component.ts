import {Message} from '@stomp/stompjs';
import {ChatService} from '@services/chat.service';
import {ChangeDetectorRef, Component, OnInit} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {ApiService} from '@services/api.service';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {AngularFireAuth} from '@angular/fire/compat/auth';
import firebase from 'firebase/compat/app';
import {log} from 'console';

@Component({
    selector: 'box_chat',
    templateUrl: './Box_Chat.component.html',
    styleUrls: ['./Box_Chat.Component.scss'],
    providers: [ChatService]
})
export class Box_ChatComponent implements OnInit {
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
    }
    ngOnInit() {
        console.log('box-chat');
        // this.ChatService.messages.subscribe((message) => {
        //     console.log('Received message: ', message);
        //     this.messages.push(message);

        //     console.log(this.messages);
        //      this.changeDetector.detectChanges();
        // });
        // this.ChatService.subscribeToChatBox();
    }
    sendMessage(messageContent: string) {
        this.ChatService.sendMessage(messageContent);
        this.messageContent = '';
    }

    loginByGoogle() {
        return this.afAuth
            .signInWithPopup(new firebase.auth.GoogleAuthProvider())
            .then((result) => {
                console.log(result);
                this.isLoggedIn = true;
                // const name = (result.additionalUserInfo.profile as any).name;
                this.customerName = result.additionalUserInfo.profile['name'];
                console.log(this.customerName);

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

        this.http
            .post('http://localhost:8080/api/customer/login-process', {
                customerName,
                phoneNumber
            })
            .subscribe({
                next: (response) => {
                    console.log(response);
                    this.isLoggedIn = true;
                    this.customerName = customerName;
                    this.ChatService.messages.subscribe((message) => {
                        console.log('Received message: ', message);
                        this.messages.push(message);

                        console.log(this.messages);
                         this.changeDetector.detectChanges();
                    });
                    this.ChatService.subscribeToChatBox();
                },
                error: (error) => {
                    console.log(error);
                }
            });
    }
}
