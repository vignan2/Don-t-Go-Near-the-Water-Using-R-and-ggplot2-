#...... ui tab 1 .....

tabPanel(
  
  strong( 'Cholera Deaths' ),
  
  fluidRow(
    
    column( 10, plotOutput( "cholera_death_plot" ) ),   #..... Plot output
    
    #..... Author, Data Source, Libraries used information .....
    
    column( 2, helpText( p( strong( 'Author : ' ), "Vignan Thmmu" ),
                         p( strong( 'Data : ' ), "choleraDeaths.tsv" ),
                         p( strong( 'Libraries Used : ' ), "shiny, data.table, ggplot2, tidyr, ggthemes" ) ) )
    
  ),
  
  fluidRow(
    
    column( 12, helpText( p( strong( 'Cholera Death Table' ) ) ) )    #..... Heading
    
  ),
  
  br(),
  
  fluidRow(
    
    dataTableOutput( "cholera_death_table_output" )    #.... Table output
    
  )
  
)


