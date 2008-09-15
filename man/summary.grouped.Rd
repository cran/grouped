\name{summary.grouped}
\alias{summary.grouped}
\title{ Summary method for grouped objects }
\description{
  Summarizes the fit of \code{grouped} objects.
}
\usage{
\method{summary}{grouped}(object, ...)
}

\arguments{
  \item{object}{an object of class \code{grouped}.}
  \item{\dots}{additional parameters; currently none is used.}
}
\details{
  \code{summary.grouped} provides summaries of the fit for \code{grouped} objects, including
  computation of Wald tests for the estimated parameters.
}
\value{
  a list of class \code{summ.grouped} with the following components:
  \item{object}{the fitted \code{object}.}
  \item{coefficients}{a numeric matrix containing the estimated coefficients, their standard errors, \eqn{t}-values and
                        \eqn{p}-values.}
  \item{sigma}{the estimated standard deviation of the underlying latent variable.}
  \item{se.sigma}{the estimated standard error for the estimation of \code{sigma}.}
  \item{logLik}{the value of the log-likelihood under the estimated parameters.}
  \item{AIC}{the AIC under the fitted model.}
  \item{BIC}{the BIC under the fitted model.}
}

\author{
    Dimitris Rizopoulos \email{d.rizopoulos@erasmusmc.nl}
}

\seealso{ \code{\link{grouped}} }
\examples{

m1 <- grouped(cbind(lo, up) ~ treat * x, link = "logit", data = Sdata)
summary(m1)
    
m2 <- grouped(equispaced(r, n) ~ x1 * x2, link = "logit", data = Seeds)
summary(m2)

}
\keyword{ methods }
