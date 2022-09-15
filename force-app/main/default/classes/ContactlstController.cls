public class ContactlstController {
    public String sortOrder = 'LastName';
    
    public List<Contact> getContact()
    {
        List<Contact> contactList = [Select Id, FirstName, LastName from Contact Order by LastName ASC LIMIT 10];
        
        return contactList;
    }

}