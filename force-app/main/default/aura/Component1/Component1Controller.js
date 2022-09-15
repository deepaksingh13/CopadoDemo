({
	doInit : function(component, event, helper) {
		var appEvent = $A.get("e.c:SampleApplicationEvent"); 
        //Set event attribute value
        appEvent.setParams({"message" : "Welcome "}); 
        console.log('comp1');
        appEvent.fire(); 
	},
    component1Event : function(cmp, event,helper) { 
        //Get the event using event name. 
        var appEvent = $A.get("e.c:SampleApplicationEvent"); 
        //Set event attribute value
        appEvent.setParams({"message" : "Welcome "}); 
        appEvent.fire(); 
    }
})