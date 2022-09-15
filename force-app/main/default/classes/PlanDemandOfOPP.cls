public class PlanDemandOfOPP{

    public static void onInsert(List<Opportunity> oppList){
    
      List<Plan__c> ListA = new List<Plan__c>();
      List<Plan__c> ListB = new List<Plan__c>();
      List<Demand__c> ListOfDemand = new List<Demand__c>();
     
      for(Opportunity opp:oppList){
         if(opp.Plan__c == 'Plan A'){
           
           Plan__c planA = new Plan__c(Name = 'Plan A'+opp.Name,
                                       Plan_Name__c = opp.Plan__c,
                                       Amount__c = opp.Amount,
                                       Opportunity_Name__c = opp.id);
           
           ListA.add(planA);    
           
         }
         else if(opp.Plan__c == 'Plan B'){
         
             Plan__c planB = new Plan__c(Name = 'Plan B'+opp.Name,
                                         Plan_Name__c = opp.Plan__c,
                                         Amount__c = opp.Amount,
                                         Opportunity_Name__c = opp.id);
           
             ListB.add(planB);
         
         } 
      }
       
      if(ListA.size() > 0){
           
            insert ListA;
            for(Plan__c p : ListA) {
                Decimal x = 0.1;
                for(Integer i=0; i<4; i++) {
                  Demand__c d = new Demand__c(Name = 'Demand_'+p.Name,
                                              Amount__c = (x * p.Amount__c),
                                              Plan__c = p.id);
                    ListOfDemand.add(d);  
                    x = x + 0.1;
                }
            }
        }
        
    if(ListB.size() > 0){
           
            insert ListB;
            for(Plan__c p : ListB) {
                for(Integer i=0; i<10; i++) {
                  Demand__c d = new Demand__c(Name = 'Demand_'+p.Name,
                                              Amount__c = (0.1 * p.Amount__c),
                                              Plan__c = p.id);
                    ListOfDemand.add(d);  
                }
            }
     }
     
     
      if(ListOfDemand.size() > 0){
            insert ListOfDemand;
        } 
      
    }

}