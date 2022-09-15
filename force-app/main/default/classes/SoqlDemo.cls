public class SoqlDemo {
	
    public void getSosl(){
        List<List<sObject>> searchList = [FIND 'Wingo OR SFDC' IN ALL FIELDS
                                         RETURNING Account(Name),Contact(FirstName)];
       
        List<Account> searchAcc = new List<Account>();
        searchAcc = searchList[0];
        
        for(Account a : searchAcc){
            System.debug('Account '+a);
        }
    }
}