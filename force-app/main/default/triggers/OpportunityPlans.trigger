trigger OpportunityPlans on Opportunity (after insert) {
    
   List<Opportunity> listOpportunity = new List<Opportunity>();
    
    for(Opportunity opp: Trigger.New){
        
        if(Trigger.isInsert && opp.Amount != null && opp.Plan__c != null) {
            
            listOpportunity.add(opp);
        }
   }  
   
      PlanDemandOfOPP.onInsert(listOpportunity); 
   
}