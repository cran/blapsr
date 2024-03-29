#' Phase III Melanoma clinical trial.
#'
#' @docType data
#'
#' @description Melanoma data from the phase III Eastern Cooperative
#'  Oncology Group (ECOG) two-arm clinical trial studied in
#'  Kirkwood et al. (1996).
#'
#' @usage data(ecog1684)
#'
#' @format A data frame with 284 rows and 5 columns.
#' \describe{
#'  \item{\code{trt}}{Treatment: \code{0}=control,
#'        \code{1}=Interferon alpha-2b (IFN).}
#'  \item{\code{time}}{Relapse-free survival (in years).}
#'  \item{\code{status}}{\code{1}=death or relapse, \code{0}=censored.}
#'  \item{\code{age}}{Age centered to the mean.}
#'  \item{\code{sex}}{\code{0}=Male, \code{1}=Female.}
#' }
#'
#'
#' @source \url{https://CRAN.R-project.org/package=smcure}
#'
#' @references  Kirkwood, J. M., Strawderman, M. H., Ernstoff, M. S.,
#'  Smith, T. J., Borden, E. C. and Blum, R. H. (1996). Interferon alfa-2b
#'  adjuvant therapy of high-risk resected cutaneous melanoma: the Eastern
#'  Cooperative Oncology Group Trial EST 1684.
#'  \emph{Journal of clinical oncology} \strong{14}(1): 7-17.
#' @references Corbiere, F. and Joly, P. (2007). A SAS macro for parametric
#'  and semiparametric mixture cure models. \emph{Computer methods and programs
#'  in Biomedicine} \strong{85}(2): 173-180.
"ecog1684"
