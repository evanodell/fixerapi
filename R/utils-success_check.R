
# success check utility
success_check <- function(result) {
  if (!result$success) {
    message(paste(
      "Error code:", result$error$code, "\n",
      "Error type:", result$error$type, "\n",
      "Error message:", result$error$info
    ))

    stop(call. = FALSE)
  }

  result
}
