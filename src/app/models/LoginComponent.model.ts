
export class LoginComponent {
    email: string;
    password: string;
    userAccountID: String;
    userAccountName: String;
    authKey: String;
    source: number;
    deviceId: String;
    status: number;
    roleEntityDtoList: roleEntityDtoList[];
}
export class Employee {
    id: number;
    name: string;
    email: string;
    phone: string;
    address: string;
    dob: string;
}
export class roleEntityDtoList{
    Id: string;
    name: string;

}
