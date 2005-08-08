\name{Seeds}
\alias{Seeds}
\docType{data}
\title{Seeds Data}
\description{
  This example is taken from Table 3 of Crowder (1978), and concerns the proportion 
  of seeds that germinated on each of 21 plates arranged according to a 2 by 2 factorial 
  layout by seed and type of root extract. 
}
\format{
  A data frame with 21 observations (denoting plates) on the following 4 variables.
  \describe{
    \item{r}{the number of germinated seeds.}
    \item{n}{the number of total seeds.}
    \item{x1}{seed type.}
    \item{x2}{root type.}
  }
}

\author{
    Dimitris Rizopoulos \email{dimitris.rizopoulos@med.kuleuven.be}
}
\examples{

str(Seeds)
summary(Seeds)

}
\source{
  Crowder, M. (1978) Beta-Binomial ANOVA for proportions. \emph{Applied Statistics}, \textbf{35}, 34--37.
}
\keyword{datasets}
