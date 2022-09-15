trigger addAmountOnAccount on Opportunity (after insert, after update) {
    
    if(Trigger.isAfter && Trigger.isUpdate)
    {
       AddAmountOfOpp.updatecalculateAmount(Trigger.New);
    }
     if(Trigger.isAfter && Trigger.isInsert)
     {
         AddAmountOfOpp.updatecalculateAmount(Trigger.New);
     }
}