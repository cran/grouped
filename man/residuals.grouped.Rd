\name{residuals.grouped}
\alias{residuals.grouped}
\title{ Residuals for grouped objects }
\description{
  Computes a version of Bayesian latent residuals for \code{grouped} models.
}
\usage{
\method{residuals}{grouped}(object, standardized = FALSE, B = 100, ...)
}
\arguments{
  \item{object}{an object of class \code{grouped}.}
  \item{standardized}{logical; if \code{TRUE} the standardized residuals are computed.}
  \item{B}{the number of multiple imputations to be used to estimate the residuals.}
  \item{\dots}{additional parameters; currently none is used.}
}
\details{
  In a grouped-data setting the ordinary definition of residuals is problematic since, in fact the value of
  the true response is known only up to the interval in which it lies. A possible solution to this
  problem provides the notion of Bayesian residuals (see e.g., Johnson and Albert, Section 3.4). In particular, 
  the Bayesian residuals in the grouped-data setting are defined as follows: \deqn{r_i=Z_i - x_i^t\beta,} where 
  \eqn{Z_i} denotes the value of the underlying true response of the \eqn{i}th sample unit, \eqn{x_i^t} is the 
  covariate vector of the \eqn{i}th sample unit, \eqn{\beta} are the regression coefficients and let also \eqn{Y_i} 
  denote the observed data.
  
  An estimation for \eqn{r_i} can be obtained under the following Multiple Imputation (MI) scheme:
  \describe{
    \item{Step 1:}{Simulate new parameter values, say \eqn{\theta^*}, from \eqn{N(\hat{\theta}, C(\hat{\theta}))},
    where \eqn{\hat{\theta}} are the MLEs (including both \eqn{\beta} and \eqn{\sigma}, see \code{\link{grouped}}) 
    and \eqn{C(\hat{\theta})} is their large sample covariance matrix.}
    \item{Step 2:}{Draw a value, say \eqn{z_i^*}, from the predictive distribution \eqn{Z_i|Y_i} under \eqn{\theta^*} 
    and compute the residuals \eqn{r_i^*=z_i^*-x_i^t\beta^*}. In fact, \eqn{p(z_i|y_i; \theta^*=(\beta^*, \sigma^*))} 
    is a truncated \eqn{F} distribution in the interval given by \eqn{y_i}, where \eqn{F} denotes the distribution
    implied by the value of the \code{distribution} argument used in \code{\link{grouped}}.}
    \item{Step 3:}{Repeat steps 1-2 \code{B} times and combine the estimates using the known formulas of MI.}
  }
  
  This procedure explicitly acknowledges the ignorance of the true parameter values by drawing from their large sample
  posterior distribution while taking into account the sampling error.

}
\value{
  an object of class \code{resid.grouped} with the following components:
  \item{residuals}{a vector of the estimated residuals.}
  \item{mat.res}{a numeric matrix containing the \eqn{B} realization of the latent residuals. 
                If \code{standardized = TRUE}, then \code{mat.res} contains the values of \eqn{r_i^*/\sigma^*}.
                See \bold{Details} above.}
  \item{nam.res}{a character vector specifying the sample units names.}
  \item{B}{the value of the \code{B} argument defined above.}
  \item{standardized}{the value of the \code{standardized} argument defined above.}
  \item{fitted}{a numeric vector of the fitted values of \code{object}.}
}
\references{
    Johnson, V. and Albert, J. (1999), \emph{Ordinal Data Modeling}, New York: Springer-Verlag.
}

\author{
    Dimitris Rizopoulos \email{dimitris.rizopoulos@med.kuleuven.be}
}

\seealso{
    \code{\link{grouped}},
    \code{\link{summary.resid.grouped}}
}

\examples{

m1 <- grouped(cbind(lo, up) ~ treat * x, link = "logit", data = Sdata)
resid(m1)
    
m2 <- grouped(equispaced(r, n) ~ x1 * x2, link = "logit", data = Seeds)
resid(m2)

}
\keyword{methods}
