public class actionpollerDemoController{
public integer seconds {get;set;}
  public actionpollerDemoController(){
  seconds=0;
  }
  public void callmethod(){
  seconds=seconds+10;
  }
}