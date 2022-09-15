//Modified By Ashutosh 
//Modified Date: 27 - 10 - 2018
//Description : Transfer the tasks from one user to multiple users

public with sharing class TaskAssignmentController {
    
    //Variables
    public Date duedate{get;set;}
    public Date enddate{get;set;}
    public String username{get;set;}
    public String transferTo{get;set;}
    public string uid{get;set;}
    public string uRoleId{get;set;}
    public String tasktype{get;set;}
    public Integer countTask{get;set;}
    public Integer selectedCount{get;set;}
    public Boolean showtable{get;set;} 
    // List to be used in controllers and wrapper
    public List<wrapTask> wrapTaskList {get;set;}
    public List<Task> selectedTasks{get;set;}
    public List<Task> unselectedTasks{get;set;}
    public List<SelectOption> gettaskType{get;set;}
    public List<SelectOption> getUsers{get;set;}
    
    public TaskAssignmentController() {
        
        selectedTasks = new List<Task>();
        username = ApexPages.currentPage().getParameters().get('username');
        transferTo = ApexPages.currentPage().getParameters().get('transferTo');
        tasktype = ApexPages.currentPage().getParameters().get('tasktype');
        showtable=false;
        countTask=0;
        selectedCount=0;
    }
    // To get the list of users on the basis of role hiearchy
    public List<SelectOption> getUserList()
    {
        uRoleId = UserInfo.getUserRoleId();
        UserRole urole = [Select id, Name from UserRole where Name='COO'];      
        UserRole urole2 = [Select id, Name from UserRole where Name='CFO'];      
        UserRole urole3 = [Select id, Name from UserRole where Name='SVP,HUMAN RESOURCES'];      
        UserRole urole4 = [Select id, Name from UserRole where Name='SVP,SALES & MARKETING'];
        
        if(uRoleId == urole.id)
        {
        List<User> ulist = new List<User>();
        getUsers = new List<SelectOption>();
        ulist = [Select id, Name, UserRole.Name, IsActive from User where IsActive=true and UserRole.Name='Caller'];
        
        
        if(ulist.size()>0)
         {
            system.debug('this is user list'+ulist);
            getUsers.add(new SelectOption('0001', '--Select--'));
            for(User u: ulist)
            {
                getUsers.add(new SelectOption(u.Name, u.Name));
            }
          }
        }
        
        if(uRoleId == urole2.id)
        {
        List<User> ulist2 = new List<User>();
        getUsers = new List<SelectOption>();
        ulist2 = [Select id, Name, UserRole.Name, IsActive from User where IsActive=true and UserRole.Name='Sales Manager'];
        
        
        if(ulist2.size()>0)
         {
            system.debug('this is user list'+ulist2);
            getUsers.add(new SelectOption('0001', '--Select--'));
            for(User u2: ulist2)
            {
                getUsers.add(new SelectOption(u2.Name, u2.Name));
            }
          }
        }
        
        if(uRoleId == urole3.id)
        {
        List<User> ulist3 = new List<User>();
        getUsers = new List<SelectOption>();
        ulist3 = [Select id, Name, UserRole.Name, IsActive from User where IsActive=true and (UserRole.Name='Sales Manager' or UserRole.Name='Caller')];
        
        
        if(ulist3.size()>0)
         {
            system.debug('this is user list'+ulist3);
            getUsers.add(new SelectOption('0001', '--Select--'));
            for(User u3: ulist3)
            {
                getUsers.add(new SelectOption(u3.Name, u3.Name));
            }
          }
        }
        
        if(uRoleId == urole4.id)
        {
        List<User> ulist4 = new List<User>();
        getUsers = new List<SelectOption>();
        ulist4 = [Select id, Name, UserRole.Name, IsActive from User where IsActive=true and (UserRole.Name='Sales Manager' or UserRole.Name='Caller')];
        
        
        if(ulist4.size()>0)
         {
            system.debug('this is user list'+ulist4);
            getUsers.add(new SelectOption('0001', '--Select--'));
            for(User u4: ulist4)
            {
                getUsers.add(new SelectOption(u4.Name, u4.Name));
            }
          }
        }
        
        return getUsers;
    }
    
    public string selectedFromUser()
    {
        return username;
    }
    
    public void setSelectedFromUser(string username)
    {
        this.username = username;
    }
    
    public string selectToUser()
    {
        return transferTo;
    }
    
    public void setSelectedToUser(string transferTo)
    {
        this.transferTo = transferTo;
    }
    // to get the task type 
    public List<SelectOption> getTypeFilter()
    {
        gettaskType = new List<SelectOption>();
        gettaskType.add(new SelectOption('Call','Call'));
        gettaskType.add(new SelectOption('Email','Email'));
        gettaskType.add(new SelectOption('Other','Other'));
        
        return gettaskType;
    }
    
    public String getselectedTaskType()
    {
        return tasktype;
    }
    
    public void setSelectedTaskType(string tasktype)
    {
        this.tasktype = tasktype;
    }
    // shows the list of tasks that came from the filters applied
    public void showTasks() {
        
        Set<Id> taskids = new Set<Id>();
        if(wrapTaskList == null) {
            wrapTaskList = new List<wrapTask>();
        }
        try
        {
            //System.debug('Inside try');
            //system.debug('--98--'+username);   
            User u = [Select Name, id from User where Name=:username LIMIT 1];
            //system.debug('this is the selected usr'+u);
            
            if(duedate<=enddate)
            {
                for(Task t: [select Id, OwnerId, Owner.Name, Type, Who.Name, Subject, ActivityDate, Status from Task where Status='Pending' and subject=:taskType
                             and ActivityDate>=:duedate and ActivityDate<=:enddate and OwnerId=:u.id]) {
                                 //system.debug('enter task');
                                 taskids.add(t.id);
                                 System.debug('Inside for loop');
                                 wrapTaskList.add(new wrapTask(t));
                             }
                duedate=null;
                enddate=null;
                countTask=0;
                
                if(wrapTaskList.size()>0)
                {
                    showtable = true;
                    system.debug('List of tasks'+wrapTaskList);
                }
                else
                {
                    ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.INFO,'No Tasks Found!'));
                    showtable=false;
                }  
                countTask = [Select count() from Task where id in: taskids];
                System.debug('this is count of task'+countTask);
            }
            else
            {
                ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.INFO,'Start date cannot be less than End Date!'));
            }
        }
        catch(Exception e)
        {
            System.debug('##Exception occured'+e.getMessage());
            ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.INFO,'Please provide the Inputs!'));
        }
        
        
    }
    // this method selects the task and then transfers the selected task to another user
    Public void showSelectedTasks() {
        
        selectedTasks = new List<Task>();
        try
        {
            User trans = [Select id, name from user where name=:transferTo];
            system.debug('this is the selected user for tranferring'+transferTo);
            
            if(username != transferTo)
            {     
                for(wrapTask wrapTaskObj : wrapTaskList) {
                    if(wrapTaskObj.selected == true) {
                        selectedTasks.add(wrapTaskObj.tsk);
                        selectedCount ++;
                        System.debug('this is the list of selected tasks'+wrapTaskObj.tsk);
                    } 
                }
                if(selectedCount == 0)
                {
                    ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.INFO,'Please select the tasks to be transferred!'));
                }
                
                if(selectedTasks.size()>0)
                {
                    try
                    { 
                        for(Task tsk : selectedTasks)
                        {
                            tsk.OwnerId = trans.id;
                            system.debug('this is task ownerid'+tsk.OwnerId);
                        } 
                        update selectedtasks;
                        System.debug('this is updated tasks'+selectedTasks);
                        ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.CONFIRM,'Task Transfer Successful!'));
                        
                    }
                    catch(Exception e)
                    {
                        System.debug('##Exception Occurred'+e.getMessage());
                        ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.INFO,'Task Transfer Failed!'));
                    }
                }
            }
            else
            {
                ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.INFO,'You Cannot Assign Task to same User!'));
                showtable=false;
                countTask=0;
            }
            refreshedTable();
        }
        catch(Exception e)
        {
            System.debug('##Exception Occurred'+e.getMessage());
            ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.INFO,'Please select the User!'));
        }
    }
    
    // This method removes the selected task from wrapper list and shows the task available only.
    public void refreshedTable()
    {
        Set<Id> refreshedId = new Set<Id>();
        unselectedTasks = new List<Task>();
        selectedTasks = new List<task>();
        selectedTasks.clear();
        for(Integer i = wrapTaskList.size() - 1; i >= 0; --i)
        {
            wrapTask WrapObj=wrapTaskList[i];
            if (WrapObj.selected == true){
                selectedTasks.add(wrapObj.tsk);
                wrapTaskList.remove(i);
            }
        } 
        for(wrapTask wrapobj2 : wrapTaskList)
        {
            if(wrapobj2.selected ==  false)
                unselectedTasks.add(wrapobj2.tsk);
            system.debug('this is list of unselected tasks'+unselectedTasks);
        }
        for(Task t: unselectedTasks)
            refreshedId.add(t.id);
        countTask = [Select count() from Task where id in:refreshedId]; 
        system.debug('this is refreshed count'+countTask);
    }
    
    
    public class wrapTask {
        public Task tsk {get; set;}
        public Boolean selected {get; set;}
        
        //This is the contructor method. When we create a new wrapTask object we pass a task that is set to the tsk property. We also set the selected value to false
        public wrapTask(Task t) {
            tsk = t;
            selected = false;
        }
    }
    
}