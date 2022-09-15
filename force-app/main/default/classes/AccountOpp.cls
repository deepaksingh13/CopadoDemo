public class AccountOpp{

    Map<id,List<Opportunity>> mapAccountOpp {get;set;}
     
    public AccountOpp(){
     
     List<id> accList = new List<id>();
        for(Account acc:[select id, name from account])
        {
            acclist.add(acc.id);
        } 
        
     List<Opportunity> listOpportunity = [ Select name, LeadSource, account.id, ExpectedRevenue, CloseDate from Opportunity where accountId = :accList ];   
     
     mapAccountOpp = new Map<id,List<Opportunity>>();
     
     for(Opportunity opp : listOpportunity ){
     
         if(mapAccountOpp.get(opp.account.id)!= null){
         
             List<Opportunity> oppAccount = mapAccountOpp.get(opp.account.id);
             oppAccount.add(opp);
             mapAccountOpp.put(opp.account.id , oppAccount);
         }
          else
               {
                   mapAccountOpp.put( opp.account.id , new List<Opportunity>{opp} );
               }
     }
     
    }
}