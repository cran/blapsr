#' Data from the 1986 Medicaid Consumer Survey.
#'
#' @docType data
#'
#' @description Data from the 1986 Medicaid survey sponsored by the Health
#'  Care Financing Administration (USA). It can be used to illustrate
#'  generalized additive models with a log link for the number of doctor
#'  visits as a response variable. The dataset is studied in Gurmu (1997).
#'
#' @usage data(medicaid)
#'
#' @format A data frame with 485 rows and 10 columns.
#' \describe{
#'  \item{\code{numvisits}}{Count of doctor office/clinic and health
#'   centre visits.}
#'  \item{\code{exposure}}{Length of observation period for ambulatory
#'   care in days.}
#'  \item{\code{children}}{Number of children in the household.}
#'  \item{\code{age}}{Age of the respondent.}
#'  \item{\code{income1000}}{Annual household income in US dollars.}
#'  \item{\code{access}}{Access to health services, \code{0}=Low access,
#'        \code{100}=High access.}
#'  \item{\code{pc1times1000}}{First principal component of three health
#'        status variables: functional limitations, acute conditions and
#'        chronic conditions.}
#'  \item{\code{maritalstat}}{Marital status, \code{0}=Other,
#'        \code{1}=Married.}
#'  \item{\code{sex}}{Gender, \code{1}=Female, \code{0}=Male.}
#'  \item{\code{race}}{Race, \code{0}=Other, \code{1}=White.}
#' }
#'
#' @source \url{http://qed.econ.queensu.ca/jae/1997-v12.3/gurmu/}
#'
#' @references Gurmu, S.(1997). Semi-parametric estimation of hurdle regression
#'  models with an application to medicaid utilization. \emph{Journal of Applied
#'  Econometrics} \strong{12}(3):225-242.
"medicaid"
