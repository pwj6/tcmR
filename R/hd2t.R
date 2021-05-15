#' How to make herb and disease to target
#'
#' @param hb hb is the name of the drug
#' @param Disease is the name of the disease
#' @param htype is the type of the hb
#' @param dtype is the type of the disease
#'
#' @return targets and other information
#' @export
#'
#' @examples
#' hd2t(hb='mahuang',Disease='C0009375',htype='pinyin',dtype='diseaseID')
#' hd2t(hb='Abutili Semen',Disease='Colonic Neoplasms',htype='latin',dtype='disease')
hd2t <- function(hb,Disease,htype="latin",dtype="diseaseID"){
  {
    htype <- match.arg(htype,c("latin","pinyin","chinese"))
    dtype <- match.arg(dtype,c("diseaseID","disease"))

    if(length(hb)>1)
      stop("Length of hb must be 1!")
    else if(htype=="pinyin")
      hb<-drug[pinyin%in%tolower(hb),]$latin
    else if(htype=="chinese")
      hb<-drug[chinese%in%hb,]$latin
  }
  {
    if(length(Disease)>1)
      stop("Length of disease must be 1!")
  }
  {
    if(length(hb)==1)
      y <- drugtarget[herb==hb,][,c(3,4,1,21)]
    else
      y<-NA
  }
  {
    if(length(hb)==1)
      m <- drugchem[herb==hb,][,c(2,3,4,12,14)]
    else
      m <-NA
  }
  {
    if(dtype=="diseaseID")
      z<-diseasetarget[diseaseID==Disease,]
    else
      z<-diseasetarget[disease==Disease,]
  }
  y<-y[!duplicated(y$fullname),]
  y[y==""]<-NA
  m<-m[!duplicated(m$molecule),]
  n<-intersect(unique(y$symbol),unique(z$symbol))
  n<-data.frame(n)
  names(n)<-"samesymbol"
  l <- list(y,z,m,n)
  names(l)<-c("drug_target","disease_target","drug_chemical","drug_disease_target")
  l
}
