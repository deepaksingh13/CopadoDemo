public class MappingsObject {
  public Map<String,Map<String, List<Case>>> mapAccountContCase{get;set;}
  public Map<Id,List<Case>> mapCase{get;set;}
  public Map<String, List<Case>> mapContactCase{get;set;}
  
  public List<Contact> listContact{get;set;}
  public List<Case> listCase{get;set;}
  public List<Account> listAccount{get;set;}
     
    public MappingsObject(){
        mapAccountContCase = new Map<String,Map<String, List<Case>>>();
        mapCase = new Map<Id,List<Case>>();
        listAccount = new List<Account>();
        listContact = new List<Contact>();
    
        listContact = [Select id, Name, (Select id,Subject,Priority from Cases) FROM Contact];       
        for(Contact c : listContact)
        {
            listCase = new List<Case>();   
            for(Case cs : c.Cases)
            {
                listCase.add(cs);
            }
            mapCase.put(c.id,listCase);
        }
        
        listAccount = [Select id, Name, (Select Name,Email FROM Contacts) FROM Account];         
        for(Account acc : listAccount)
        {
            mapContactCase = new Map<String, List<Case>>();
        
            for(Contact cs : acc.contacts)
            {
                 listCase = new List<Case>();
            
               for(Case c : mapCase.get(cs.id))
               {
                   listCase.add(c);
               }          
                mapContactCase.put(cs.Name,listCase);  
            }   
            mapAccountContCase.put(acc.name,mapContactCase);
        }
       System.debug('Mapping Contact and Case'+mapAccountContCase);
       ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Warning, 'Mapping Contact and Case'+mapAccountContCase));

    } 
}