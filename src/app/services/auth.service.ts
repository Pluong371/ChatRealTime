import {Injectable} from '@angular/core';
import {AngularFireAuth} from '@angular/fire/compat/auth';
import {GoogleAuthProvider, getAuth} from 'firebase/auth';
import {HttpClient} from '@angular/common/http';

@Injectable({
    providedIn: 'root'
})
export class authService {
    constructor(
        private afs: AngularFireAuth,
        private http: HttpClient
    ) {}
    signInWithGoogle() {
        const provider = new GoogleAuthProvider();
        provider.addScope('email');
        provider.addScope('openid');
        provider.addScope('profile');
        return this.afs.signInWithPopup(provider).then((user) => {
            user.user.getIdTokenResult(false).then((tokenResult) => {
                this.http
                    .post<any>(
                        'http://localhost:8080/api/customer/logingoogle',
                        {
                            token: tokenResult.token,
                            name: tokenResult.claims['name'],
                            email: tokenResult.claims['email'],
                            picture: tokenResult.claims['picture'],
                            userId: tokenResult.claims['user_id']
                        }
                    )
                    .subscribe((result) => {
                        console.log(result);
                        return result;
                    });
            });
        });
    }
}
