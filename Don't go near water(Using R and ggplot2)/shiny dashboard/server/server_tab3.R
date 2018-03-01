#.... server for tab 3 .....


output$cholera_death_locations_leaflet = renderLeaflet({
  
  #... Leaflet map ......
  
  leaflet( data = choleraDeathLocations ) %>% addTiles() %>%
    
    addMarkers( ~V2, ~V3, popup = ~as.character( V1 ), label = ~as.character( V1 ) )
  
})


output$cholera_pump_locations_leaflet = renderLeaflet({
  
  #... Leaflet map ......
  
  leaflet( data = choleraPumpLocations ) %>% addTiles() %>%
    
    addMarkers( ~V1, ~V2 )
  
})