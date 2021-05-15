#' how to make herb to molecule or cid of molecule
#'
#' @param x an variable
#'
#' @return molecule and cid
#' @export
#'
#' @examples
#' .h2m(x='Ziziphi Spinosae Semen',type='latin')
#' .h2m(x='houpu',type='pinyin')
#' h2m(x=c('Ziziphi Spinosae Semen','Abri Herba'),type='latin')
h2m<-function(x,type="latin")
{
  y<-lapply(x,.h2m,type=type)
  names(y)<-(data.frame(x))$x
  y
}
#' @export
.h2m<-function(x,type="latin"){
  {
    type <- match.arg(type,c("latin","pinyin","chinese"))
    if(length(x)>1)
      stop("Length of x must be 1!")
    else if(type=="pinyin")
      x<-drug[pinyin%in%tolower(x),]$latin
    else if(type=="chinese")
      x<-drug[chinese%in%x,]$latin
  }
  {
    if(length(x)==1)
      y <- drugchem[herb==x,][,c(3,14)]
    else
      y<-NA
  }
  y<-y[!duplicated(y$molecule),]
  y
}


