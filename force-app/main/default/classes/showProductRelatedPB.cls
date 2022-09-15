public class showProductRelatedPB {
    
    public Map<String,List<priceBookWrapClass>> mapOfWrapperStr{get;set;}
    
    public List<Pricebookentry> priceBookList{get;set;}
    public List<Pricebookentry> priceBookListnew{get;set;}
    public List<Pricebookentry> priceBookListupdate{get;set;}
    public List<priceBookWrapClass> wrapperList{get;set;}
    Set<Id> ids{get;set;}
    Map<String,String> priceBook{get;set;}
    Map<String,Map<String,Decimal>> mapOfMaps{get;set;}

    public showProductRelatedPB() 
    {
        ids = new Set<Id>();
        priceBook = new Map<String,String>();
        priceBookListupdate = new List<Pricebookentry>();
        priceBookList = [select id,pricebook2.name,product2.name,unitprice,Product_Family__c from Pricebookentry where pricebook2.name='Custom' limit 3];
        
        for(Pricebookentry thisPrice : priceBookList)
        {
            ids.add(thisPrice.product2id);
        }
        
        
        priceBookListnew = [select id,pricebook2.name,product2.name,unitprice, Product_Family__c from Pricebookentry where product2id IN:ids];
       
                  
       createConWrapper();  
    //   updatePriceBookEntry();        
    }
    
    public void createConWrapper()
    {
        mapOfMaps = new Map<String,Map<String,Decimal>>();
        mapOfWrapperStr = new Map<String,List<priceBookWrapClass>>();
   
    
    System.debug('map :'+mapOfMaps);
     
            for(Pricebookentry thisprice: priceBookListnew)
            {    
               priceBook.put(thisprice.pricebook2.name,thisprice.product2.name);
                wrapperList = new List<priceBookWrapClass>();
                if(mapOfWrapperStr.containsKey(thisprice.pricebook2.name))
                {
                    
                    mapOfWrapperStr.get(thisprice.pricebook2.name).add(new priceBookWrapClass(thisprice.unitprice ,thisprice.product2.name));
                }
                else
                {
                  wrapperList.add(new priceBookWrapClass(thisprice.unitprice ,thisprice.product2.name));
                  mapOfWrapperStr.put(thisprice.pricebook2.name,wrapperList);
                }
            }
            
      //  ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.error, 'my map---!!!'+priceBook)); 
     //   ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.error, 'my map size----!!!'+mapOfWrapperStr.size())); 
        System.debug(mapOfWrapperStr);
    }
    
    
    public pageReference updatePriceBookEntry()
    {
          System.debug(priceBook);
          System.debug(mapOfWrapperStr);
          
          for(Pricebookentry thisprice: priceBookListnew)
          {
                 
                 if(mapOfWrapperStr.containsKey(thisprice.pricebook2.name) == priceBook.containsKey(thisprice.pricebook2.name))
                 {
                     for(priceBookWrapClass wrapper : mapOfWrapperStr.get(thisprice.pricebook2.name))
                     {
                         if(wrapper.priceProductName == thisprice.product2.Name)
                         {
                             thisprice.unitprice = wrapper.unitpriceVal;
                           //  thisprice.Product_Family__c = wrapper.productFamily;
                           System.debug(wrapper.unitpriceVal);
                             priceBookListupdate.add(thisprice);
                         }
                     }
                 }
              
          }
          
          
          try{
              if(priceBookListupdate.size() > 0)
              {
                  update priceBookListupdate;
                  System.debug(priceBookListupdate);
              }
          }catch(DMLexception e)
          {
              System.debug('DML Error '+e);
          }
          
          PageReference pg = new PageReference('/apex/showProductNPB');
          pg.setRedirect(true);
          return pg;
    }
    
   
    
   
    public class priceBookWrapClass
    {
       
       public Decimal unitpriceVal{get;set;}
       public String priceProductName{get;set;}
    //   public String productFamily{get;set;}
       
       public priceBookWrapClass(Decimal unitpriceVal, String priceProductName)
           {
                  
            this.unitpriceVal = unitpriceVal;
            this.priceProductName = priceProductName;
       //     this.productFamily = productFamily;
           }
    }
       
}