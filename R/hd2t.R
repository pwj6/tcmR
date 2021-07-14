#' How to make herb and disease to target
#'
#' @param hb is the name of the drug
#' @param Disease is the name of the disease
#' @param htype is the type of the hb
#' @param dtype is the type of the disease
#' @param tSource is the source of drug targets
#'
#' @return targets and other information
#' @export
#'
#' @examples
#' .hd2t(hb='mahuang',Disease='C0009375',htype='pinyin',dtype='diseaseID',tSource='tcmsp')
#' .hd2t(hb='mahuang',Disease='C0009375',htype='pinyin',dtype='diseaseID',tSource='pubchem')
#' .hd2t(hb='Abutili Semen',Disease='Colonic Neoplasms',htype='latin',dtype='disease')
#' hd2t(hb=c('mahuang','huangqi'),Disease='C0019209',htype='pinyin',dtype='diseaseID',tSource='pubchem')
#' hd2t(hb=c('mahuang','huangqi'),Disease='C0019209',htype='pinyin',dtype='diseaseID',tSource='tcmsp')
hd2t<-function(hb,Disease,htype="latin",dtype="diseaseID",tSource="tcmsp"){
  for(i in hb){
    for(m in Disease){
      print(lapply(i,Disease=m,.hd2t,htype=htype,dtype=dtype,tSource=tSource))
    }
  }
}
.hd2t <- function(hb,Disease,htype="latin",dtype="diseaseID",tSource="tcmsp"){
  {
    htype <- match.arg(htype,c("latin","pinyin","chinese"))
    dtype <- match.arg(dtype,c("diseaseID","disease"))
    tSource <- match.arg(tSource,c("tcmsp","pubchem"))
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
    {
      if(tSource=="tcmsp" )
        y <- .h2t(x=hb,type='latin',tSource="tcmsp",output='both')
      else
        y <- .h2t(x=hb,type='latin',tSource="pubchem",output='both')
    }
    else
      y<-NA
  }
  {
    if(length(hb)==1)
      m <- .h2m(x=hb,type='latin')
    else
      m <-NA
  }
  {
    if(dtype=="diseaseID")
      z<-diseasetarget[diseaseID==Disease,]
    else
      z<-diseasetarget[disease==Disease,]
  }
  y <- unique(y)
  y[y==""]<-NA
  m<-m[!duplicated(m$molecule),]
  n<-intersect(unique(y$symbol),unique(z$symbol))
  n<-data.frame(n)
  names(n)<-"samesymbol"
  l <- list(y,z,m,n)
  names(l)<-c("drug_target","disease_target","drug_chemical","drug_disease_target")
  l
}
