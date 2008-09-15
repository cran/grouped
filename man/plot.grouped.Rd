\name{plot.grouped}
\alias{plot.grouped}
\title{ Plot method for grouped objects }
\description{
  Produces the plot of residuals versus the fitted values for a fitted \code{grouped} model.
}
\usage{
\method{plot}{grouped}(x, B = 100, sub.caption = deparse(formula(x)), ...)
}
\arguments{
  \item{x}{ an object of class \code{grouped}. }
  \item{B}{ the number of multiple imputations used to estimate the residuals (see \code{\link{residuals.grouped}}
            for more info). }
  \item{sub.caption}{ a sub-title to be used in the plot. }
  \item{\dots}{ extra graphical parameters to be passed in \code{plot}. }
}

\author{
    Dimitris Rizopoulos \email{d.rizopoulos@erasmusmc.nl}
}

\seealso{ \code{\link{grouped}} }
\examples{

m <- grouped(cbind(lo, up) ~ treat * x, link = "logit", data = Sdata)
plot(m)

}
\keyword{ hplot }
\keyword{ methods }
