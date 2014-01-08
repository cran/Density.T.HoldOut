\encoding{utf8}
\name{TBuildParametric}
\alias{TBuildParametric}
\title{
Parametric estimator list constructor.
}
\description{
Given a sample X, builds the family of the parametric estimators for the unif, norm, lnorm, beta, exp, gamma and chisq densities of the 'stats' library obtained from the method of moments.
}
\usage{
TBuildParametric(X, namelist = NULL)
}
\arguments{
  \item{X}{
	numeric vector. The sample to build the parametric estimators.
}
  \item{namelist}{
	list of all desired parametric estimators. 
	If NULL (default) namelist=c("unif", "norm", "exp", "lnorm", "gamma","chisq", "beta"). 
	Selected list has to be a subset of the default list.
}
}
\details{
	For a sample following an unknown density, all estimators are build in the following way. When:
	name='unif', the one-bin histogram is built, 
	name='norm', the parametric guassian estimator is built,
	name='lnorm', the parametric log-normal estimator is built only if min(X)>0, 
	name='exp', the parametric exponential estimator is built only if min(X)>0, 
	name='gamma', the parametric gamma estimator is built only if min(X)>0, 
	name='chisq', the parametric chi-square estimator is built only if min(X)>0, 
	name='beta', the parametric beta estimator is built only if min(X)>0 and max(X)<1.
}
\value{
TBuildParametric returns a list with components:
  \item{f}{explicit expression of the corresponding density function,}
  \item{cuts}{range of the estimator, given by the 1e-6 -quantiles,}
  \item{descript}{list containing:
		\itemize{
		\item{'parametric'}{nature of the estimator,}
		\item{name}{name of the estimator,}
		\item{par}{values of the estimated parameters.}
		}
	}
}
\references{
N. Magalhães and Y. Rozenholc, "A non-combinatorial algorithm for T-estimation", (2014).
}
\author{
Nelo Magalhães and Yves Rozenholc.
}
\seealso{
	\code{\link{DensityTestim}}, \code{\link{TBuildList}}, \code{\link{TBuildRegularHisto}}, \code{\link{TBuildIrregularHisto}}, \code{\link{TBuildKernel}}
}


\examples{
\dontrun{
## build log-normal and exponential parametric estimators for a sample of 
## the log-normal density:
TBuildParametric(X=rlnorm(1000),namelist=c('exp','lnorm'))
}
}
