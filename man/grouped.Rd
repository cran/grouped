\name{grouped}
\alias{grouped}
\title{ Regression for Grouped Data - Coarse Data }
\description{
  \code{grouped} is used to fit regression models for grouped or coarse data under the assumption 
  that the data are Coarsened At Random. 
}
\usage{
grouped(formula, link = c("identity", "log", "logit"), 
            distribution = c("normal", "t", "logistic"), data,
            subset, na.action, str.values, df = NULL, iter = 3, ...)
}
\arguments{
  \item{formula}{ a two-sided formula describing the model structure. In the left-hand side, a two-column response 
                matrix must be supplied, specifying the lower and upper limits (1st and 2nd column, respectively)
                of the interval in which the true response lies. They can be defined arbitrarily or you can use the 
                functions \code{\link{equispaced}} and \code{\link{rounding}}. }
  \item{link}{ the link function under which the underlying response variable follows the distribution given by the 
                \code{distribution} argument. Available choices are \code{"identity"}, \code{"log"} and \code{"logit"}. 
                See \bold{Details} for more info.}
  \item{distribution}{the assumed distribution for the true latent response variable. Available choices are 
                \code{"normal"}, \code{"t"} and \code{"logistic"}. See \bold{Details} for more info.}
  \item{data}{ an optional \code{data.frame} containing the variables in the model. If not found in data, the variables 
               are taken from \code{environment(formula)}, typically the environment from which \code{grouped} is 
               called.}
  \item{subset}{ an optional vector specifying a subset of observations to be used in the fitting process.  }
  \item{na.action}{ a function which indicates what should happen when the data contain \code{NA}s. }
  \item{str.values}{ a numeric vector of starting values. }
  \item{df}{ a scalar numeric value denoting the degrees of freedom when the underlying distribution for the response
                variable is assumed to be Student's-\eqn{t}. }
  \item{iter}{ the number of extra times to call \code{optim} in case the first optimization has not
                converged.}
  \item{\dots}{ additional arguments; currently none is used. }
}
\details{
  Let \eqn{Z_i, i = 1, \ldots, n}{Z_i, i = 1, ..., n} be a random sample from a response variable of interest. In many
  problems one can think of the sample space \eqn{S_i} of \eqn{Z_i} as being partitioned into a number of groups; one 
  then observes not the exact value of \eqn{Z_i} but the group into which it falls. Data generated in this way are called
  grouped (Heitjan, 1989). The function \code{grouped} and this package are devoted in the analysis of such data in the 
  case the data are Coarsened At Random (Heitjan and Rubin, 1991).
  
  The framework we use assumes a latent variable \eqn{Z_i} which is coarsely measured and for which we only know 
  \eqn{Y_{li}} and \eqn{Y_{ui}}, i.e., the interval in which \eqn{Z_i} lies. Given some covariates \eqn{X_i}, 
  \eqn{Z_i|X_i} may assume either a Normal, a Logistic or (generalized) Student's-t distribution. In addition three 
  link functions are available for greater flexibility. In particular, the likelihood is of the following form 
  \deqn{L(\beta, \sigma) = \prod\limits_{i=1}^n F([y_{ui}^* - x_i^t\beta]/\sigma) - F([y_{li}^* - x_i^t\beta]/
  \sigma),}{L_i(\beta, \sigma) = F[(y_u^* - x\beta)/\sigma] - F[(y_l^* - x\beta)/\sigma],}
  where \eqn{F(\cdot)}{F(.)} denotes the cdf of the assumed distribution given by the argument \code{distribution} and 
  \eqn{y_{li}^* = \phi(y_{li})}{y_l^* = \phi(y_l)}, where \eqn{\phi(\cdot)}{\phi(.)} denotes the link function, 
  and \eqn{y_{ui}^*}{y_u} is defined analogously. 
  
  An interesting example of coarse data is the various quality of life indexes. The observed value of such indexes can
  be thought of as a rounded version of the \emph{true} latent quality of life that the index attempts to capture. 
  Applications of this approach can be found in Lesaffre et al. (2005) and Tsonaka et al. (2005). Various other 
  examples of grouped and coarse data can be found in Heitjan (1989; 1993).
}

\value{
  an object of class \code{grouped} is a list with the following components:
  \item{coefficients}{the estimated coefficients, including the standard deviation \eqn{\sigma}.}
  \item{hessian}{the approximate Hessian matrix at convergence returned by \code{optim}.}
  \item{fitted}{the fitted values.}
  \item{details}{a list with components: (i) \code{X} the design matrix, (ii) \code{y} the response data matrix,
                (iii) \code{convergence} the convergence identifier returned by \code{optim}, (iv) \code{logLik} the
                value of the log-likelihood at convergence, (v) \code{k} the number of outer iterations used, (vi)
                \code{n} the sample size, (vii) \code{df} the degrees of freedom; \code{NULL} except for the t
                distribution, (viii) \code{link} the link function used, (ix) \code{distribution} the distribution
                assumed for the true latent response variable and (x) \code{max.sc} the maximum absolute value of the 
                score vector at convergence. 
  }
  \item{call}{the matched call.}
}
\references{
Heitjan, D. (1989) Inference from grouped continuous data: A review  (with discussion). 
\emph{Statistical Science}, \bold{4}, 164--183.

Heitjan, D. (1993) Ignorability and coarse data: some biomedical examples. \emph{Biometrics}, \bold{49}, 1099--1109. 

Heitjan, D. and Rubin, D. (1991) Ignorability and coarse data. \emph{Annals of Statistics}, \bold{19}, 2244--2253.

Lesaffre, E., Rizopoulos, D. and Tsonaka, S. (2005) The logistic-transform for bounded 
outcome scores. \emph{Biostatistics} (to appear).

Tsonaka, S., Rizopoulos, D. and Lesaffre, E. (2005) Power and sample size calculations for discrete 
bounded outcomes. \emph{Statistics in Medicine} (to appear).
}

\author{
    Dimitris Rizopoulos \email{dimitris.rizopoulos@med.kuleuven.be}
}

\seealso{\code{\link{anova.grouped}},
         \code{\link{plot.grouped}},
         \code{\link{residuals.grouped}},
         \code{\link{summary.grouped}},
         \code{\link{power.grouped}}
}

\examples{
    
grouped(cbind(lo, up) ~ treat * x, link = "logit", data = Sdata)
    
grouped(equispaced(r, n) ~ x1 * x2, link = "logit", data = Seeds)

# See Figure 1 and Table 1 in Heitjan (1989)
y <- iris[iris$Species == "setosa", "Petal.Width"]
index <- cbind(seq(0.05, 0.55, 0.1), seq(0.15, 0.65, 0.1)) 
n <- length(y)
a <- b <- numeric(n)
for(i in 1:n){
    ind <- which(index[, 2] - y[i] > 0)[1]
    a[i] <- index[ind, 1]
    b[i] <- index[ind, 2]
}
summary(grouped(cbind(a, b) ~ 1))

# See Figure 1 and Table 1 in Heitjan (1989)
y <- iris[iris$Species == "setosa", "Petal.Length"]
index <- cbind(seq(0.95, 1.75, 0.2), seq(1.15, 1.95, 0.2)) 
n <- length(y)
a <- b <- numeric(n)
for(i in 1:n){
    ind <- which(index[, 2] - y[i] > 0)[1]
    a[i] <- index[ind, 1]
    b[i] <- index[ind, 2]
}
summary(grouped(cbind(a, b) ~ 1))

}
\keyword{regression}
