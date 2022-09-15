public class LeadHandler{

  public Set<Id> leadidset = new Set<Id>();
  public List<Lead> leadstoConvert;
  
  public void LeadAutoConvert(List<Lead> currentListOfLead)
    {
        for(Lead thislead : currentListOfLead)
        {  
            System.debug('is converted:'+thislead.isconverted);
            if(thislead.Status == 'Approved' && thislead.isconverted==false)  
            {        
                leadidset.add(thislead.id);
            }
            System.debug('this is lead'+leadidset);
        }
        leadstoConvert=new List<Lead>();
        leadstoConvert=[Select id,name,Status,isconverted from Lead where id=:leadidset and isconverted =false];
        System.debug('this is lead to convert list'+  leadstoConvert);
        
        LeadStatus CLeadStatus= [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true Limit 1];
        List<Database.LeadConvert> MassLeadconvert = new List<Database.LeadConvert>();
        try{
        for(Lead currentlead: leadstoConvert)
        {
          
           if(currentlead.Status == 'Approved' && currentlead.isconverted==false)
           {
                Database.LeadConvert Leadconvert = new Database.LeadConvert();
                Leadconvert.setLeadId(currentlead.id);     
                System.debug('this is lead in convert');           
                Leadconvert.setConvertedStatus(CLeadStatus.MasterLabel);
              //  Leadconvert.setDoNotCreateOpportunity(TRUE); //Remove this line if you want to create an opportunity from Lead Conversion 
              //  Leadconvert.setAccountId(acc.id);
                MassLeadconvert.add(Leadconvert);
                System.debug('this is lead to convert'+MassLeadconvert);
                
            }    
        }
        
        List<Database.LeadConvertResult> lcr = Database.convertLead(MassLeadconvert);
        System.debug('This is Final Convert'+lcr);
        }
        catch(Exception e)
        {
          system.debug('this is not converted'+e);
        }
    }   
  }