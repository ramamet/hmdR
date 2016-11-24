#' gghmd_map function
#'
#' This function loads a hmd_pop as input dataframe . It assumes that the first column
#' contains the Year and the subsequent columns are the sample identifiers.
#' yrMin and yrMax can be used as time duration for the plot.
#' 
#'
#' @param Take hmd_pop as input
#' @return rworldmap graph
#' @export 
#' @keywords yrMin, yrMax,yrDiv,aage
#' @examples
#' #Example.1; base graph with default values (yrMin=1980, yrMax=2010,yrDiv,aage)
#' gghmd_map(hmd_pop)
#' #Example.2; Advanced graph with user defined values
#' gghmd_map(hmd_pop,1980,2010,10,30)
#'

gghmd_map <- function(df, yrMin=1960,yrMax=2010,yrDiv=10,aage=20) {
 
 	       yrList <- seq(yrMin,yrMax,by=yrDiv)
	       leng= length(yrList)
	       leng_x=round(leng/2)
	       op <- par(mar=c(1,1,1,1),mfcol=c(leng_x,2),mai=c(0,0,0.2,0),xaxs="i",yaxs="i")
	      # op <- par(mar=c(1,1,1,1),mfcol=c(2,2),mai=c(0,0,0.2,0),xaxs="i",yaxs="i")
   
      for(i in 1:leng)
	       {
 
	       #getting a colour scheme from the RColorBrewer package
	        colourPalette <- RColorBrewer::brewer.pal(4,'RdYlGn')
	        
	        dff=dplyr::filter(df,(Age==aage) & (Year==yrList[i]))
	        
	  spdf= rworldmap::joinCountryData2Map( dff, joinCode = "ISO3", nameJoinColumn = "code")
	  	
	  mapParams<- rworldmap::mapCountryData(spdf,nameColumnToPlot="sex.ratio",
               colourPalette=colourPalette,
               catMethod=c(0.5,0.75,1.0,1.25,1.5),
               mapTitle=yrList[i],
               oceanCol="grey70",
               missingCountryCol="white",
               borderCol= "black",
               addLegend=FALSE)
	   
     
	       do.call(rworldmap::addMapLegend,
	       c(mapParams,
	       horizontal=TRUE,
	       legendLabels="all",
	       legendWidth=0.5))
	       }
	       	     
	       par(op)	
	       
	       
	   }    
	      # dev.off()
	       