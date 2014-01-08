\encoding{utf8}
\name{TBuildList}
\alias{TBuildList}
\title{
Construction of a list of regular and irregular histograms, kernel and parametric estimators.
}
\description{
Given a sample X, builds a list containing all the desired estimators with specified smoothing parameters.
}
\usage{
TBuildList(X,family=c("Kernel","RegularHisto","IrregularHisto","Parametric"),
	kerneltab=NULL,bwtab=NULL,Dmax=NULL,Dtab=NULL)
}

\arguments{
  \item{X}{
	numeric vector. The sample to build the estimators.
}
  \item{family}{
	vector of estimator types. Default family=c("Kernel", "RegularHisto", "IrregularHisto", "Parametric"). Has to be a subset of the default value.
}
  \item{kerneltab}{
	vector of kernel types, required when the family argument contains 'Kernel'. Should be available types of the generic function 'density'. 

	If NULL (default) kerneltab="epanechnikov". 
}
  \item{bwtab}{
	numeric vector of bandwidths, required when the family argument contains 'Kernel'.
	
	If NULL (default) bwtab = diff(range(X))/2/(ceiling(n/log(n)):1). 
}
  \item{Dmax}{
	maximum number of bins, required when the family argument contains 'RegularHisto' or 'IrregularHisto'.

	If NULL (default) Dmax=ceiling(n/log(n)). 
}
  \item{Dtab}{
	vector of number of bins. See \code{\link{TBuildRegularHisto}}.
	
	If NULL (default) Dtab=1:Dmax. 
	
}
}

\value{
TBuildList returns a list containing all constructed estimators, each one consisting in a descriptor list.
}
\references{
N. Magalhães and Y. Rozenholc, "A non-combinatorial algorithm for T-estimation", (2014).
}
\author{
Nelo Magalhães and Yves Rozenholc.
}
\seealso{
	\code{\link{DensityTestim}}, \code{\link{TBuildRegularHisto}}, \code{\link{TBuildIrregularHisto}}, \code{\link{TBuildKernel}}, \code{\link{TBuildParametric}}
}

\examples{
\dontrun{
## list of estimators containing the regular histograms with number of bins varying 
## between 1 and 150, kernel estimators using triangular kernel and parametric estimators 
## build from a normal sample of size 1000:
TBuildList(X=rnorm(1000),family = c("Kernel", "RegularHisto","Parametric"), 
	kerneltab = 'triangular',Dmax=150)

## list of estimators containing irregular histograms and kernel estimators 
## with bandwidths 2^-j, j=1:,...,ceiling(log(length(X))), build from an exponential 
## sample X of size 500:
TBuildList(X=rexp(500),family = c("IrregularHisto","Kernel"),
	bwtab=2^-c(1:ceiling(log(length(X)))))
}
}
