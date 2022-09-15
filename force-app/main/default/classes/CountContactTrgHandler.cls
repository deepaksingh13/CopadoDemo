public class CountContactTrgHandler {
    public Set<Id> getAccountId = new Set<Id>();
    public List<Account> updateAccountList = new List<Account>();
	
    public void countContactsOfAccount(List<Contact> ContactList)
    {
        for(Contact c : ContactList)
        {
            if(c.AccountId!=null)
            {   
                   getAccountId.add(c.AccountId); 
            }
        }
        List<Account> accountList = [Select id ,Name, Count_Contact__c, (Select id, Name From Contacts) from Account Where id in:getAccountId];
    	
        for(Account acc : accountList)
        {
            System.debug('size '+acc.Contacts.size());
            acc.Count_Contact__c = acc.Contacts.size();
            
            updateAccountList.add(acc);
        }
        
        if(updateAccountList.size() > 0)
        {
            update updateAccountList;
        }
    }
}