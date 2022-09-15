({
	createLead : function(component, event, helper) {
		helper.createLeadHelper(component, event, helper);
	},
    
    closeModel : function(component, event, helper) {
        component.set("v.isOpen", false);
    }
})