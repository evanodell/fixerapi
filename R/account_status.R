

#' Set account type
#'
#' @description Paid accounts have access to additional features.
#' \code{fixerapi} uses this information to activate paid features like SSL
#' encryption and prevent API calls that are not allowed by a user's account
#' type.
#'
#' @description The \href{https://fixer.io/}{fixer.io} API still checks the
#' account type when receiving requests, so putting in a higher level account
#' type than you actually have will not allow you access additional features.
#' If you have a paid account but do not set your account status you will
#' receive warning messages but there will be no other effect on your usage of
#' the API.
#'
#' @param type Your \href{https://fixer.io/}{fixer.io} account type. Accepts
#' one of \code{"free"}, \code{"basic"}, \code{"pro"}, \code{"plus"} or
#' \code{"enterprise"}, in keeping with fixer.io's
#' \href{https://fixer.io/product}{pricing} structure.
#'
#'
#' @export
#'
fixer_account_type <- function(type = c(
                                 "free", "basic", "pro",
                                 "plus", "enterprise"
                               )) {

  act_type <- Sys.getenv("FIXER_ACT_TYPE")
  if (identical(act_type, type)) return(act_type)

  if (tolower(type) %in% c("free", "basic", "pro", "plus", "enterprise") &&
    length(type) == 1) {
    Sys.setenv(FIXER_ACT_TYPE = type)
  } else {
    message('Please use one of "free", "basic", "pro", "plus" or "enterprise".')
  }
}
