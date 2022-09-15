public class contactAcc {

 public map<String, List<Contact>> mapAccountWiseContact {get;set;}
 
 public contactAcc(){
 
     mapAccountWiseContact = new Map<String,List<contact>>();
     
     for(Account a : [Select id, name,(Select id, name, email, department , phone , birthdate ,Title, fax,AssistantName from contacts), (select english__c,  maths__c from marks__r)  from account where id In (SELECT AccountId FROM contact)]){
          
       mapAccountWiseContact.put( a.name , new List<contact>(a.contacts));
       system.debug('#### '+a.marks__r);
                
     }
 
 }

}