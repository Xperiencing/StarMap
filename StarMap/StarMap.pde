//Patrick Malone C15398146
//08/11/2016

//An array list to store the data from the file that is read in
ArrayList<Star> stars = new ArrayList<Star> ();

Table star_map_table;

void setup()
{
  size (800, 800);
  
  //Creating an instance of the table and adding columns to the table.
  star_map_table = new Table();
  star_map_table.addColumn("hab", Table.FLOAT);
  star_map_table.addColumn("name", Table.STRING);
  star_map_table.addColumn("distance", Table.FLOAT);
  star_map_table.addColumn("x_cord", Table.FLOAT);
  star_map_table.addColumn("y_cord", Table.FLOAT);
  star_map_table.addColumn("z_cord", Table.FLOAT);
  star_map_table.addColumn("star_size", Table.FLOAT);
  
  loadData();
}

//A funtion to read in the data or the star map into the program.
void loadData()
{
  star_map_table = loadTable("map_of_stars.csv", "csv");
  
  int rowCount = star_map_table.getRowCount();
  
  for(int row = 0; row < rowCount; row++)
  {
    float hab = star_map_table.getFloat(row, 2);
    String name = star_map_table.getString(row, 3);
    float distance = star_map_table.getFloat(row, 12);
    float x_cord = star_map_table.getFloat(row, 13);
    float y_cord = star_map_table.getFloat(row, 14);
    float z_cord = star_map_table.getFloat(row, 15);
    float star_size = star_map_table.getFloat(row, 16);
    
    TableRow data = star_map_table.addRow();
    
    data.setFloat("hab", hab);
    data.setString("name", name);
    data.setFloat("distance", distance);
    data.setFloat("x_cord", x_cord);
    data.setFloat("y_cord", y_cord);
    data.setFloat("z_cord", z_cord);
    data.setFloat("star_size", star_size);
    
  }
}


  
  