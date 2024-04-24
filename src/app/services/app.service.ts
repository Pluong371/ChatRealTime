import {Injectable} from '@angular/core';
import {Router} from '@angular/router';
import {ToastrService} from 'ngx-toastr';
import {sleep} from '@/utils/helpers';
import {HttpClient} from '@angular/common/http';
import {Observable, catchError, map} from 'rxjs';
import { roleEntityDtoList } from '@/models/LoginComponent.model';

@Injectable({
    providedIn: 'root'
})
export class AppService {
    public user: any = null;
   
    public roleEntityDtoList: roleEntityDtoList[];

    constructor(
        private router: Router,
        private toastr: ToastrService,
        private http: HttpClient
    ) {}
    // UserData(): Observable<{name: string; role: string}> {
    //     return this.http.get<any>(this.url).pipe(
    //         map((response) => {
    //             const name = response.data.name;
    //             const role = response.data.role;
    //             return {name, role};
    //         })
    //     );
    // }
    async loginByAuth({username, password}) {
        try {
            await this.authLogin(username, password);
            await this.getProfile();

            this.toastr.success('Login success');
        } catch (error) {
            this.toastr.error(error.message);
        }
    }

    async registerByAuth({email, password}) {
        try {
            await this.authLogin(email, password);
            await this.getProfile();

            this.toastr.success('Register success');
        } catch (error) {
            this.toastr.error(error.message);
        }
    }

    authLogin(username: string, password: string): Observable<any> {
        return this.http.post<any>("http://localhost:8080/api/employee/login-process", {username, password}).pipe(
            map((response: any) => {
                localStorage.setItem(
                    'authentication',
                    JSON.stringify(response)
                );
                if (
                    response.roleEntityDtoList &&
                    response.roleEntityDtoList[0].roleId === 'ADMIN'
                ) {
                    this.router.navigate(['/admin']);
                } else {
                    this.router.navigate(['/employee_home']);
                }
            }),
            catchError((error: any) => {
                console.error('Credentials are wrong!', error);
                throw error;
            })
        );
    }

    async loginByGoogle() {
        try {
            this.toastr.warning('Not implemented');
        } catch (error) {
            this.toastr.error(error.message);
        }
    }

    async registerByGoogle() {
        try {
            this.toastr.warning('Not implemented');
        } catch (error) {
            this.toastr.error(error.message);
        }
    }

    async loginByFacebook() {
        try {
            this.toastr.warning('Not implemented');
        } catch (error) {
            this.toastr.error(error.message);
        }
    }

    async registerByFacebook() {
        try {
            this.toastr.warning('Not implemented');
        } catch (error) {
            this.toastr.error(error.message);
        }
    }

    async getProfile() {
        return new Promise(async (resolve, reject) => {
            await sleep(500);
            try {
                let authentication = localStorage.getItem('authentication');
                if (authentication) {
                    authentication = JSON.parse(authentication);
                    resolve(authentication);
                } else {
                    this.logout();
                    resolve(undefined);
                }
            } catch (error) {
                this.logout();
                reject(error);
            }
        });
    }

    logout() {
        localStorage.removeItem('token');
        localStorage.removeItem('gatekeeper_token');
        this.user = null;
        this.router.navigate(['/login']);
    }
}

export const getAuthStatus = () => {
    return new Promise(async (res, rej) => {
        await sleep(500);
        try {
            let authentication = localStorage.getItem('authentication');
            if (authentication) {
                authentication = JSON.parse(authentication);
                return res(authentication);
            }
            return res(undefined);
        } catch (error) {
            return res(undefined);
        }
    });
};
