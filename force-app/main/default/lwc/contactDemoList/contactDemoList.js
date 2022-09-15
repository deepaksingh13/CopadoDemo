import { LightningElement, track, wire } from 'lwc';
import getContactList from '@salesforce/apex/ContactAuraService.getContactList';
import getAccountList from '@salesforce/apex/ContactAuraService.getAccountList';

export default class ContactDemoList extends LightningElement {
    @track searchKey;
    @track contacts;
    @track error;

    @track accounts;
    @track errorAccount;

    @wire(getContactList, {
        name : '$searchKey'
    })
    wiredContact({error, data}){
        if(data){
            this.contacts = data;
        }
        if(error){
            this.error = error;

             /*eslint-disable no-console */
             console.log('Error :' +error);
        }
    } 

    handlechange(e){
        e.preventDefault();
        /*eslint-disable no-console */
        console.log('Value :' +e.target.value);
        this.searchKey = e.target.value;
    }

    findAccounts(){
        getAccountList(
            {
                name : this.searchKey
            }
        )
        .then(result =>{
            this.accounts = result;
             /*eslint-disable no-console */
        console.log('Account :' +result);
        })
        .catch(error =>{
            this.errorAccount = error;
        });
    }
}