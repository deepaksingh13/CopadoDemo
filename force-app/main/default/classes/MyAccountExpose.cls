@restResource(urlMapping='/myaccount/*')
global class MyAccountExpose {
	
    @httpGet
    global static List<Account> getAllAccount(){
        List<Account> accountList = [Select Id, Name from Account];
        return accountList;
    }
    
    @httpPost
    global static void insertAccount(String nm){
        Account act = new Account();
        act.name = nm;
        insert act;
    }
}