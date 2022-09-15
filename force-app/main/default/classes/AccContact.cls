public class AccContact {
    
    public map<String, List<Contact>> mapAccountWiseContact {get;set;}
    public map<String, Account> AccountName {get;set;}
    
    public AccContact(){
        
        List<id> accList=new List<id>();
        for(Account acc:[select id, name from account])
        {
            acclist.add(acc.id);
        }
        
         List<Contact> lstContact = [select id, account.name, name, email, department , phone,(select english__c, maths__c from marks__r) from contact where account.id =:accList];
        List<Contact> newContact = new List<Contact>();
       
        mapAccountWiseContact = new Map<String,List<contact>>();
        
         for(Contact a : lstContact)
        {
        
         
         if(mapAccountWiseContact.get(a.account.id)!=null)
            {
                List<Contact> ContactForThisAccount=  mapAccountWiseContact.get(a.account.id);
                ContactForThisAccount.add(a);
                mapAccountWiseContact.put(a.account.id,ContactForThisAccount);
            } 
               else
               {
                   mapAccountWiseContact.put( a.account.id , new List<Contact>{a} );
               }
           
      //     mapAccountWiseContact.put( a.account.id , new List<Contact>{a} );
             
        }
        system.debug('this is map'+mapAccountWiseContact);
        
        AccountName = new Map<string, Account>([select id,name from Account where id in :mapAccountWiseContact.keyset()]);
        
        
    }
   
}