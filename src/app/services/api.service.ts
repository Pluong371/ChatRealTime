import {HttpClient} from '@angular/common/http';
import {Injectable} from '@angular/core';
import { Observable } from 'rxjs';
import {map} from 'rxjs/operators';

@Injectable({
    providedIn: 'root'
})
export class ApiService {
    constructor(private http: HttpClient) { }
    openBoxChat(request: any):Observable<any> {
        return this.http.post('http://localhost:8080/api/web/get-by-website-name', request);
    }
}