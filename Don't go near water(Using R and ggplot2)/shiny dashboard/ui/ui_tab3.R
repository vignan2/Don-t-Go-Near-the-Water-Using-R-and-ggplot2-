#...... ui for tab 3 .....

tabPanel(
  
  strong( 'Leaflet Map' ),
  
  fluidRow(
    
    column( 12, helpText( p( strong( 'Cholera Death Locations Leaflet Map' ) ) ) )    #..... Heading
    
  ),
  
  fluidRow(
    
    column( 12, leafletOutput( "cholera_death_locations_leaflet" ) )    #..... Cholera death locations leaflet map
    
  ),
  
  br(),
  
  fluidRow(
    
    column( 12, helpText( p( strong( 'Cholera Pump Locations Leaflet Map' ) ) ) )    #..... Heading
    
  ),
  
  fluidRow(
    
    column( 12, leafletOutput( "cholera_pump_locations_leaflet" ) )    #..... Cholera pump locations leaflet map
    
  )
  
)


