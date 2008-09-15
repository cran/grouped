\name{anova.grouped}
\alias{anova.grouped}
\title{ Anova method for grouped objects }
\description{
  Performs a Likelihood Ratio Test between two nested \code{grouped} models.
}
\usage{
\method{anova}{grouped}(object, object2, ...)
}
\arguments{
  \item{object}{ an object inheriting from class \code{grouped}, nested to \code{object2}. }
  \item{object2}{ an object inheriting from class \code{grouped}. }
  \item{\dots}{ additional arguments; currently none is used. }
}
\value{
  a list of class \code{aov.grouped} with the following components:
  \item{name0}{the name of the null model represented by \code{object}.}
  \item{L0}{the log-likelihood under \code{object}.}
  \item{df0}{the number of parameters in \code{object}.}
  \item{AIC0}{the AIC under \code{object}.}
  \item{BIC0}{the BIC under \code{object}.}
  \item{name1}{the name of the alternative model represented by \code{object2}.}
  \item{L1}{the log-likelihood under \code{object2}.}
  \item{df1}{the number of parameters in \code{object2}.}
  \item{AIC1}{the AIC under \code{object2}.}
  \item{BIC1}{the BIC under \code{object2}.}
  \item{L01}{the value of the likelihood ratio test statistic.}
  \item{p.value}{the \eqn{p}-value of the test.}
}
\note{
  \code{anova.grouped} performs a likelihood ratio test between two nested models; for simple Wald tests
  for the estimated parameters use \code{summary.grouped}.
}
\section{Warning}{
  The function does only partial checking whether the two models are nested; the user 
  is responsible to supply nested models in order to perform a valid test.
}

\author{
    Dimitris Rizopoulos \email{d.rizopoulos@erasmusmc.nl}
}

\seealso{ \code{\link{grouped}}, \code{\link{summary.grouped}} }
\examples{

m1 <- grouped(cbind(lo, up) ~ treat, link = "logit", data = Sdata)
m2 <- grouped(cbind(lo, up) ~ treat * x, link = "logit", data = Sdata)
anova(m1, m2)

m1 <- grouped(equispaced(r, n) ~ x1, link = "logit", data = Seeds)
m2 <- grouped(equispaced(r, n) ~ x1 * x2, link = "logit", data = Seeds)
anova(m1, m2)

}
\keyword{methods}
