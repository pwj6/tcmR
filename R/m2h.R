#' How to make molecule to herb
#'
#' @param x is molecule or cid
#' @param type is the class of x
#' @param OB is characteristic value of x
#' @param DL is characteristic value of x
#'
#' @return herb information
#' @export
#'
#' @examples
#' m2h(x=c('thalifendine','MTL'),type='molecule',OB='30',DL='0.18')
#' m2h(x=c('thalifendine','rosthorin A'),type='molecule',OB='10',DL='0.01')
#' .m2h(x=c('thalifendine',type='molecule',OB='30',DL='0.18')
#' m2h(x=c('445858','31423'),type='cid',OB='30',DL='0.18')
#' m2h(x=c('445858','31423'),type='cid',OB='15',DL='0.02')
m2h<-function(x,type="cid",OB="30",DL="0.18")
{
   y<-lapply(x,.m2h,type=type,OB=OB,DL=DL)
  names(y)<-(data.frame(x))$x
y
}
#' @export
.m2h<- function(x,type="cid",OB="30",DL="0.18"){
  {
    type <- match.arg(type,c("cid","molecule"))
    if(length(x)>1)
      stop("Length of x must be 1!")
  }
  {
    if(type=="cid")
      y<-drugchem[cid==x&ob>=OB&dl>=DL,][,c(2,3,4,12,14)]
    else
      y<-drugchem[molecule==x&ob>=OB&dl>=DL,][,c(2,3,4,12,14)]
  }
  y<-y[!duplicated(y$herb),]
  y
}
