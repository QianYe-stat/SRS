#' is_wholenumber: check if a number is an integer
#'
#' @param x a numeric vector
#' @param tol the tolerance
#'
#' @return logical indicating whether x is integer
#'
#'
#' @examples
#' is_wholenumber(1.5)
#' is_wholenumber(1:5)
#' is_wholenumber(c(1,2.5,NA))
is_wholenumber <-
  function(x, tol = .Machine$double.eps^0.5) {
    abs(x - round(x)) < tol
  }
