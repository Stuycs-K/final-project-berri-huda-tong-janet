public class Ball{
  private float mass; 
  private PVector position;
  private PVector velocity;
  private PVector acceleration;
  private float colour;
  private final float friction_constant = 0.06; 
  
//temp constructor 
  public Ball(float x, float y, float xspeed, float yspeed){
    mass = .165; 
    position = new PVector(x, y); 
    velocity = new PVector(xspeed, yspeed); 
    acceleration = new PVector(0, 0); 
    colour = random(225) ; 
  }

  public Ball(float x, float y, float xspeed, float yspeed, float c){
    mass = .165; 
    position = new PVector(x, y); 
    velocity = new PVector(xspeed, yspeed); 
    acceleration = new PVector(0, 0); 
    colour = c ; 
  }
  
  public void getStationaryDirect(Ball hit){
    //get the vectors necessary 
    PVector hitt = new PVector(hit.position.x - position.x, hit.position.y - position.y);
    PVector cue = new PVector(0, 0);  
    if (PVector.angleBetween(velocity, hitt.copy().rotate(HALF_PI + PI)) < HALF_PI){
      cue = hitt.copy().rotate(HALF_PI + PI); 
    }
    else{
      cue = hitt.copy().rotate(HALF_PI); 
    }
    float theta = PVector.angleBetween(velocity, hitt); 
    float magH = cos(theta) * velocity.mag() ; 
    float magC = sin(theta) * velocity.mag(); 
    hitt.normalize().mult(magH); 
    cue.normalize().mult(magC); 
    velocity.set(cue); 
    hit.velocity.set(hitt); 
  }
  
  public void getMovingDirect(Ball hit){
    //same idea as stationary Direct but manipulating
    PVector forceVel = velocity.sub(hit.velocity); 
    PVector hitt = new PVector(hit.position.x - position.x, hit.position.y - position.y);
    PVector cue = new PVector(0, 0);  
    if (PVector.angleBetween(forceVel, hitt.copy().rotate(HALF_PI + PI)) < HALF_PI){
      cue = hitt.copy().rotate(HALF_PI + PI); 
    }
    else{
      cue = hitt.copy().rotate(HALF_PI); 
    }
    float theta = PVector.angleBetween(forceVel, hitt); 
    float magH = cos(theta) * forceVel.mag(); 
    float magC = sin(theta) * forceVel.mag(); 
    hitt.normalize().mult(magH); 
    cue.normalize().mult(magC); 
    velocity.set(cue.add(hit.velocity)); 
    hit.velocity.set(hitt.add(hit.velocity)); 
  }
  
  public void getDirect(Ball hit){
    if (this.position.dist(hit.position) <= 24){
      if (hit.velocity.mag() == 0){
        getStationaryDirect(hit); 
      }
      else if (velocity.mag() == 0){
        hit.getStationaryDirect(this); 
      }
      else{
        getMovingDirect(hit); 
      }
    }
  }
  
  public void move(){
    if (velocity.mag() <= 0.1){
      velocity.set(0, 0); 
    }
    while (position != position.copy().add(velocity)){
      position.x += 0.01 * velocity.x ; 
      position.y += 0.01 * velocity.y; 
    }
    acceleration.add(friction()); 
    velocity.add(acceleration); 
    acceleration.set(0, 0); 
  }
  
  //checks if two balls are in contact 
  //returns the index of the contacted ball 
  public int contact(ArrayList<Ball> balls, Ball b){
    for (int j = 0; j < balls.size(); j++){
       Ball c = balls.get(j); 
        if (b.position.dist(c.position) <= 24 && b.position.dist(c.position) != 0){
            return j ; 
        }
     }
     return 0; 
   }
 
  
  //angle of incidence = reflected angle 
  public void hitWall(){
    if ((floor(position.x -12) <= 40) || (floor(position.x +12) >= 1080)){
       velocity.x = -1 * velocity.x; 
    }
    if ((floor(position.y -12) <= 40) || (floor(position.y +12) >= 540)){
      velocity.y = -1 * velocity.y; 
    }
  }
  
  public PVector friction(){
    float Force = -1 * 9.81 * mass * friction_constant; 
    PVector friction = velocity.copy().normalize().mult(Force); 
    return friction; 
  }
  
  public void setPosition(float x, float y){
    position.x = x; 
    position.y = y; 
  }

  
  void display() {
    fill(colour); 
    noStroke();
    circle(position.x, position.y, 24);
  }
  
  public PVector getPosition(){
  return position;
  }
  
  public float getMass(){
  return mass;}
  
  public void changeColor(float col){
    colour = col;
  }
  
  public void move(PVector acc){
  acceleration = acc;
  velocity.add(acceleration);
  acceleration = new PVector(0,0);
  position.add(velocity);
  }

}
