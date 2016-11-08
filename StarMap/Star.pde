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
  
  // constructors 
  Star(TableRow data)
  {
    this.hab = data.getFloat("hab"); 
    this. name = data.getString("name");
    this.distance = data.getFloat("distance");
    this.x_cord = data.getFloat("x_cord");
    this.y_cord = data.getFloat("y_cord");
    this.z_cord = data.getFloat("z_cord");
    this.star_size = data.getFloat("star_size");
  }
  
  String toString()
  {
    return hab + "\t" + name + "\t" + distance + "\t" + x_cord + "\t" + y_cord + "\t" + z_cord + "\t" + star_size;
  }
  
  
}