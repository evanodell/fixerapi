

#' Set account type
#'
#' @description Paid accounts have access to additional features.
#' \code{fixerapi} uses this information to activate paid features like SSL
#' encryption and prevent API calls that are not allowed by a user's account
#' type.
#'
#' @description The fixer.io API still checks the account type when receiving
#' requests, so putting in a higher level account type than you actually have
#' will not allow you access additional features.
#'
#' @param type fixer.io account type. Accepts one of \code{"free"},
#' \code{"basic"}, \code{"pro"}, \code{"plus"} or \code{"enterprise"}, in
#' keeping with fixer.io's \href{https://fixer.io/product}{pricing}.
#'
#' @export
#'
fixer_account_type <- function(type = c("free", "basic", "pro",
                                        "plus", "enterprise")) {
  if (tolower(type) %in% c("free", "basic", "pro", "plus", "enterprise") &&
    length(type) == 1) {
    Sys.setenv(FIXER_ACT_TYPE = type)
  } else {
    message('Please use one of "free", "basic", "pro", "plus" or "enterprise".')
  }
}
