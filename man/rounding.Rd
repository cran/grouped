\name{rounding}
\alias{rounding}
\title{ Rounding Coarsening Mechanism }
\description{
  Creates the lower and upper limits of the interval in which the true response lies for grouped data
  in \eqn{[0, 1]}.
}
\usage{
rounding(y, m)
}

\arguments{
  \item{y}{ the score obtained or number of successes. }
  \item{m}{ the maximum score or number of trials. }
}

\details{
  Under the rounding coarsening mechanism, we assume that the true response lies in the interval
  \code{[y/m - 0.5/(m + 1), y/m + 0.5/(m + 1)]}.
}

\value{ a 2-dimensional matrix containing the lower and upper limits of the intervals. }

\author{
    Dimitris Rizopoulos \email{dimitris.rizopoulos@med.kuleuven.be}
}

\seealso{ \code{\link{grouped}} }
\examples{

rounding(Seeds$r, Seeds$n)

}
\keyword{ utilities }
