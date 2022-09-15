public class ContactAndLeadSearch{
    public static List<List<sObject>> searchContactsAndLeads(String lastName){
        
        List<List<sObject>> searchconlead = [FIND :lastName IN ALL FIELDS RETURNING Contact(Name),Lead(FirstName)];
        
        System.debug(searchconlead );
        
        return searchconlead;
        
    }
}