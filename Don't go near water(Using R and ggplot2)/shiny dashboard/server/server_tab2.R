#.... server for tab 2 .....

output$naplesCholeraAgeSexData = renderDataTable( { 
  
  naplesCholeraAgeSexData   #... Table output
  
} )

naplesCholeraAgeSexData_modified = naplesCholeraAgeSexData %>% gather( sex, count, -age )    #... modifying data for plot

#.... Bar diagram for naplesCholeraAgeSex ....

output$naplesCholeraAgeSex_bar_plot = renderPlot({
  
  ggplot( naplesCholeraAgeSexData_modified, aes( age, count ) ) + 
    
    geom_bar(  aes( fill = sex ), stat = 'identity', position = 'dodge' ) + theme_economist() +
    
    ggtitle( 'Bar Diagram for Male and Female Fatality' ) +
    
    theme( plot.title = element_text( size = 12, colour = "firebrick", face = 'bold' ), axis.text = element_text(colour = "blue", face = 'bold'),
           
           axis.title.y = element_text( size = 12, face = 'bold' ), axis.title.x = element_text(size = 12, face = 'bold'),
           
           legend.position = 'right',
           
           legend.text = element_text( size = 8, face = 'bold' ),
           
           legend.title = element_text( size = 10, face = 'bold' ) )
  
})


output$UKcensus1851_table_output = renderDataTable( { 
  
  UKcensus1851$Total_Pop = UKcensus1851$male + UKcensus1851$female
  
  UKcensus1851    #... Table output
  
} )

#.... Function for Pie chart

donuts <- function(x, group = 1, labels = NA, col = NULL, radius = c( 2.5, 3 ), title = NA ) {
  group <- rep_len(group, length(x))
  ug  <- unique(group)
  tbl <- table(group)[order(ug)]
  
  col <- if (is.null(col))
    seq_along(ug) else rep_len(col, length(ug))
  col.main <- Map(rep, col[seq_along(tbl)], tbl)
  col.sub  <- lapply(col.main, function(x) {
    al <- head(seq(0, 1, length.out = length(x) + 2L)[-1L], -1L)
    Vectorize(adjustcolor)(x, alpha.f = al)
  })
  
  plot.new()
  
  par(new = TRUE)
  pie(x, border = NA, radius = radius[2L],
      col = unlist(col.sub), labels = labels, main = title )
  
  par(new = TRUE)
  pie(x, border = NA, radius = radius[1L],
      col = unlist(col.main), labels = NA)
}

UKcensus1851$age = as.factor( UKcensus1851$age )   #.... Changing to factor

#... Pie chart for male age census ....

output$tab_2_male_pie = renderPlot({
  
  with( UKcensus1851, donuts( male, group = age, labels = age, radius = c( 1, 1 ),
                              
                              title = 'Pie chart for Male Census Age Data' ) )
  
})

#... Pie chart for female age census ....

output$tab_2_female_pie = renderPlot({
  
  with( UKcensus1851, donuts( female, group = age, labels = age, radius = c( 1, 1 ),
                              
                              title = 'Pie chart for Female Census Age Data' ) )
  
})


UKcensus1851_modified = UKcensus1851 %>% select( age, male, female ) %>% gather( sex, count, -age )    #... modifying data for bar plot

#.... Bar diagram for naplesCholeraAgeSex ....

output$UKcensus1851_bar_plot = renderPlot({
  
  ggplot( UKcensus1851_modified, aes( age, count ) ) + 
    
    geom_bar(  aes( fill = sex ), stat = 'identity', position = 'dodge' ) + theme_economist() +
    
    ggtitle( 'Bar Diagram for Male and Female Census Data' ) +
    
    theme( plot.title = element_text( size = 12, colour = "firebrick", face = 'bold' ), axis.text = element_text(colour = "blue", face = 'bold'),
           
           axis.title.y = element_text( size = 12, face = 'bold' ), axis.title.x = element_text(size = 12, face = 'bold'),
           
           legend.position = 'right',
           
           legend.text = element_text( size = 8, face = 'bold' ),
           
           legend.title = element_text( size = 10, face = 'bold' ) )
  
})

overall_male_female_data = colMeans( UKcensus1851[, c( 'male', 'female' ) ] )

overall_male_female_df = data.frame( sex = names( overall_male_female_data ), count = overall_male_female_data )

rownames( overall_male_female_df ) = NULL

#... Pie chart for male female ....

output$tab_2_male_female_pie = renderPlot({
  
  with( overall_male_female_df, donuts( count, group = sex, labels = sex, radius = c( 1, 1 ), col = c( 'green', 'orange' ),
                              
                              title = 'Pie chart for Overall number of Men and Women' ) )
  
})

output$male_female_census_age_data = renderDataTable( { 
  
  total_male_female = data.frame( age = "Total", male = sum( UKcensus1851$male ), female = sum( UKcensus1851$female ) )
  
  total_male_female$age = as.character(total_male_female$age)
  
  bind_rows( UKcensus1851, total_male_female )
  
} )



