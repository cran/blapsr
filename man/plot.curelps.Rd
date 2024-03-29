% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/S3_curelps_plot.R
\name{plot.curelps}
\alias{plot.curelps}
\title{Plot estimated survival functions and cure probability for the promotion
time cure model.}
\usage{
\method{plot}{curelps}(x, cred.int = 0.95, curvetype = c("baseline", "population",
     "probacure"), covar.profile, fit.col = "black", shade.col = "gray75",
      plot.cred = FALSE, np = 50, show.legend = TRUE, ...)
}
\arguments{
\item{x}{An object of class \code{curelps}.}

\item{cred.int}{The level for an approximate pointwise credible interval
to be computed for the smooth curves. Default is 0.95.}

\item{curvetype}{The curve to be plotted; \code{baseline} (the default) will
plot the estimated baseline survival, \code{population} the population
survival function for a profile of covariates given in
\code{covar.profile}, and \code{probacure} the probability to be cured (for
a profile of covariates given in \code{covar.profile}) given
that the subject has survived until time t.}

\item{covar.profile}{A numeric vector of the same length as the number
of covariates in the model. This corresponds to the profile of covariates
for which to compute the population survival function  and cure probability
estimates. The order of the covariates in \code{covar.profile} is the same
as the order specified in \code{formula} of the \code{curelps} routine.
Each component of \code{covar.profile} should be in the range of the
observed values for the corresponding covariate. If \code{covar.profile}
is left unspecified by the user, the default will be to take the median
covariate values.}

\item{fit.col}{The color used for the estimated survival curve.}

\item{shade.col}{The color used for the shading of the credible intervals.}

\item{plot.cred}{Logical. Should the credible intervals be plotted?
Default is \code{FALSE}.}

\item{np}{The number of points used to plot the smooth curves. Default is 50
and allowed values are between 20 and 200.}

\item{show.legend}{Show the legend? Default is TRUE.}

\item{...}{Further arguments to be passed to \code{plot}.}
}
\description{
The routine takes as input an object of class \code{curelps} and plots
the estimated baseline survival curve, the population survival
curve for a specific covariate profile and a a smooth curve for the cure
probability. Approximate pointwise credible intervals are available.
}
\details{
When \code{plot.cred} is \code{FALSE}, the routine omits to compute
 the approximate pointwise credible intervals for plotting and hence is
 less computationally intensive.
}
\examples{

# Example on phase III clinical trial e1684 on melanoma data

data(ecog1684)

# Kaplan-Meier curve
plot(survfit(Surv(time, status) ~ 1, data = ecog1684), mark.time = TRUE)
fit <- curelps(Surv(time, status) ~ lt(age + trt + sex) +
             st(age + trt + sex), data = ecog1684, K = 20, penorder = 2)
fit
profile1 <- c(0, 1, 1, 0, 1, 1) # Mean age, trt = IFN, sex = Female.
profile2 <- c(0, 0, 1, 0, 0, 1) # Mean age, trt = control, sex = Female.
opar <- par(no.readonly = TRUE)
par(mfrow = c(1, 2))
plot(fit, curvetype = "probacure", plot.cred = TRUE, ylim = c(0,1),
     covar.profile = profile1, cred.int = 0.90,
     main = "Mean age, trt = IFN, sex = Female", cex.main = 0.8,
     show.legend = FALSE)
plot(fit, curvetype = "probacure", plot.cred = TRUE, ylim = c(0,1),
     covar.profile = profile2, cred.int = 0.90,
     main = "Mean age, trt = control, sex = Female", cex.main = 0.8,
     show.legend = FALSE)
par(opar)
}
\seealso{
\code{\link{curelps}}, \code{\link{curelps.object}},
 \code{\link{curelps.extract}}, \code{\link{print.curelps}}.
}
\author{
Oswaldo Gressani \email{oswaldo_gressani@hotmail.fr}.
}
