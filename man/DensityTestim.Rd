\encoding{utf8}
\name{DensityTestim}
\alias{DensityTestim}
\title{
Non-combinatorial T-estimation Hold-Out for density estimation.
}
\description{
Main function:

Estimation of the density of a given sample by a Hold-Out procedure derived from the T-estimation 
using the algorithms introduced in Magalhães and Rozenholc (2014). 

The sample is divided into one training sample, used to build a set of potential estimators 
via the \code{\link{TBuildList}} function, and one validation sample, used to select one estimator 
from this set using T-estimation as introduced in Birgé(2006).  
}
\usage{
DensityTestim(X,p=1/2,family=NULL,test=c('birge','baraud'),theta=1/4,
	last=c('full','training'),plot=TRUE,verbose=TRUE,wlegend=TRUE,kerneltab=NULL,
	Dmax=NULL,bwtab=NULL,do.MLHO=FALSE,do.LSHO=FALSE,start=c('LSHO','MLHO'),csqrt=1,
	H2dist=NULL,allImageX2=NULL,flist=NULL,...)			
}

\arguments{
  \item{X}{
	numeric vector. The sample to which the density T-estimation Hold-Out procedure is applied.
}
  \item{p}{
	proportion of the sample used in the training sample X[1:ceiling(p*n)] to build the family of estimators. Default 1/2.
}
  \item{family}{
	estimator family name(s). If family is NULL (default), use family = c("Kernel", "RegularHisto", "IrregularHisto", "Parametric").
}
  \item{test}{
	either 'birge' (default) or 'baraud'. Controls the test used in the T-estimation. Default value 'birge' implements T-estimation as introduced in Birgé (2006) while 'baraud' use its modified version using the test derived from Baraud (2011).
}
  \item{theta}{
	parameter which controls the radius of test balls. Has to be smaller than 1/2 (cf. Magalhães and Rozenholc (2014)). Default 1/4.
}
  \item{last}{
	either 'training' or 'full' (default) controlling if the resulting estimator is build with the training sample only or the full sample. 
}
  \item{plot}{
	logical (default TRUE), controls if plot are displayed.
}
  \item{verbose}{
	logical (default TRUE), controls if the estimator description is printed.
}
  \item{wlegend}{
	logical (default TRUE); controls if a legend is written on the plot.
}
  \item{kerneltab}{
	vector of all desired kernel types. Only required when 'family' contains 'Kernel'. 
	
	If NULL (default), use kerneltab = "epanechnikov".
}
  \item{Dmax}{
	maximum number of bins. Only required when 'family' contains 'RegularHisto' or 'IrregularHisto'. 
	
	If NULL (default), use Dmax=ceiling(n/log(n)).
}
  \item{bwtab}{
	vector of bandwidth values. Only required when the family argument contains 'Kernel'. 
	
	If NULL (default), use bwtab = diff(range(X))/2/(ceiling(n/log(n)):1).
}
  \item{do.MLHO}{
	logical (default FALSE). If TRUE, the Maximum Likelihood Hold-Out is computed.
}
  \item{do.LSHO}{
	logical (default FALSE). If TRUE, the Least-Squares Hold-Out is computed.
}
\item{start}{
	starting point of the algorithm, either 'LSHO' (default) or 'MLHO'. 
}
\item{csqrt}{
	numeric (Default 1). If 0 the exact T-estimation is computed. Otherwise a faster but approximate T-estimator is computed based on estimators separated by an Hellinger distance larger than c/sqrt((1-p)*n). (See Magalhães and Rozenholc (2014) for more details)
}
\item{H2dist}{
	not documented. Only for simulation purpose.
}
\item{allImageX2}{
	not documented. Only for simulation purpose.
}
\item{flist}{
	not documented. Only for simulation purpose.
}
\item{...}{
	for other options when plot is TRUE, as in the plot function.
}
}
\details{
More details about the algorithm and its implementation may be found in Magalhães and Rozenholc (2014).  
}
\value{
DensityTestim returns a list with components
	\item{THO}{descriptor of the T-Hold-Out estimate. }
	\item{MLHO}{descriptor of the Maximum Likelihood Hold-Out estimate if do.MLHO=TRUE}
	\item{LSHO}{descriptor of the Least-Squares Hold-Out estimate if do.LSHO=TRUE}
	\item{M}{number of considered estimators}
	\item{comput}{number of tests needed to select the T-Hold-Out}
	\item{total}{M*(M-1)/2}
	\item{H2dist}{not documented. Only for simulation purpose.}
	\item{allImageX2}{not documented. Only for simulation purpose.}
	\item{flist}{not documented. Only for simulation purpose.
}
Moreover if plot=TRUE, the chosen estimator is plotted together with the one chosen by the LSHO (default).
}
\references{
N. Magalhães and Y. Rozenholc, "A non-combinatorial algorithm for T-estimation Hold-Out" (2014)

L. Birgé, "Model selection via testing: an alternative to (penalized) maximum likelihood estimators.", Ann. Institut Henri Poincaré Probab. et Statist., 42, 273--325, (2006)

}
\author{
Nelo Magalhães and Yves Rozenholc.
}
\seealso{
	\code{\link{TBuildList}}, \code{\link{TBuildRegularHisto}}, \code{\link{TBuildIrregularHisto}}, \code{\link{TBuildKernel}}, \code{\link{TBuildParametric}}
}

	
\examples{
\dontrun{
	
### load the package
library(Density.T.HoldOut)

### Estimation of the beta density with parameters 5 and 2 from a sample of size 1000:
X=rbeta(1000,5,2)
DensityTestim(X)
x = seq(min(X),max(X),l=500)
lines(x,dbeta(x,5,2),col='green',lty=3)
title('T-estimation and Least-Squares Held-Out')


### Estimation of the lognormal density from a sample of size 500 via a set of regular 
### histograms and parametric estimators build with 3/4 of the sample,
### provide as final estimator the one build with the training sample only:
X=rlnorm(500)
DensityTestim(X,p=3/4,family=c('RegularHisto','Parametric'),last=c('partial'))
x = seq(min(X),max(X),l=500)
lines(x,dlnorm(x),col='green',lty=3)
title('T-estimation and Least-Squares Held-Out')


### Estimation of the chi-square density with 5 degrees of freedom from a sample of 
### size 250 via a set of regular and irregular histograms and kernel estimators with 
### triangular and epanechnikov kernels, start from the maximum likelihood HO estimator:
X=rchisq(250,5)
DensityTestim(X,family=c('RegularHisto','IrregularHisto','Kernel'),
	kerneltab=c('triangular','epanechnikov'),start=c('MLHO'))
x = seq(min(X),max(X),l=500)
lines(x,dchisq(x,5),col='green',lty=3)
title('T-estimation and Max. Likelihood Hold-Out')


### Estimation of a normal mixture from a sample of size 1000 via a set of kernel 
### estimators, provide also the maximum likelihood HO estimator:
n=ceiling(runif(1)*1000)
X=c(rnorm(n,mean=5,sd=0.1),rnorm(1000-n))
DensityTestim(X,family=c('Kernel'),do.MLHO=TRUE)
x = seq(min(X),max(X),l=500)
lines(x,n/1000*dnorm(x,mean=5,sd=0.1)+(1000-n)/1000*dnorm(x),col='green',lty=3)
title('T-estimation, Least-Squares and Max. Likelihood Hold-Out')


### Estimation of the gaussian density from a sample of size 500 via a set of regular 
### and irregular histograms estimators, start from the maximum likelihood HO estimator,
### uses the greedy version with constant 1/16:
X=rnorm(500)
DensityTestim(X,family=c('RegularHisto','IrregularHisto'),start=c('MLHO'),csqrt=1/16)
x = seq(min(X),max(X),l=500)
lines(x,dnorm(x),col='green',lty=3)
title('T-estimation and Max. Likelihood Hold-Out')
}
}
