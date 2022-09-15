public with sharing class MapofAccountsExt
{
    public Map<String,List<Account>> AccountMap{get;set;}//map of user id to list of accounts
    public Map<String,User> UserMap{get;set;}//map of User id to user
    public List<string> userIds{get;set;} 
    public List<Attachment>thisattachmentlist{get;set;}  
    
    public MapofAccountsExt(ApexPages.StandardController controller) 
    {   
      
        thismethod();
        thisattachmentlist = [select id,name from attachment where parentid = '0016F00002Okpxk'];
    }
    
    private void thismethod()
    {
        //this will query all accounts;
        
         List<id> accList=new List<id>();
        for(Account acc:[select id, name from account])
        {
            acclist.add(acc.id);
        }
        
        
        AccountMap=new  Map<String,List<Account>>();
        for(Account acc: [select id,AccountNumber,name,Active__c,ownerid, owner.name from Account where account.id =:accList])
        {
            if(AccountMap.get(acc.ownerid)!=null)
            {
                List<Account> existingAccountsForThisUser=  AccountMap.get(acc.ownerid);
                existingAccountsForThisUser.add(acc);
                AccountMap.put(acc.ownerId,existingAccountsForThisUser);
            } 
               else
               {
                    AccountMap.put(acc.ownerId, new List<Account>{acc});
               }
        } 
        //We created map for Account ownerId instead of Account owner name as name can be same for two users which will create issues and show all accounts of those two different users under one user name
        
        UserMap = new Map<string, User>([select id,name, email from User where id in :AccountMap.keyset() ]);
        //userIds=new List<string>();
      //  userIds.addAll(UserMap.keySet());
    }
}