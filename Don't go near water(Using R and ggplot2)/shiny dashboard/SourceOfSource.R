suppressWarnings( library( shiny ) ) ; suppressWarnings( library( data.table ) ) ; suppressWarnings( library( ggplot2 ) )
                                                                                                 
suppressWarnings( library( tidyr ) ) ; suppressWarnings( library( ggthemes ) )  ; suppressWarnings( library( dplyr ) )

suppressWarnings( library( leaflet ) )

#....... Reading tsv files .......

choleraDeaths = read.table( '18p1data/choleraDeaths.tsv', header = T )

naplesCholeraAgeSexData = read.table( '18p1data/naplesCholeraAgeSexData2.tsv', header = T )

UKcensus1851 = fread( '18p1data/UKcensus1851.csv', stringsAsFactors = F )

choleraDeathLocations = read.csv( '18p1data/choleraDeathLocations.csv', stringsAsFactors = F, header = F )

choleraPumpLocations = fread( '18p1data/choleraPumpLocations.csv', stringsAsFactors = F, header = F )







