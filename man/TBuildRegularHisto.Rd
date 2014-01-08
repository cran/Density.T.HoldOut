\encoding{utf8}
\name{TBuildRegularHisto}
\alias{TBuildRegularHisto}
\title{
Regular histogram estimator list constructor.
}
\description{
Given a sample X, builds the family of regular histograms using the procedure described in the 'histogram' package.
}
\usage{
TBuildRegularHisto(X, n = length(X), Dmax = NULL, Dtab = NULL)
}
\arguments{
	\item{X}{
		numeric vector. The sample to build the regular histograms.
	}
	\item{n}{
		size of the sample.
	}
	\item{Dmax}{
		maximum number of bins. If NULL (default) Dmax=ceiling(n/log(n)).
	}
	\item{Dtab}{
		vector of number of bins. If NULL (default) Dtab=1:Dmax.
	}
}
\details{
	We refer to the 'histogram' package for more details about the different options available.
}
\value{
	TBuildRegularHisto returns a list with components:
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
	'histogram' R-package: \url{http://cran.r-project.org/web/packages/histogram/index.html}

	Y. Rozenholc, T. Mildenberger and U. Gather: "Combining Regular and Irregular Histograms by Penalized Likelihood", Computational Statistics and Data Analysis, 54(12), 3313-3323 (2010).

	N. Magalhães and Y. Rozenholc, "A non-combinatorial algorithm for T-estimation", (2014).
}
\author{
	Nelo Magalhães and Yves Rozenholc.
}
\seealso{
	\code{\link{DensityTestim}}, \code{\link{TBuildList}}, \code{\link{TBuildIrregularHisto}}, \code{\link{TBuildKernel}}, \code{\link{TBuildParametric}}
}

\examples{
\dontrun{
	## build regular histograms for a sample of the lognormal density:
	TBuildRegularHisto(X=rlnom(1000))
	}
}

