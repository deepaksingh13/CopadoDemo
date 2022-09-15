trigger opportunityContact on Opportunity (after insert) {
    
    Contact c = new Contact();
    for( Opportunity op : Trigger.New){
    
    c.AccountId = op.AccountId;
    c.LastName = op.Name;
    insert c;
    }
    
}