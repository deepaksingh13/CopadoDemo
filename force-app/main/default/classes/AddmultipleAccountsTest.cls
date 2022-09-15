@isTest
public class AddmultipleAccountsTest
{
    @isTest public static void AddmultipleAccounts()
    {
        Account addAccount = new Account(Name='Shreyas', Phone='234087612', Website='shreyas@icon.com');
        insert addAccount;
        system.debug('account iserted' +addAccount);
        
        Test.startTest();
        
        AddmultipleAccountsController newAccount = new AddmultipleAccountsController();
        newAccount.addAccount();
        newAccount.saveAccount();
        Test.stopTest();   
    } 
    
    
    
}