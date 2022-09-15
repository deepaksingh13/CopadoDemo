({
	component2Event : function(cmp, event) { 
        //Get the event message attribute
        console.log('comp2');
        var message = event.getParam("message"); 
        console.log('@@@ ',message);
        //Set the handler attributes based on event data 
        cmp.set("v.eventMessage", message + 'Biswajeet');         
    }
})