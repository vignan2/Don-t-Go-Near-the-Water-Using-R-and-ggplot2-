
source( 'SourceOfSource.R' )    #... Loading necessary libraries and files

ui = navbarPage(
  
  theme = 'bootstrap_slate.css',     #.... Theme
  
  title = 'Dashboard',
  
  #..... Include ui for each tab .....
  
  source( file.path( "ui", "ui_tab1.R" ), local = T )$value,   #..... ui for tab 1
 
  source( file.path( "ui", "ui_tab2.R" ), local = T )$value,   #..... ui for tab 2
  
  source( file.path( "ui", "ui_tab3.R" ), local = T )$value   #..... ui for tab 3
  
)

server = function( input, output, session ){
  
  #..... Include server logic for each tab .....
  
  source( file.path( 'server', 'server_tab1.R' ), local = T )$value     #...... server logic for tab 1
  
  source( file.path( 'server', 'server_tab2.R' ), local = T )$value     #...... server logic for tab 2
  
  source( file.path( 'server', 'server_tab3.R' ), local = T )$value     #...... server logic for tab 3
  
}

shinyApp( ui = ui, server = server )

