public class NewCaseListController{

    public string status = 'New';
   

    public List<Case> getNewCases() 
    {
    
        List<Case> results = Database.query
        (
            'SELECT Id, CaseNumber, Status ' +
            'FROM Case ' +
             'Where Status = :status ' +
            'ORDER BY Status '
           
        );
        return results;
        
    }   
}