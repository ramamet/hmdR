#' gghmd_time function
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
#' #Example.1; base graph with default values ( yrMin=1960, yrMax=2010)
#' gghmd_time(hmd_pop)
#' #Example.2; Advanced graph with user defined values
#' gghmd_time(hmd_pop,1970,2000)
#'

gghmd_time <- function(my.df, yrMin=1960,yrMax=2010){

   df=dplyr::filter(my.df,Year>yrMin & Year<yrMax)     
   p1=ggplot2::ggplot(df,ggplot2::aes(x=Age,y=sex.ratio,group=Year,color=Year))
   p1=p1+ggplot2::geom_line(size=0.2,alpha=0.4)
   p1=p1+ggplot2::theme_bw()
   p1=p1+ggplot2::facet_wrap(~country,ncol=6)
   p1=p1+ggplot2::geom_hline(yintercept=1,linetype=2,alpha=0.5)
   p1=p1+ggplot2::geom_vline(xintercept=50,linetype=2,alpha=0.5)
   p1=p1+ggplot2::scale_color_gradient(low="green", high="red")
   p1=p1+ggplot2::theme(legend.direction = "vertical", 
        legend.position = c(0.90, 0.08))
   p1=p1+ggplot2::guides(colour = ggplot2::guide_colorbar(title.position = "left"))   
   p1   
 
   }
   