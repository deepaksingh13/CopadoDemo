public class MapOfMap {
    public Map<String,Map<String,List<String>>> mapOf{get;set;}
    Public MapOfMap(){
        mapOf =new  Map<String,Map<String,List<String>>>();
        
        Map<String,List<String>> map1 = new Map<String,List<String>>();
        String[] str1 = new String[]{'mango','pineapple','apple','gavava'};
        String str1Id = 'fruits';
        map1.put(str1Id, str1);
         
        String[] str2 = new String[]{'abcd','efgh','ijkl','mnop','qrst','uvwx'};
        String str2Id = 'alpha';
        map1.put(str2Id, str2);
        
        mapOf.put('val1', map1);
        
        /*   Second Entry   */
        
        Map<String,List<String>> map2 = new Map<String,List<String>>();
        
        String[] str3 = new String[]{'1234','4567','6789','1234'};
        String str3Id = 'num';
        map2.put(str3Id, str3); 
        
        
        String[] str4 = new String[]{'up','new-delhi','hriyana','lucknow'};
        String str4Id = 'state';
        map2.put(str4Id, str4);
        
        String[] str5 = new String[]{'Virat','Dhoni','Yuraj','Shami','Pandya'};
        String str5Id = 'Team';
        map2.put(str5Id, str5);
        
        mapOf.put('val2', map2);
    }
}