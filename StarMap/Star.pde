class Star
{
  float hab;
  String name;
  float distance;
  float x_cord;
  float y_cord;
  float z_cord;
  float star_size;
  
  //Default constructors 
  Star()
  {
    this.hab = 0; 
    this. name = "Default";
    this.distance = 0;
    this.x_cord = 0;
    this.y_cord = 0;
    this.z_cord = 0;
    this.star_size = 0;
  }
  
  //Default constructors 
  Star(float hab, String name, float distance, float x_cord, float y_cord, float z_cord, float star_size)
  {
    this.hab = hab; 
    this. name = name;
    this.distance = distance;
    this.x_cord = x_cord;
    this.y_cord = y_cord;
    this.z_cord = z_cord;
    this.star_size = star_size;
  }
  
  
}