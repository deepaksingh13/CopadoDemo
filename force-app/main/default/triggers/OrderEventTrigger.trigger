trigger OrderEventTrigger on Order_Event__e (after insert) {
	List<Task> tasks = new List<Task>();
    
    for (Order_Event__e event : Trigger.New) {
        if (event.Has_Shipped__c  == true) {
            Task cs = new Task();
            cs.Priority = 'Medium';
            cs.Subject = 'Follow up on shipped order 105';
            cs.OwnerId = event.CreatedById;
            tasks.add(cs);
        }
   }
    insert tasks;
}