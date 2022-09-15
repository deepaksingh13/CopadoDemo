({
	saveDatatoDB : function(component, event, helper) {
      
	/*	var name = component.get("v.ename");
        var fatherName = component.get("v.fathername");
        var salary = component.get("v.salary");
        var dep = component.get("v.department");
        var epOrg = component.get("v.epOrg");
        alert(name+"\n"+fatherName+'\n'+salary+'\n'+dep+'\n'+epOrg);
        */
        var obj = component.get("v.obj");
        var action = component.get("c.insertToDatabase");
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