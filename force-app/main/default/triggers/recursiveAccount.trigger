trigger recursiveAccount on Account (before insert) {
    public static boolean check = false;
    if(check)
    {   
        insert new Account(name = 'test');
    }
    check = true;    
}