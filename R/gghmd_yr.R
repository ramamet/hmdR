#' gghmd_yr function
#'
#' This function loads a hmd_pop as input dataframe .
#' ggplot facet_wrap function is called internally .
#' User can define time duration for the plot . 
#' 
#' @param Take hmd_pop as input
#' @return ggplot2 graph
#' @export 
#' @keywords yrMin, yrMax
#' @examples
#' #Example.1; base graph with default values (yrMin=1980, yrMax=2010)
#' gghmd_yr(hmd_pop)
#' #Example.2; Advanced graph with user defined values
#' gghmd_yr(hmd_pop,1970,2000)
#'

gghmd_yr <- function(my.df,yrMin=1980,yrMax=2010){
df1=dplyr::filter(my.df,(Year>yrMin) & (Year<yrMax))                          
   p1=ggplot2::ggplot(data=df1,ggplot2::aes(x=Year,y=Age,color=sex.ratio.bins))
   p1=p1+ggplot2::geom_point(size=0.5,alpha=0.8)
   p1=p1+ggplot2::geom_point(size=0.60,alpha=0.01,color="black",shape=16)
   p1=p1+ggplot2::theme_bw()
   p1=p1+ggplot2::guides(colour = ggplot2::guide_legend(ncol=2,override.aes = list(size=3,alpha=1.0)))
   p1=p1+ggplot2::scale_color_brewer(palette="Set1")
   p1=p1+ggplot2::labs(colour="Human Sex Ratio")
   p1=p1+ggplot2::facet_wrap(~country,ncol=7)
   p1=p1+ggplot2::theme(legend.position = c(0.85, 0.050))
   p1=p1+ggplot2::theme(axis.text = ggplot2::element_text(colour = "black",size=6))
   
   p1
}
