({
	saveDatatochildDB : function(component, event, helper) {
     
        var obj = component.get("v.childObj");
        obj.ICON_Employees__c = component.get("v.parentId");
        alert(JSON.stringify(obj));
        var action = component.get("c.insertToChildDatabase");
        action.setParams({
           'obj' : obj
        });
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state == "SUCCESSS"){
                var storeResponse = response.getReturnValue();
                console.log('Success');
            }
        });
        
        $A.enqueueAction(action);
	}
})