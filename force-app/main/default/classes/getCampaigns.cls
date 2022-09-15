public class getCampaigns {

    public List<Campaign> camp{get;set;} 

    public getCampaigns(ApexPages.StandardController controller) {
        camp = [ Select Name, ActualCost, EndDate, StartDate, Status from Campaign ];
    }

}