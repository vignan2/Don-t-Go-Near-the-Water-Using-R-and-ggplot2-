#.... server for tab 1 .....

output$cholera_death_table_output = renderDataTable( { 
  
  choleraDeaths$Total_Death_Attack = choleraDeaths$Attack + choleraDeaths$Death
  
  choleraDeaths_DataTable = choleraDeaths     #... Rendering Cholera Deaths table output
  
} )


choleraDeaths$cum_sum_Attack = cumsum( choleraDeaths$Attack )   #.... Cumulative sum of Attack

choleraDeaths$cum_sum_Death = cumsum( choleraDeaths$Death )   #.... Cumulative sum of Death

modified_date = seq(as.Date("1854-08-19"), by="1 day", length.out = nrow( choleraDeaths ) )

choleraDeaths$Date = modified_date

cholera_deaths_df_trans =   choleraDeaths %>% gather( type, count, -Date )   #... Modifying data for plot

cholera_deaths_df_trans$type = as.factor( cholera_deaths_df_trans$type )    #.... Changing type to factor

#..... Plot ......

output$cholera_death_plot = renderPlot({
    
    ggplot( cholera_deaths_df_trans, aes( x = Date, y = count, colour = type ) ) + geom_line( size = 1 ) + xlab( 'Date' ) +
    
    ggtitle( 'Cholera Deaths Plot' ) + theme_light() +
    
    theme( plot.title = element_text( size = 12, colour = "firebrick", face = 'bold' ), axis.text = element_text(colour = "blue", face = 'bold'),
           
           axis.title.y = element_text( size = 12, face = 'bold' ), axis.title.x = element_text(size = 12, face = 'bold') )
  
})


  
  