\name{equispaced}
\alias{equispaced}
\title{ Equispaced Coarsening Mechanism}
\description{
  Creates the lower and upper limits of the interval in which the true response lies for grouped data 
  in \eqn{[0, 1]}.
}

\usage{
equispaced(y, m)
}

\arguments{
  \item{y}{ the score obtained or number of successes. }
  \item{m}{ the maximum score or number of trials. }
}

\details{
  After splitting the \eqn{[0, 1]} interval in \code{m + 1} intervals of equal length, \code{equispaced} returns
  the limits of the intervals into which the rounded version, namely \code{y/m}, of the true response lies.
}

\value{
  a 2-dimensional matrix containing the lower and upper limits of the intervals.
}

\author{
    Dimitris Rizopoulos \email{dimitris.rizopoulos@med.kuleuven.be}
}

\seealso{ \code{\link{grouped}}}
\examples{

equispaced(Seeds$r, Seeds$n)

}
\keyword{ utilities }
