({
	createLeadHelper : function(component, event, helper) {
        var getLeadRecord = component.get("v.leadObj");
		
        let action = component.get("c.createLeadRecord");
		console.log(action);
        action.setParams({
            "newRecord" : getLeadRecord
        });
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                $A.get('e.force:refreshView').fire();
            }
            else {
                console.log("Failed with state: " + state);
            }
    	});
        
    	$A.enqueueAction(action);
	}
})