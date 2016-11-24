#' gghmd_bar function
#'
#' contains the Year and the subsequent columns are the sample identifiers.
#' yrMin and yrMax can be used as time duration for the plot.
#'
#' @param Take hmd_pop as input
#' @return ggplot2 graph
#' @export 
#' @keywords loc , yrMin, yrMax
#' @examples
#' #Example.1; base graph with default values ( yrMin=1960, yrMax=2010)
#' gghmd_bar(hmd_pop)
#' #Example.2; Advanced graph with user defined values
#' gghmd_bar(hmd_pop,"USA",80,90,1970,2000)
#'

gghmd_bar <- function(my.df,loc="AUS", aageMin=80, aageMax=90, yrMin=1980,yrMax=2010){

   df =dplyr::filter(my.df, country==loc & Age>aageMin & Age<aageMax & Year>yrMin & Year<yrMax)
   
    p1=ggplot2::ggplot(df,ggplot2::aes(x=Year,y=Male))
    p1=p1+ggplot2::geom_bar(stat="identity",color="darkgreen",alpha=0.9,fill="#009E73",width=0.7)
    p1=p1+ggplot2::geom_bar(data=df,ggplot2::aes(x=Year,y=-(Female)),stat="identity",color="darkred",
    alpha=0.9,fill="#CC79A7",width=0.7)
    p1=p1+ggplot2::coord_flip()
    p1=p1+ggplot2::geom_hline(yintercept = 0, colour="black",size=1)
    p1=p1+ggplot2::theme_bw()      
    p1=p1+ggplot2::facet_wrap(~Age)
    p1=p1+ggplot2::theme(plot.title = ggplot2::element_text(lineheight=.8, face="bold"))
    p1=p1+ggplot2::xlab("Year")
    p1=p1+ggplot2::ylab(paste0("[Female] +++++++ Population-",loc," +++++++ [Male]",sep=""))
    #p1=p1+ggplot2::annotate("text", x = yrMin+5, y = 0.5e5,
    #label = "Male", color="blue",alpha=0.9,size=4,angle=90)
    #p1=p1+ggplot2::annotate("text", x = yrMin+5, y = -(0.5e5),
    #label = "Female",color="blue",alpha=0.9,size=4,angle=90)
	
    p1
      
     } 