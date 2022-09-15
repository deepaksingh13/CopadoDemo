({
	getLeadId : function(component, event, helper) {
		var receivedId = event.getParam("leadId");
		component.set("v.isOpen", true);		
        component.set("v.thisrecordId", receivedId);
        var action1 = component.get("c.showDetailOfLead");
 		 
        action1.setParams({
            "LeadID" : receivedId
        });
            
        action1.setCallback(this,function(response){
        	var state = response.getState();
           
            if (state === "SUCCESS") {
            var lead = JSON.stringify(response.getReturnValue());
            component.set("v.leadDetail", response.getReturnValue());
            console.log('response ##: ' +lead);         
        }
        else {
            console.log("Failed with state: " + state);
        }
          
        }); 
        $A.enqueueAction(action1);
	},
    
 
   closeModel: function(component, event, helper) { 
      component.set("v.isOpen", false);
   },
    
    upDateLead: function(component,event,helper){
        var action2 = component.get("c.updateLeadForm");
        var receivedId = event.getParam("leadId");
        var updatedLead = component.get("v.leadDetail");
        
        action2.setParams({
            "updatedLead" : updatedLead
        });
        
        action2.setCallback(this,function(response){
            var state = response.getState();
            
            if(state === "SUCCESS"){
            console.log('success: ' +state); 
               //component.set("v.listOfLeads", response.getReturnValue())   
           		$A.get('e.force:refreshView').fire();
                console.log('response ####: ' +JSON.stringify(response.getReturnValue())); 
            }
             else {
            	console.log("Failed with state: " + state);
        	}
           
        });
        
         $A.enqueueAction(action2);
        component.set("v.isOpen", false);
    },
 
})