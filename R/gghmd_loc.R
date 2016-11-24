#' gghmd_loc function
#'
#' This function loads a hmd_pop as input dataframe . It assumes that the first column
#' contains the Year and the subsequent columns are the sample identifiers.
#' yrMin and yrMax can be used as time duration for the plot.
#' 
#'
#' @param Take hmd_pop as input
#' @return ggplot2 graph
#' @export 
#' @keywords loc , yrMin, yrMax
#' @examples
#' #Example.1; base graph with default values (loc="USA", yrMin=1980, yrMax=2010)
#' gghmd_loc(hmd_pop)
#' #Example.2; Advanced graph with user defined values
#' gghmd_loc(hmd_pop,"BEL",1970,2000)
#'

gghmd_loc <- function(my.df,loc="USA",yrMin=1960,yrMax=2010){
   df1=dplyr::filter(my.df,code==loc)
   df1=dplyr::filter(df1,(Year>yrMin) & (Year<yrMax))
   p1=ggplot2::ggplot()
   p1=p1+ggplot2::geom_point(data=df1,ggplot2::aes(x=Year,y=Age,color=sex.ratio.bins))
   p1=p1+ggplot2::labs(title =paste0(loc,sep=""))
   p1=p1+ggplot2::scale_color_brewer(palette="Set1")
   p1=p1+ggplot2::labs(colour="Human Sex Ratio")
   p1=p1+ggplot2::theme(axis.text = ggplot2::element_text(colour = "black",size=6))
   p1=p1+ggplot2::theme_bw()   
   p1
}
