public class getData {

    public List<Account> directType{get;set;}
    public List<Account> channelType{get;set;}
    public getData()
    {
     directType = [Select Name, Type, Industry, Phone from account where type = 'Customer - Direct'];
     channelType = [Select Name, Type, Industry, Phone from account where type = 'Customer - Channel'];
    
  }
  
 /* public getdata(){}
   public List<Account> getchanneltype()
   {
   return null;
   }
    public List<Account> getdirecttype()
   {
   return null;
   } */
}