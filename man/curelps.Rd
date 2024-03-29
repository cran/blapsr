% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/curelps.R
\name{curelps}
\alias{curelps}
\title{Promotion time cure model with Laplace P-splines.}
\usage{
curelps(formula, data, K = 30, penorder = 2, tmax = NULL, constr = 6)
}
\arguments{
\item{formula}{A formula object where the ~ operator separates the response
from the covariates. In a promotion time cure model, it takes the form
\emph{response ~ covariates}, where \emph{response} is a survival object
returned by the \code{\link{Surv}} function of the \emph{survival} package.
The model covariates influencing the long-term survival can be specified
in the function \code{lt(.)} separated by '+', while the
covariates affecting the short-term survival can be specified
in \code{st(.)}. For instance, a promotion time cure model with
covariates specified as \code{lt(x1+x2)+st(x1)}, means that \code{x1} will
jointly influence the long- and short-term survival, while \code{x2} will
only influence the long-term survival.}

\item{data}{Optional. A data frame to match the variable names provided in
\code{formula}.}

\item{K}{A positive integer specifying the number of cubic B-spline
functions in the basis. Default is \code{K = 30} and allowed values
are \code{10 <= K <= 60}.}

\item{penorder}{The penalty order used on finite differences of the
coefficients of contiguous B-splines. Can be either 2 for a second-order
penalty (the default) or 3 for a third-order penalty.}

\item{tmax}{A user-specified value for the upper bound of the B-spline
basis. The default is NULL, so that the B-spline basis is specified
in the interval \emph{[0, tup]}, where \emph{tup} is the upper bound of
the follow-up times. It is required that \emph{tmax} > \emph{tup}.}

\item{constr}{Constraint imposed on last B-spline coefficient
(default is 6).}
}
\value{
An object of class \code{curelps} containing various components
 from the promotion time cure model fit. Details can be found in
 \code{\link{curelps.object}}. Estimates on the baseline survival,
 population survival (for a chosen covariate profile) and cure probability
 can be obtained with the \code{\link{plot.curelps}} and
 \code{\link{curelps.extract}} routines.
}
\description{
Fits a promotion time cure model with the Laplace-P-spline methodology. The
routine can be applied to survival data for which a plateau is observed in
the Kaplan-Meier curve. In this case, the follow-up period is considered to
be sufficiently long to intrinsically account for long-term survivors and
hence a cured fraction. The user can separately specify the model covariates
influencing the cure probability (long-term survival) and the population
hazard dynamics (short-term survival).
}
\details{
The log-baseline hazard is modeled as a linear combination of
  \code{K} cubic B-splines as obtained from \code{\link{cubicbs}}. A
  robust Gamma prior is imposed on the roughness penalty parameter.
  A grid-based approach is used to explore the posterior penalty space and
  the resulting quadrature points serve to compute the approximate (joint)
  posterior of the latent field vector. Point and set estimates of latent
  field elements are obtained from a finite mixture of Gaussian densities.
  The routine centers the columns of the covariate matrix around their mean
  value for numerical stability. See \code{\link{print.curelps}} for a
  detailed explanation on the output printed by the curelps
  function.
}
\examples{

## Fit a promotion time cure model on malignant melanoma data

data(melanoma)
medthick <- median(melanoma$thickness)

# Kaplan-Meier estimate to check the existence of a plateau
KapMeier <- survfit(Surv(time,status) ~ 1, data = melanoma)
plot(KapMeier, mark.time = TRUE, mark = 4, xlab = "Time (in years)")

# Fit with curelps
fit <- curelps(Surv(time , status) ~ lt(thickness + ulcer) +
                   st(thickness + ulcer), data = melanoma, K = 40)
fit

# Cure prediction for median thickness and absence of ulceration
curelps.extract(fit, time = c(2, 4 ,6, 8), curvetype = "probacure",
                cred.int = 0.90, covar.profile = c(medthick, 0, medthick, 0))

# Plot of baseline and population survival functions
opar <- par(no.readonly = TRUE)
par(mfrow = c(1, 2))
# Baseline survival
plot(fit, curvetype = "baseline", plot.cred = FALSE, ylim = c(0,1))
# Population survival
plot(fit, curvetype = "population", covar.profile = c(medthick, 0, medthick, 0),
plot.cred = FALSE, ylim = c(0,1))
par(opar)

}
\references{
Cox, D.R. (1972). Regression models and life-tables.
  \emph{Journal of the Royal Statistical Society: Series B (Methodological)}
  \strong{34}(2): 187-202.

Bremhorst, V. and Lambert, P. (2016). Flexible estimation in
  cure survival models using Bayesian P-splines.
  \emph{Computational Statistical & Data Analysis} \strong{93}: 270-284.

Gressani, O. and Lambert, P. (2018). Fast Bayesian inference
  using Laplace approximations in a flexible promotion time cure model based
  on P-splines. \emph{Computational Statistical & Data Analysis} \strong{124}:
  151-167.

Lambert, P. and Bremhorst, V. (2019). Estimation and
  identification issues in the promotion time cure model when the same
  covariates influence long- and short-term survival. \emph{Biometrical
  Journal} \strong{61}(2): 275-289.
}
\seealso{
\code{\link{curelps.object}}, \code{\link{curelps.extract}},
 \code{\link{plot.curelps}}, \code{\link{print.curelps}},
 \code{\link{Surv}}.
}
\author{
Oswaldo Gressani \email{oswaldo_gressani@hotmail.fr}.
}
