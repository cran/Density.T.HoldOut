\encoding{utf8}
\name{TBuildIrregularHisto}
\alias{TBuildIrregularHisto}
\title{
Irregular histogram estimator list constructor.
}
\description{
Given a sample X, builds the family of irregular histograms using the procedure described in the 'histogram' package.
}
\usage{
TBuildIrregularHisto(X,n=length(X),Dmax=NULL,greedyfirst=TRUE,
	grid=c("data","regular","quantiles"),breaks=NULL,verbose=FALSE)
}
\arguments{
  \item{X}{
	numeric vector. The sample to build the irregular histograms.
}
  \item{n}{
	size of the sample.
}
  \item{Dmax}{
	maximum number of bins allowed.
}
  \item{greedyfirst}{
	logical; if TRUE (default), a greedy procedure is used to recursively build a finest partition as provided by 'histogram'.
}
  \item{grid}{
	if type="irregular", grid chooses the set of possible partitions of the data range. The default value "data" gives a set of partitions constructed from the data points, "regular" uses a fine regular grid of points as possible break points. A regular quantile grid can be chosen using "quantiles". 
}
  \item{breaks}{
	controls the maximum number of bins allowed in a regular histogram, or the size of the finest grid in an irregular histogram when grid is set to "regular" or "quantiles".
}
  \item{verbose}{
	logical; if TRUE (default), some information is given during histogram construction and the resulting histogram object is printed.
}
}
\details{
We refer to the 'histogram' package for more details about the construction of these irregular histograms and for the different options available.
}
\value{
TBuildIrregularHisto returns a list with components:
	\item{f}{gives the explicit expression of the corresponding density function,}
	\item{cuts}{gives the vector of break points (the same as breaks in histo),}
	\item{descript}{list containing:
		\itemize{
		\item{'histo'}{nature of the estimator,}
		\item{D}{number of bins of the estimator,}
		\item{breaks}{vector of break points.}
		}
	}
}
\references{
'histogram' R-package: \url{http://cran.r-project.org/web/packages/histogram/index.html}.

Y. Rozenholc, T. Mildenberger and U. Gather: "Combining Regular and Irregular Histograms by Penalized Likelihood", Computational Statistics and Data Analysis, 54(12), 3313-3323 (2010).

N. Magalhães and Y. Rozenholc, "A non-combinatorial algorithm for T-estimation", (2014).
}
\author{
Nelo Magalhães and Yves Rozenholc.
}
\seealso{
	\code{\link{DensityTestim}}, \code{\link{TBuildList}}, \code{\link{TBuildRegularHisto}}, \code{\link{TBuildKernel}}, \code{\link{TBuildParametric}}
}



\examples{
\dontrun{
## build irregular histograms for a sample of the normal density:
TBuildIrregularHisto(X=rnorm(1000))
}
}

