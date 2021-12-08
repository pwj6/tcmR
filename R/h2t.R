#' How to make herb to targets
#'
#' @param x the name of drug
#' @param type the type of the x
#' @param tSource the source of targets
#' @param output the type of return
#' @param OB the oral bioavailability of the compound
#' @param DL the drug-like properties of compounds
#' @return symbol and fullname
#' @export
#'
#' @examples
#' .h2t(x='Ziziphi Spinosae Semen',type='latin',tSource="tcmsp",output='symbol')
#' .h2t(x='Ziziphi Spinosae Semen',type='latin',tSource="pubchem",output='symbol')
#' .h2t(x='huangqi',type='pinyin',tSource="tcmsp",output='both',OB=45,DL=0.18)
#' h2t(x=c('Ziziphi Spinosae Semen','Abri Herba'),type='latin',tSource="pubchem",output='symbol',OB=40,DL=0.3)
#' h2t(x=c('Ziziphi Spinosae Semen','Abri Herba'),type='latin',tSource="tcmsp",output='both')
h2t<-function(x,type="latin",tSource="tcmsp",output="symbol",OB=30,DL=0.18)
{
  y<-lapply(x,.h2t,type=type,tSource=tSource,output=output,OB=OB,DL=DL)
  names(y)<-(data.frame(x))$x
  y
}
#' @export
.h2t<-function(x,type="latin",tSource="tcmsp",output="symbol",OB=30,DL=0.18)
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
  a <- OB
  b <- DL
  m <- unique(.h2m(x,type='latin',OB=a,DL=b)$cid)
  n <- unique(.h2m(x,type='latin',OB=a,DL=b)$molecule_id)
  {
    if(length(x)==1)
    {
      if(output=="symbol")
      {
        if(tSource=="tcmsp")
          y <- m2t(x=n,type = "molecule_id",tSource = "tcmsp")
        else
          y <- m2t(x=m,type = "cid",tSource = "pubchem")
      }
      else
      {
        if(tSource=="tcmsp")
          y <- drugtarget[herb==x&ob>=a&dl>=b,][,c("herb","molecule","molecule_id","cid","fullname","symbol","ob","dl")]
        else
          y <- pubchemtarget[herb==x&ob>=a&dl>=b,][,c("herb","molecule","molecule_id","cid","symbol","ob","dl")]
      }
    }
    else
      y<-NA
  }
  y[y==""]<-NA
  y
}
