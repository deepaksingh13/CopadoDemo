public class AccountHandler{

    public static Account insertNewAccount(String name){
    
    try {
       
        Account accList = new Account(Name= name,Phone='(415)555-1212', NumberOfEmployees=100);
        
        insert accList;
        
        System.debug(accList);
        
        return accList;
        }
     
    
    catch(DmlException e){
       System.debug('A DML exception has occurred: ' +
                e.getMessage());
                return null;
        }
        
    } 
}