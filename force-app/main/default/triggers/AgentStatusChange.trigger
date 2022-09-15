trigger AgentStatusChange on Contact (after update) {
    
    List<Id> contactsToUpdate = new List<Id>{};
    
    for (Contact c: Trigger.new){
        Contact oldContact = Trigger.oldMap.get(c.ID);
        if (c.phone != oldContact.phone){
                
                contactsToUpdate.add(c.ID);
        }
        else{
            c.addError('Cannot update this field');    
        }
    }
    
}