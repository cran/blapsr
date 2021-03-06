#' Survival data of kidney transplant patients.
#'
#' @docType data
#'
#' @description Survival data of kidney transplant patients from Section 1.7
#'  of Klein and Moeschberger (2003).
#'
#' @usage data(kidneytran)
#'
#' @format A data frame with 863 rows and 6 columns.
#' \describe{
#'  \item{\code{obs}}{Observation number.}
#'  \item{\code{time}}{Time to death.}
#'  \item{\code{delta}}{Event indicator, \code{1}=Dead, \code{0}=Alive.}
#'  \item{\code{gender}}{Gender, \code{1}=Male, \code{2}=Female.}
#'  \item{\code{race}}{Race, \code{1}=White, \code{2}=Black.}
#'  \item{\code{age}}{Age in years.}
#'
#' }
#'
#' @source \url{https://cran.r-project.org/package=KMsurv}
#'
#' @references Klein, J.P. and Moeschberger, M. L. (2003). Survival analysis:
#'  Techniques for Censored and Truncated Data (Second edition), Springer.
#'  ISBN 978-1-4419-2985-3
"kidneytran"
