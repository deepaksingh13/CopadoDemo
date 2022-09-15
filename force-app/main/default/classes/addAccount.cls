public with sharing class addAccount {


    public List<Account> addAct{get;set;}
  //  public Account acc{get;set;};

    public addAccount() 
    {
               addAct = new List<Account>(); 
               addAct  = [Select Name, Phone, Website From Account];
    }

    public pagereference addAccount1()
    {     
        addAct = new List<Account>();
        addAct  = [Select Name, Phone, Website From Account];

        Account thisaccount  = new Account();
        insert thisAccount;   
        
        return null;
    }
}