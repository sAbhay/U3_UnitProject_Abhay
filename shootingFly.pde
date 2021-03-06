class Pooter extends Enemy
{
  private int fireRate;
  private int interval;
  
  Pooter(PVector _pos, float _speed, PVector _size, float _health, float _damage, int _fireRate)
  {
    super(_pos, _speed, _size, _health, _damage, "Pooter.obj", new PVector(3, 3, 3));
    
    fireRate = _fireRate;
    
    interval = millis();
  }

  void shoot(PVector _target)
  { 
    if(interval < millis())
    {
      b.add(new Bullet(pos, _target, 7.5, 500, 10, 1));
      
      interval = millis();
      interval += fireRate;
    }
    
    for(int i = 0; i < b.size(); i++)
    {
     b.get(i).update(); 
    }
    
    player.checkIfShot(this);
  }
}