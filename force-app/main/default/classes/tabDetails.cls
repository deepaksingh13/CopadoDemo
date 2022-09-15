public class tabDetails {

  public List<Opportunity> opportunities {get;set;}
   public List<Case> cases {get;set;}
 //  public List<Product> products {get;set;}
   public List<Contact> contacts {get;set;}
   public List<Account> accounts {get;set;}
   public List<Lead> leads {get;set;}
   public List<Account> sortAccount {get;set;}
    
   public tabDetails(){
     opportunities = [Select Name, IsPrivate, Probability, LeadSource from opportunity];
     contacts = [Select Name, Phone, LeadSource, Email from Contact];
     accounts = [Select Name, AccountNumber, Type, AnnualRevenue from Account];
     cases = [Select account.name, ClosedDate, CreatedDate, Status from Case];
     leads = [Select Name, Email, Company, Status from Lead];
   } 
   
   public void sortList(){
     
       sortAccount = [Select name from account order by AnnualRevenue];
       
   }

}