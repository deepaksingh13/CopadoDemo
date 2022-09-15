public class EmployeeRegistration {
	
    @AuraEnabled
    public static ICON_Employees__c insertToDatabase( ICON_Employees__c obj){
        insert obj;
        return obj;
    }
    
    @AuraEnabled
    public static ICON_Employees_Child__c insertToChildDatabase( ICON_Employees_Child__c obj){
        insert obj;
        return obj;
    }
}