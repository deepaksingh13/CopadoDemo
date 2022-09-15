({
	doSubmit : function(component, event, helper) {
        helper.saveDatatoDB(component, event, helper);
	},
    
    addRow : function(component, event, helper) {
    	var childObj = component.get("v.childObj");
        
        if(childObj == null || childObj == undefined)
        {
            childObj = [];
        }
        alert('test');
        childObj.push({
            'Name' : '',
            'Date_of_Birth__c' : null,
            'Sub_Division__c' : ''
        });
       
		component.set("v.childObj",childObj);
        
	}
})