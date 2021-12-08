#' how to make herb to molecule or cid of molecule
#'
#' @param x the name of drug
#' @param type the type of drug name
#' @param OB the oral bioavailability of the compound
#' @param DL the drug-like properties of compounds
#' @return molecule and cid
#' @export
#'
#' @examples
#' .h2m(x='Ziziphi Spinosae Semen',type='latin')
#' .h2m(x='houpu',type='pinyin',OB=40,DL=0.2)
#' h2m(x=c('Ziziphi Spinosae Semen','Abri Herba'),type='latin')
h2m<-function(x,type="latin",OB=30,DL=0.18)
{
  y<-lapply(x,.h2m,type=type,OB=OB,DL=DL)
  names(y)<-(data.frame(x))$x
  y
}
#' @export
.h2m<-function(x,type="latin",OB=30,DL=0.18){
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
      y <- drugchem[herb==x&ob>=OB&dl>=DL,][,c("molecule","molecule_id","cid","ob","dl")]
    else
      y<-NA
  }
  y<-y[!duplicated(y$molecule),]
  y
}


