\encoding{utf8}
\name{TBuildKernel}
\alias{TBuildKernel}
\title{
Kernel estimator list constructor.
}
\description{
Given a sample X, builds the family of kernel estimators using generic function 'density'.
}
\usage{
TBuildKernel(X, n = length(X), bwtab = NULL, kerneltab = NULL)
}

\arguments{
  \item{X}{
	numeric vector. The sample to build the kernel estimators.
}
  \item{n}{
	size of the sample.
}
  \item{bwtab}{
	numeric vector of bandwidths. 
	
	If NULL (default) bwtab = diff(range(X))/2/(ceiling(n/log(n)):1).
}
  \item{kerneltab}{
	vector of kernel types. Should be available types of the generic function 'density'.
	
	If NULL (default) kerneltab = "epanechnikov". 
}
}
\details{
We refer to the 'density' function in the 'stats' package for more details about the different options available.
}
\value{
TBuildKernel returns a list with components
	\item{f}{gives the explicit expression of the corresponding density function,}
	\item{cuts}{gives the vector of break points,}
	\item{descript}{list containing:
		\itemize{
		\item{'kernel'}{nature of the estimator,}
		\item{kernel}{type of kernel,}
		\item{bw}{value of the bandwidth.}
		}
	}
}
\references{
'density' generic function in the 'stats' library: \url{http://127.0.0.1:14946/library/stats/html/density.html}

N. Magalhães and Y. Rozenholc, "A non-combinatorial algorithm for T-estimation", (2014).
}
\author{
Nelo Magalhães and Yves Rozenholc.
}
\seealso{
	\code{\link{DensityTestim}}, \code{\link{TBuildList}}, \code{\link{TBuildRegularHisto}}, \code{\link{TBuildIrregularHisto}}, \code{\link{TBuildParametric}}
}


\examples{
\dontrun{
## build epanechnikov and triangular kernel estimators for a sample of the gamma density: 
## with parameters 2 and 3:
TBuildKernel(X=rgamma(1000,2,3),kerneltab=c('epanechnikov','triangular'))
}
}
