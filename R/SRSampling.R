SRSampling <- function(x, size, replace=FALSE, rep=1, show.SRS=FALSE,
                       verbose=TRUE, na.rm=FALSE, trim=0,...){

  # set constraints for the input arguments

  if(length(x)<=1|!is.numeric(x))
    stop("x must be a numeric vector with length >1")

  if(size<=0|!is.numeric(size)|length(size)>1)
    stop("size must be a single positive numeric argument")
  else if(!is_wholenumber(size)){
    warning(paste("size=",size," is not an integer, and ceiling() function was applied.\n size=", ceiling(size), " was used\n", sep=""))
    size=ceiling(size)
  }

  if(size>length(x))
    stop("size must be no greater than the length of x")
  if(size==length(x))
    warning("\nsize is equal to the length of x\n")

  if(rep<=0|!is.numeric(rep)|length(rep)>1)
    stop("rep must be a single positive numeric argument")
  else if(!is_wholenumber(rep)){
    warning(paste("rep=",rep," is not an integer, and ceiling() function was applied.\n rep=", ceiling(rep), " was used\n", sep=""))
    rep=ceiling(rep)
  }

  ## if rep=1; only a single SRS is taken ##
  ## return SRS(optional), sample mean, sample SD ##
  if(rep==1){
    if(verbose) cat("A simple random sample of size",size,"is drawn from x\n")
    samp <- matrix(sample(x=x, size=size, replace=replace), nrow=1)
    sample.mean<- mean(samp, trim=trim, na.rm=na.rm, ...)
    sample.se <- sd(samp, na.rm=na.rm, ...)
  }

  ## if rep>1; multiple SRS is taken ##
  ## return SRS(optional),
  ## a vector of sample means; mean and SD for these sample means ##
  ## a vector of sample SDs; mean and SD for these sample SDs ##
  if(rep>1){
    if(verbose) cat(rep,"runs of simple random sample of size",size,"are drawn from x\n")
    samp <- matrix(NA,ncol=size, nrow=rep)
    samp.mean <- c()
    samp.se <- c()
    for(i in 1:rep){
      # if(verbose==T) cat("\nThe ",i,"-th run of simulation\n", sep="")
      temp <- sample(x=x, size=size, replace=replace)
      temp.mean<- mean(temp, trim=trim, na.rm=na.rm, ...)
      temp.se <- sd(temp, na.rm=na.rm, ...)
      samp[i,] <- temp
      samp.mean <- c(samp.mean, temp.mean)
      samp.se <- c(samp.se, temp.se)
    }
    mean.samp.mean=mean(samp.mean, trim=trim, na.rm=na.rm, ...)
    se.samp.mean=sd(samp.mean, na.rm=na.rm)
    mean.samp.se=mean(samp.se, trim=trim, na.rm=na.rm, ...)
    se.samp.se=sd(samp.se, na.rm=na.rm)

    sample.mean <- list(values=samp.mean, mean=mean.samp.mean, se=se.samp.mean)
    sample.se <- list(values=samp.se, mean=mean.samp.se, se=se.samp.se)
  }
  if(show.SRS==T){
    if(verbose) cat("\nThe SRS for each run of samplings are shown in the result\n\n")
    result<- list(sample.mean=sample.mean, sample.se=sample.se, SRS=samp)
  }
  if(show.SRS==F){
    if(verbose) cat("\nThe SRS for each run of samplings are NOT included in the result\n\n")
    result<- list(sample.mean=sample.mean, sample.se=sample.se)
  }
  return(result)
}
