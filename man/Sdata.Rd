\name{Sdata}
\alias{Sdata}
\docType{data}
\title{Simulated Data}
\description{
  A simulated data-set used for the illustration of \code{\link{grouped}} for grouped data 
  coming from a logit-normal distribution.
}
\format{
  A data frame with 250 observations on the following 4 variables:
  \describe{
    \item{\code{lo}}{the lower limits of the response intervals.}
    \item{\code{up}}{the upper limits of the response intervals.}
    \item{\code{treat}}{the treatment indicator.}
    \item{\code{x}}{a continuous covariate.}
  }
}
\details{
  The data set has been produced with the code in the \bold{Examples} below.
}

\author{
    Dimitris Rizopoulos \email{d.rizopoulos@erasmusmc.nl}
}

\examples{

\dontrun{
n <- 250
treat <- rbinom(n, 1, 0.5)
x <- runif(n, -4, 4)
mu <- 1 + 0.5 * treat -1 * x + 0.8 * treat * x
u <- plogis(rnorm(n, mu, 2))

index <- cbind(c(0, 0.25, 0.5, 0.75), c(0.25, 0.5, 0.75, 1)) 
a <- b <- numeric(n)
for(i in 1:n){
    ind <- which(index[, 2] - u[i] > 0)[1]
    a[i] <- index[ind, 1]
    b[i] <- index[ind, 2]
}
Sdata <- data.frame(lo = a, up = b, treat = factor(treat), x)
}

str(Sdata)
summary(Sdata)

}
\keyword{datasets}
