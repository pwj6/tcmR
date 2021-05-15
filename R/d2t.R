#' How to make disease to target
#'
#' @param x is diseaseID or disease
#' @param type is the class of x
#' @param score is the limitation of score
#' @return target symbol and score
#' @export
#'
#' @examples
#' .d2t(x='C0009375',type='diseaseID',score=0.3)
#' d2t(x=c('C0009375','C0271979'),type='diseaseID',score=0.4)
#' .d2t(x='Schizophrenia',type='disease',score=0.3)
#' d2t(x=c('Schizophrenia','beta Thalassemia'),type='disease',score=0.4)
d2t<-function(x,type="diseaseID",score=0.3)
{
  y<-lapply(x,.d2t,type=type,score=score)
  names(y)<-(data.frame(x))$x
  y
}
#' @export
.d2t<-function(x,type="diseaseID",score=0.3){
  S <- score
  {
    type <- match.arg(type,c("diseaseID","disease"))
    if(length(x)>1)
      stop("Length of x must be 1!")
  }
  {
    if(type=="diseaseID")
      y<-diseasetarget[diseaseID==x&score>=S,][,c(1,4)]
    else
      y<-diseasetarget[disease==x&score>=S,][,c(1,4)]
  }
  y
}
