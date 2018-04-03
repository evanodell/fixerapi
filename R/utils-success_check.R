
# success check utility
success_check <- function(result) {
  if (!result$success) {
    message(paste0("Error code: ", result$error$code))
    message(paste0("Error type: ", result$error$type))
    message(result$error$info)

    stop(call. = FALSE)
  }

  result
}
