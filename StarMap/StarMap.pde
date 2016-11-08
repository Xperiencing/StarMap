//Patrick Malone C15398146
//08/11/2016

//An array list to store the data from the file that is read in
ArrayList<Star> stars_list = new ArrayList<Star> ();

Table star_map_table;

float border = 50;

void setup()
{
  size (800, 800);
  
  //Creating an instance of the table and adding columns to the table.
  star_map_table = new Table();
  
  //Calling loadData to read in the star map into the program.
  loadData();
  
  //Calling print stars to print out the list of stars got from the file.
  printStars();
}

void draw()
{
   background(0);
   draw_grid();
   plot_stars();
   draw_line();
   
}

//A funtion to read in the data or the star map into the program.
void loadData()
{
  star_map_table = loadTable("map_of_stars.csv", "csv");
  
  int rowCount = star_map_table.getRowCount();
  
  //Iterating through the .csv file row by row
  for(int row = 1; row < rowCount; row++)
  {
    //Reading in the data needed from specific columns from every row into the file.
    float hab = star_map_table.getFloat(row, 2);
    String name = star_map_table.getString(row, 3);
    float distance = star_map_table.getFloat(row, 12);
    float x_cord = star_map_table.getFloat(row, 13);
    float y_cord = star_map_table.getFloat(row, 14);
    float z_cord = star_map_table.getFloat(row, 15);
    float star_size = star_map_table.getFloat(row, 16);
    
    //Table Row is used to store each piece of data that was just saved from the file.
    TableRow data = star_map_table.addRow();
    
    star_map_table.addColumn("hab", Table.FLOAT);
    star_map_table.addColumn("name", Table.STRING);
    star_map_table.addColumn("distance", Table.FLOAT);
    star_map_table.addColumn("x_cord", Table.FLOAT);
    star_map_table.addColumn("y_cord", Table.FLOAT);
    star_map_table.addColumn("z_cord", Table.FLOAT);
    star_map_table.addColumn("star_size", Table.FLOAT);
    
    data.setFloat("hab", hab);
    data.setString("name", name);
    data.setFloat("distance", distance);
    data.setFloat("x_cord", x_cord);
    data.setFloat("y_cord", y_cord);
    data.setFloat("z_cord", z_cord);
    data.setFloat("star_size", star_size);
    
    //Creating a new Object for the data that has just been read in
    Star new_star = new Star(data);
    
    //Adding the object to the array list
    stars_list.add(new_star);
    
  }
}

void printStars()
{
  for(int i=0; i < stars_list.size(); i++)
  {
    println(stars_list.get(i));
  }
}

void draw_grid()
{
  float x_pos = border;
  float y_pos = border;
  int x = 0;
  
  //this is to allow for changes in scrren size if any were to occur.
  //It leaves an equal space for the gridlines.
  float increment = (width - (border * 2))/10;
  
  //Setting colors and text specifications
  textAlign(CENTER);
  textSize(12);
  fill(0, 200, 144);
  stroke(0, 200, 144);
  strokeWeight(1);
  
  for (int i = -5; i < 6; i++)
  {
    text(i, x_pos + (increment * x), y_pos - 10);
    line(x_pos + (increment * x), y_pos, x_pos + (increment * x), height - border);
    x++;
  }
  
  //Reseting values for the opposite axis
  x = 0;
  x_pos = border;
  y_pos = border;
  
  for (int i = -5; i < 6; i++)
  {
    text(i, x_pos - 20, y_pos + (increment * x));
    line(x_pos, y_pos + (increment * x), width - border, y_pos + (increment * x));
    x++;
  }
  
}

void plot_stars()
{
   float x_cord;
   float y_cord;
   float size;
   String name;
   
   for(int i=0; i < stars_list.size(); i++)
   {
     x_cord = stars_list.get(i).x_cord;
     y_cord = stars_list.get(i).y_cord;
     size = stars_list.get(i).star_size;
     name = stars_list.get(i).name;
     
     x_cord = map(x_cord, -5.0f, 5.0f, border, width - border);
     y_cord = map(y_cord, -5.0f, 5.0f, border, height - border);
     
     stroke(255, 255, 0);
     strokeWeight(2);
     line(x_cord - 3, y_cord, x_cord + 3, y_cord);
     line(x_cord, y_cord - 3, x_cord, y_cord + 3);
     
     stroke(255, 0, 0);
     noFill();
     ellipse(x_cord, y_cord, size, size);
     
     fill(255);
     textAlign(LEFT);
     textSize(10);
     text(name, x_cord + 10, y_cord);
   }
  
}

void draw_line()
{

}

  
  