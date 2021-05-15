#' How to make herb to targets
#'
#' @param x is the information adout herb
#' @param type is the type of the x
#' @param tSource is the source of targets
#' @param output is the type of return
#' @return symbol and fullname
#' @export
#'
#' @examples
#' .h2t(x='Ziziphi Spinosae Semen',type='latin',tSource="tcmsp",output='symbol')
#' .h2t(x='Ziziphi Spinosae Semen',type='latin',tSource="pubchem",output='symbol')
#' .h2t(x='huangqi',type='pinyin',tSource="tcmsp",output='both')
#' h2t(x=c('Ziziphi Spinosae Semen','Abri Herba'),type='latin',tSource="pubchem",output='symbol')
#' h2t(x=c('Ziziphi Spinosae Semen','Abri Herba'),type='latin',tSource="tcmsp",output='both')
h2t<-function(x,type="latin",tSource="tcmsp",output="symbol")
{
  y<-lapply(x,.h2t,type=type,tSource=tSource,output=output)
  names(y)<-(data.frame(x))$x
  y
}
#' @export
.h2t<-function(x,type="latin",tSource="tcmsp",output="symbol")
  {
  {
    type <- match.arg(type,c("latin","pinyin","chinese"))
    tSource <- match.arg(tSource,c("tcmsp","pubchem"))
    output <- match.arg(output,c("symbol","both"))
    if(length(x)>1)
      stop("Length of x must be 1!")
    else if(type=="pinyin")
      x<-drug[pinyin%in%tolower(x),]$latin
    else if(type=="chinese")
      x<-drug[chinese%in%x,]$latin
  }
  m <- unique(.h2m(x,type='latin')$cid)
  {
    if(length(x)==1)
    {
      if(output=="symbol")
      {
        if(tSource=="tcmsp")
          y <- m2t(x=m,type = "cid",tSource = "tcmsp")
        else
          y <- m2t(x=m,type = "cid",tSource = "pubchem")
      }
      else
      {
        if(tSource=="tcmsp")
          y <- drugtarget[herb==x,][,c(3,4,20,1,21,5,13)]
        else
          y <- pubchemtarget[herb==x,][,c(1,2,3,4)]
          }
    }
    else
      y<-NA
  }
  y[y==""]<-NA
  y
}
