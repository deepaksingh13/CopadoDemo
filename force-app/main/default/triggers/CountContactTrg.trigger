trigger CountContactTrg on Contact (after insert,after delete) {
    
    CountContactTrgHandler thisHandler = new CountContactTrgHandler();
    
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert)
        {
            thisHandler.countContactsOfAccount(Trigger.New);
        }
        
        if(Trigger.isDelete)
        {
            thisHandler.countContactsOfAccount(Trigger.Old);
        }
    }
    
}