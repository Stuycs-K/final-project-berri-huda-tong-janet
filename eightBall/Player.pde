public class Player{
  private int id;
  private boolean striped;
  private ArrayList<Ball> ballsIn = new ArrayList<>();
 
  Player(int ID, boolean stripe){
  id = ID;
  striped = stripe;
}

  public void addBallIn(Ball ball){
  ballsIn.add(ball);
  }
  
  public ArrayList<Ball> getBallsIn(){
  return ballsIn;
  }
}
