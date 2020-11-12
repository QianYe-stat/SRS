#' SRSampling: take one or multiple simple random samples
#'
#' @param x the assumed population from which the SRS are chosen. It must be a vector with length > 1. NA in x can also be chosen.
#' @param size the sample size. the number of items to choose
#' @param replace whether sampling should be with replacement
#' @param rep the number of simulation runs. Default rep=1.
#' @param show.SRS whether to show SRS for each run of simulations
#' @param verbose whether to return verbose message
#' @param na.rm whether to remove NA when calculate summary statistics for SRS.
#' @param trim the fraction (0 to 0.5) of observations to be trimmed from each end of x before the mean is computed. Values of trim outside that range are taken as the nearest endpoint
#' @param ... additional arguments to be passed to or from methods.
#'
#' @return a list a list containing the following components, conditional on the argument `rep`:

#' When `rep=1` (the default):
#' \itemize{
#' \item `sample.mean`: a numeric number giving the mean of the SRS
#' \item `sample.se`: a numeric number giving the SD of the SRS
#' \item `SRS`: a matrix containing the values in the SRS with `nrow=1` and `ncol=size`. Available only if `show.SRS=TRUE`
#' }

#'  When `rep>1`:
#'  \itemize{
#'  \item `sample.mean`: a list containing the following components about sample means from multiple SRS:
#'    \itemize{
#'    \item `values`: a vector with a length of `rep` giving sample mean for each of the multiple SRS
#'    \item `mean`: a numeric number giving the mean of `values`
#'    \item `se`: a numeric number giving the mean of `values`
#'    }
#'  \item `sample.se`: a list containing the following components about sample sds from multiple SRS:
#'    \itemize{
#'    \item `values`: a vector with a length of `rep` giving sample sd for each of the multiple SRS
#'    \item `mean`: a numeric number giving the mean of `values`
#'    \item `se`: a numeric number giving the mean of `values`
#'    }
#'  \item `SRS`: a matrix containing the values in each of the multiple SRS with `nrow=rep` and `ncol=size`. Available only if `show.SRS=TRUE`.
#'  }

#' @export
#'
#' @examples
#' pop.1 <- rnorm(1000,0,10)
#' # take a SRS from x of size=10, show.SRS=TRUE
#' SRSampling(x=pop.1, size=10, show.SRS=TRUE)
#' # take 20 SRS from x of size=10, show.SRS=FALSE
#' SRSampling(x=pop.1, size=10, rep=20)
#'
#' # size>length(pop.2)
#' pop.2 <- rnorm(10,0,10)
#' # SRSampling(x=pop.2, size=15, rep=20) # error
#'
#' # non-integer size
#' SRSampling(x=pop.2, size=5.8) # warning
#'
#' # x=numeric(0)
#' # SRSampling(x=numeric(0), size=1) # error
#'
#' # x with NA
#' pop.3 <- c(1,2,3,4,NA)
#' SRSampling(x=pop.3, size=5, na.rm=TRUE)
#' SRSampling(x=pop.3, size=5)


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
    sample.se <- stats::sd(samp, na.rm=na.rm, ...)
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
      temp.se <- stats::sd(temp, na.rm=na.rm, ...)
      samp[i,] <- temp
      samp.mean <- c(samp.mean, temp.mean)
      samp.se <- c(samp.se, temp.se)
    }
    mean.samp.mean <- mean(samp.mean, trim=trim, na.rm=na.rm, ...)
    se.samp.mean <- stats::sd(samp.mean, na.rm=na.rm)
    mean.samp.se <- mean(samp.se, trim=trim, na.rm=na.rm, ...)
    se.samp.se <- stats::sd(samp.se, na.rm=na.rm)

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
