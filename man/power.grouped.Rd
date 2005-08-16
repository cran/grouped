\name{power.grouped}
\alias{power.grouped}
\title{Power and sample size calculations for grouped data}
\description{Uses the method of Tsonaka, Rizopoulos and Lesaffre (2005) to estimate the power
             (or sample size to achieve desired power) of the Wald's test statistic
             for two-tailed two group comparisons in grouped data. }
\usage{
power.grouped(n = NULL, m, X = NULL, theta, sigma, sign.level = 0.05,
                type.power = c("conditional", "marginal"), MC.iter = 10,
                type.lik = c("original", "approximate"), 
                gr.mech = c("rounding", "equispaced"), dist.t, dist.x, 
                power. = NULL, limits = c(10, 3000))
}
\arguments{
  \item{n}{Total number of observations. For sample size calculations it must be \code{NULL}.}
  \item{m}{Maximum value of the outcome.}
  \item{X}{The model design matrix which must be provided in the
            conditional power calculations and \code{NULL} in the
            marginal power calculations. Default is \code{NULL}.}
  \item{theta}{A vector of the assumed regression coefficient values corresponding to the
                intercept, treatment indicator and additional (when needed) covariates.}
  \item{sigma}{The residual standard deviation.}
  \item{sign.level}{Significance level (Type I error probability). Default value fixed at 0.05.}
  \item{type.power}{Type of power calculations.}
  \item{MC.iter}{Number of Monte Carlo iterations for the marginal power calculations. Default value fixed at 10.}
  \item{type.lik}{Type of the likelihood function to be used in the sample size calculations.
                    For the power calculations always the original likelihood function is used.}
  \item{gr.mech}{Grouping mechanism.}
  \item{dist.t}{A \code{data.frame} with 1 row that gives for the treatment indicator the name
                of the assumed distribution and the assumed values
                of its parameters. This argument must always be provided 
                for marginal power calculations and missing for conditional 
                power calculations.
                
                Currently available are two choices for this distribution: 
                "bernoulli" and "no distr". For the "bernoulli", \code{n} values are simulated 
                from the Bernoulli distribution using the function \code{rbinom} and thus the 
                parameters that must be specified are \code{prob} 
                and \code{size}. In the case of "no distr", only the sample size of the two 
                treatment groups must be specified. 
                }
  \item{dist.x}{A \code{data.frame} with number of rows the number of the additional
                covariates (except from the treatment indicator).
                In each row it is given for each covariate the name
                of the assumed distribution and the assumed values
                of their parameters. When adjustment for additional 
                covariates is not envisaged this argument must be missing.
                
                Currently available are the following options for 
                the covariate distribution: "normal", "gamma", 
                "beta", "chisquare", "uniform" and "bernoulli".
                }
  \item{power.}{Power of test (1 minus Type II error probability).
                For power calculations it must be \code{NULL}.}
  \item{limits}{A vector giving the limits of the interval 
                to be searched for the sample size. Default interval fixed at (10, 3000)}
}
\details{
    \code{power.grouped} performs power or sample size calculations for bounded outcome scores under
    the model described in \code{\link{grouped}} using the Wald's test statistic. An important feature
    of this method is that it allows for covariate adjustments that can considerably increase the power. 
    
    Two types of the power function are considered: the conditional and the marginal (i.e., argument \code{type.power}).
    The conditional power function \eqn{p_c(X)} assumes that the values of the covariates are known and can
    be used for post-hoc power analysis. In particular, it is assumed that the Wald's test follows a non central 
    Student's-t under the alternative hypothesis with power function given by 
    \deqn{p_c(X) = 1 - F_{\nu, \delta}(t_{\nu, 1-\alpha/2} | H_a; X) + 
    F_{\nu, \delta}(t_{\nu, \alpha/2} | H_a; X),}{p_c(X) = 
    1 - F_{nu, delta}(t_nu, 1-alpha/2 | H_a; X) + F_{nu, delta}(t_nu, alpha/2 | H_a; X),} 
    where \eqn{F_{\nu, \delta}}{F_{nu, delta}} is the distribution function of the non-central 
    Student's-t distribution with \eqn{\nu} degrees of freedom and non-centrality parameter \eqn{\delta}, 
    \eqn{\alpha} is the type I error (i.e., argument \code{sign.level}) and \eqn{X} the realized values of 
    the covariates. The marginal power function (mainly used for sample size calculations) acknowledges that prior 
    to a study the actual values of the covariates are not known and is defined as the expected value of the 
    conditional power \deqn{p_m = \int p_c(X) dH(X),} with respect to the assumed distribution of the covariates 
    \eqn{H(X)}, based on pilot or historical data. This expectation is approximated using Monte Carlo integration.         
    
    In order to reduce the computational burden (induced by the Monte Carlo integration) for sample size 
    calculation, an approximation to the likelihood is performed using a first order Taylor series expansion 
    (i.e., argument \code{type.lik}). The approximate likelihood is suggested to be used for sample size 
    calculations to get a better initial search area than the default (i.e., argument \code{limits}). 
    Then the sample size calculations can be made using the original likelihood function. See \bold{Examples}
    below. 
}

\value{
    An object of class \code{"power.grouped"}, is a list of the arguments (including the computed one).
}


\references{
Tsonaka, S., Rizopoulos, D. and Lesaffre, E. (2005) Power and sample size calculations for discrete 
bounded outcomes. \emph{submitted for publication}.
}

\author{
    Spyridoula Tsonaka \email{spyridoula.tsonaka@med.kuleuven.be}
}

\note{
    \code{power.grouped} currently performs power or sample size calculations for the two-sided test.
    
    \code{uniroot} is used to solve power equation for unknowns, so you may see errors from it, notably 
    about inability to bracket the root when invalid arguments are given.
}

\seealso{
    \code{\link{grouped}},
    \code{\link{rounding}},
    \code{\link{equispaced}},
    \code{\link{uniroot}}
    
}

\examples{ 

\dontrun{ 
power.grouped(n = NULL, X = NULL, m = 20, theta = c(0, 1, 0.7), 
    sigma = 1, type.power = "marginal", type.lik = "approximate", 
    gr.mech = "equispaced", dist.t = data.frame("bernoulli", 0.5, 1), 
    dist.x = data.frame("normal", 0, 1), power. = 0.7, limits = c(10,1000)) 
    # to get an initial search area using the approximate likelihood

power.grouped(n = NULL, X = NULL, m = 20, theta = c(0, 1, 0.7), 
    sigma = 1, type.power = "marginal", MC.iter = 20, gr.mech = "equispaced", 
    dist.t = data.frame("bernoulli", 0.5, 1), dist.x = data.frame("normal", 0, 1), 
    power. = 0.7, limits = c(10,50)) 
    # redefine the search area and use the original likelihood
}

power.grouped(n = 20, X = NULL, m = 20, theta = c(0, 1, 0.7), 
    sigma = 1, type.power = "marginal", gr.mech = "equispaced", 
    dist.t = data.frame("bernoulli", 0.5, 1), 
    dist.x = data.frame("normal", 0, 1), power. = NULL) 

} 
\keyword{htest}
