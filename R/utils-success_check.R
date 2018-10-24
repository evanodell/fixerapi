
# success check utility
success_check <- function(result) {
  if (!result$success) {
    message(paste("Error code:", result$error$code))
    message(paste("Error type:", result$error$type))
    message(paste("Error message:", result$error$info))

    stop("Request failed", call. = FALSE)
  }

  result
}
