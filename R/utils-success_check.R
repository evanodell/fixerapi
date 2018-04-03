
# success check utility
success_check <- function(result) {
  if (!result$success) {
    message(paste0("Error code: ", result$error$code,
                   "Error type: ", result$error$type, result$error$info))

    stop(call. = FALSE)
  }

  result
}
