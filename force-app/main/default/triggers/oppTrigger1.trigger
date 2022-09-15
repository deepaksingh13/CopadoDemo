trigger oppTrigger1 on Opportunity (before insert) {
    
    for( opportunity op : TRIGGER.New){
        if(op.amount == null){
            op.addError('Please enter the Amount');
        }
        else
        if(op.amount < 1000){
            op.addError('Amount should be more than 1000');
        }
    }
    
}