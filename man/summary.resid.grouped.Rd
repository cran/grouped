\name{summary.resid.grouped}
\alias{summary.resid.grouped}
\title{ Summary method for resid.grouped objects }
\description{
  The main use of this function is for identification of outliers.
}
\usage{
\method{summary}{resid.grouped}(object, K = 2, observed = NULL, ...)
}
\arguments{
  \item{object}{an object of class \code{resid.grouped}.}
  \item{K}{the cutoff point to identify outliers }
  \item{observed}{a numeric vector of possible observed data, e.g., the mean of
  the interval in which the true data lie.}
  \item{\dots}{additional arguments; currently none is used.}
}
\details{
  Taking into advantage the realizations of the standardized residuals \eqn{r_i} provided by the Multiple Imputation 
  scheme, we can estimate the probability \deqn{Pr(|r_i| > K),  i = 1,\ldots,n,} which can be regarded as the 
  probability of the \eqn{i}th sample unit being an outlier. 
}
\value{a numeric matrix with columns, the fitted values, the estimated residuals, and the percentage of each sample unit 
having an absolute residual greater than the value given by \code{K}. If \code{!is.null(observed)} its value is given as
the first column of the matrix.}

\author{
    Dimitris Rizopoulos \email{d.rizopoulos@erasmusmc.nl}
}

\seealso{ \code{\link{residuals.grouped}} }
\examples{

m <- grouped(cbind(lo, up) ~ treat * x, link = "logit", data = Sdata)
summary(resid(m, TRUE))

}
\keyword{ methods }
