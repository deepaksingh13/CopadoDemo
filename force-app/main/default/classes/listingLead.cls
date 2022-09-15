public class listingLead {
    
    @AuraEnabled
     public static List<Lead> getLeads() {
        //fetch the active records using soql query
        List<Lead> leadList = [SELECT Id,Name,Company,LeadSource,Phone,Email,Status,OwnerId,Owner.Name FROM Lead];
        //return the list of Leads
        return leadList;
    } 
    
    @AuraEnabled
    public static Lead showDetailOfLead(Id LeadID){
        
     Lead detailLead = [SELECT Id,Name,LeadSource,Phone,Email,Status FROM Lead where Id=:LeadID];
        
        return detailLead;
    }
    
    @AuraEnabled
    public static Lead updateLeadForm(Lead updatedLead){
       
        try{
            update updatedLead;
            System.debug('Successfully updated');
        }
        catch(Exception e){
            System.debug('Error' + e);
        }
        
        return updatedLead;
    }
    
    @AuraEnabled
    public static Lead createLeadRecord(Lead newRecord){
        insert newRecord;
        return newRecord;
    }    
    
    @AuraEnabled
    public static string deletedLeadRecord(Id leadId){
        List<Lead> leadList = new List<Lead>();
        Lead thisLead = [SELECT Id,Name,LeadSource,Phone,Email,Status,OwnerId,Owner.Name FROM Lead where Id=:leadId];
        leadList.add(thisLead);
        
        try{
            delete leadList;
            System.debug('Successfully deleted');
        }
        catch(Exception e){
            System.debug('Error' + e);
        }
        
        return 'Successfully deleted the record';
    }
        
}