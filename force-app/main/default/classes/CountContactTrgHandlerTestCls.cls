@isTest
private class CountContactTrgHandlerTestCls {
    
    public static testMethod void testClass(){
        List<Contact> contactList = new List<Contact>();
        
        Account a = new Account();
        a.Name = 'Test';
        insert a;
        
        Contact c = new Contact();
        c.FirstName = 'Test';
        c.LastName = 'Contact';
        c.AccountId = a.Id;
        insert c;
        
        contactList.add(c);
        
        Test.startTest();
        CountContactTrgHandler thisClass = new CountContactTrgHandler();
        thisClass.countContactsOfAccount(contactList);
        Test.stopTest();
    }    
}