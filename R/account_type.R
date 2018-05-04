

#' Set account type
#'
#' @description Paid accounts have access to additional features, including
#' SSL encryption of API requests using HTTPS. Account type must be set in
#' order to use HTTPS requests. Setting account type to \code{"paid"} when
#' using a free account will result in an error, even on features available to
#' free accounts. Setting account type to \code{"free"} when using a paid
#' account will have no impact on requests aside from using HTTP instead of
#' HTTPS to access the API. If you have a paid account but do not set
#' your account status you will not be able to use the HTTPS connection but
#' there will be no other impact on your usage of the API.
#'
#' @description The \href{https://fixer.io/}{fixer.io} API still checks the
#' account type when receiving requests, so setting you account type here only
#' forces HTTPS instead of HTTP.
#'
#' @param type Your \href{https://fixer.io/}{fixer.io} account type. Accepts
#' one of \code{"free"} or \code{"paid"}. If no value or an incorrect value
#' is given, account type will be set as \code{"free"}.
#'
#' @export
#' @examples \dontrun{
#' fixer_account_type("paid")
#' }

fixer_account_type <- function(type = c("free", "paid")) {
  act_type <- Sys.getenv("FIXER_ACT_TYPE")
  if (identical(act_type, type)) return(act_type)

  if (tolower(type) %in% c("free", "paid") &&
    length(type) == 1) {
    Sys.setenv(FIXER_ACT_TYPE = type)
    message(paste0("Account type has been set to "), type)
  } else {
    Sys.setenv(FIXER_ACT_TYPE = "free")
    message("Account type has been set to free")
  }
}
