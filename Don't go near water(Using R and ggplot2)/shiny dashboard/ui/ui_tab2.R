#...... ui for tab 2 .....

tabPanel(
  
  strong( 'Cholera Age Sex Fatality' ),
  
  fluidRow(
    
    column( 12, helpText( p( strong( 'Cholera Fatality Table' ) ) ) )    #..... Heading
    
  ),
  
  fluidRow(
    
    column( 6, dataTableOutput( "naplesCholeraAgeSexData" ) ),     #.... Displaying Table
    
    column( 6, plotOutput( "naplesCholeraAgeSex_bar_plot" ) )     #.... Displaying Bar plot
    
  ),
  
  br(),
  
  fluidRow(
    
    column( 12, helpText( p( strong( 'Male and Female Census Age Table' ) ) ) )    #..... Heading
    
  ),
  
  fluidRow(
    
    column( 12, dataTableOutput( "male_female_census_age_data" ) )    #.... Displaying Table
    
  ),
  
  br(),
  
  fluidRow(
    
    column( 6, plotOutput( "tab_2_male_pie" ) ),     #.... Displaying Male pie chart
    
    column( 6, plotOutput( "tab_2_female_pie" ) )     #.... Displaying Female pie chart
    
  ),
  
  br(),
  
  fluidRow(
    
    column( 6, plotOutput( "UKcensus1851_bar_plot" ) ),     #.... Displaying Bar plot
    
    column( 6, plotOutput( "tab_2_male_female_pie" ) )     #.... Displaying Male Female pie chart
    
  )
  
  
)


