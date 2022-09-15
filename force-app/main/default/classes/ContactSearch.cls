public class ContactSearch{

    public static List<Contact> searchForContacts(String name, String postalCode){
        List<Contact> cont = [Select Name from Contact WHERE ( LastName =:name AND MailingPostalCode =:postalCode)];

        return cont;
    }
    
}