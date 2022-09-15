trigger LeadTrigger  on Lead (after update) {


     LeadHandler handler = new  LeadHandler();
     
     if(Trigger.IsAfter)
     {
        
         if(Trigger.isUpdate)
         {
          handler.LeadAutoConvert(Trigger.new);    
         }
     }
   
}