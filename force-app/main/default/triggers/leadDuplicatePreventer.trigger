trigger leadDuplicatePreventer on Lead
                               (before insert, before update) {

    Map<String, Lead> leadMap = new Map<String, Lead>();
    for (Lead lead : System.Trigger.new) {
        
        // Make sure we don't treat an email address that  
        // isn't changing during an update as a duplicate.  
    
        if ((lead.Email_Id__c != null) &&
                (System.Trigger.isInsert ||
                (lead.Email_Id__c != 
                    System.Trigger.oldMap.get(lead.Id).Email_Id__c))) {
        
            // Make sure another new lead isn't also a duplicate  
    
            if (leadMap.containsKey(lead.Email_Id__c)) {
                lead.Email_Id__c.addError('Another new lead has the '
                                    + 'same email address.');
            } else {
                leadMap.put(lead.Email_Id__c, lead);
            }
       }
    }
    
    // Using a single database query, find all the leads in  
    
    // the database that have the same email address as any  
    
    // of the leads being inserted or updated.  
    
    for (Lead lead : [SELECT Email_Id__c FROM Lead
                      WHERE Email_Id__c IN :leadMap.KeySet()]) {
        Lead newLead = leadMap.get(lead.Email_Id__c);
        newLead.Email_Id__c.addError('A lead with this email '
                               + 'address already exists.');
    }
}