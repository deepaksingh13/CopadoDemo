public class AddAmountOfOpp{

    public static void updatecalculateAmount(List<Opportunity> listOfOpp)
    {
        Decimal addMount;
        List<Account> listOfAcc = new List<Account>();
        Set<Id> setOfId = new Set<Id>();
        
        for(Opportunity opp: listOfOpp)
        {
            setOfId.add(opp.id);
        }
        
        //  listOfAcc = ;
        
        for(Account acc: [Select Name,Sum_Amount__c, (Select Name, Amount from Opportunities) from Account])
        {
            addMount = 0;
            for(Opportunity opp: acc.opportunities)
            {
                addMount+=  opp.Amount;
            }
            System.debug('amount '+addMount);
            acc.Sum_Amount__c = addMount;
            System.debug('Sum_Amount__c '+acc.Sum_Amount__c); 
            
            listOfAcc.add(acc);
        }
        
        try{
          if(listOfAcc.size() > 0)
          {  
             update listOfAcc;
          }  
        }
        catch(DMLException e){}
    }
   
}