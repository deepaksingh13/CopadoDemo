({
	doClick : function(component, event, helper) {
		alert(component.getName());
        component.set('v.Age', 25);
        
        var comAge = component.find('ageInput');
        var disAge = comAge.get('v.value');
        alert(disAge);
        component.set('v.Age', disAge);
     	
	}
})