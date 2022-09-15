public class AccountConWrapper {

    public List<Wrapper> WrapperList{get;set;}
    public List<Account> AccountList{get;set;}
    public List<Contact> ContactList{get;set;}
    
    public AccountConWrapper(){
        
        WrapperList = new List<Wrapper>();
        AccountList = new List<Account>();
     
        
        AccountList = [Select Name , Industry,Phone, (Select Name, Phone from Contacts) from Account];
        
        for(Account acc : AccountList){
               ContactList = new List<Contact>();
            for(Contact cont : acc.contacts){
                ContactList.add(cont);  
            }  
              WrapperList.add(new Wrapper(acc, ContactList));
        }
    }

    public class Wrapper{
      public Account acc {get; set;}
      public List<Contact> con {get; set;}

      public Wrapper(Account a, List<Contact> c) {
          acc = a;
          con = c;
      }
   }
}