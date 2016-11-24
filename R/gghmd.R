#' gghmd function
#'
#' This function loads a hmd_pop as input dataframe.
#' ggplot function is used here and we will get a simple country plot with available timeframe.
#'
#' @param Take hmd_pop as input
#' @return ggplot2 graph
#' @export 
#' @keywords loc as Country code (Ex: "USA")
#' @examples
#' gghmd(hmd_pop)

gghmd <- function(my.df,loc="USA"){
   df1=dplyr::filter(my.df,code==loc)
   p1=ggplot2::ggplot()
   p1=p1+ggplot2::geom_point(data=df1,ggplot2::aes(x=Year,y=Age,color=sex.ratio.bins))
   p1=p1+ggplot2::labs(title =paste0(loc,sep=""))
   p1=p1+ggplot2::scale_color_brewer(palette="Set1")
   p1=p1+ggplot2::labs(colour="Human Sex Ratio")
   p1=p1+ggplot2::theme(axis.text = ggplot2::element_text(colour = "black",size=6))
   p1=p1+ggplot2::theme_bw()   
   p1
}
