public class CollectionDemo {
	
    public void getName(){
        List<String> nm = new List<String>();
        
        nm.add('Deepak');
        nm.add('Singh');
        nm.add('demo1');
        nm.add('Deepak');
        
        System.debug('List '+nm);
         
        Iterator<String> itr = nm.iterator();
         
        while(itr.hasNext()){
            System.debug('itr '+itr.next());
        }
        
        System.debug('=================================');
        
        Set<String> s = new Set<String>();
        
        s.add('Deepak');
        s.add('Singh');
        s.add('demo1');
        s.add('Deepak');
        
        System.debug('Set '+s);
        
        System.debug('=================================');
        
        Map<String,String> m = new Map<String,String>();
        m.put('m1','Deepak1');
        m.put('m2','Deepak2');
        m.put('m3','Deepak3');
        m.put('m4','Deepak4');
        
        System.debug('MAP :'+m);
    }
}