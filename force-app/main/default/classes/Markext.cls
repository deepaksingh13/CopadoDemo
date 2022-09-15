public with sharing class Markext 
{ 

    public List<Mark__c> thismark{get;set;}
    public Markext(ApexPages.StandardSetController controller) 
    {
    thismark = new List<Mark__c>();
        thismark = [select id,name,account__r.name,contact__r.name,english__c,maths__c from mark__c];
    }

   
    
}