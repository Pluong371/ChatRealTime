import { IMessage } from '@stomp/stompjs';
export class MessageComponent {
    messageId: String;
    messageContent: String;
    messageType: number;
    sendTime: number;
    status: number;
    chatBoxId: String;
    senderId: String;
}
