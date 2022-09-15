({
	getLeadData: function(component, event, helper) {
		helper.getLeadDataHelper(component, event, helper);
	},
    
     scriptsLoaded: function(component,event,helper){
       console.log('after load script');
    },
    
    getLeadId: function(component, event, helper) {
        var idx = event.target.id;
         console.log('idx' +idx);
        
        var evt = $A.get("e.c:leadId"); 

        evt.setParams({
            "leadId" : idx
        });  

        evt.fire(); // fire the event
    },
    
    deleteRecord: function(component, event, helper) {
        helper.deleteRecordHelper(component, event, helper);
    },

    createRecord : function(component, event, helper) {
        component.set("v.isOpen", true);		
    }    
})