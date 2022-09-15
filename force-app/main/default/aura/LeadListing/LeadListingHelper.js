({
    getLeadDataHelper : function(component, event, helper) {
        var action = component.get("c.getLeads");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var leadList = response.getReturnValue();
                component.set("v.leadList", leadList);
                 setTimeout(function(){ 
                        $('#tableId').DataTable(); 
                        $('div.dataTables_filter input').addClass('slds-input');
                       
                    }, 500);
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
            
    	$A.enqueueAction(action);
    },    
    deleteRecordHelper : function(component, event, helper) {
		var leadId = event.target.id;
        let action = component.get("c.deletedLeadRecord");

        action.setParams({
            "leadId" : leadId
        });
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        "title": "Deleted!",
                        "message": "Deleted successfully."
                    });
                    toastEvent.fire();
                $A.get('e.force:refreshView').fire();
            }
            else {
                console.log("Failed with state: " + state);
            }
    	});
        
    	$A.enqueueAction(action);
	}
})