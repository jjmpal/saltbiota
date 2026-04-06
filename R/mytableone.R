#'
#'
#' @param
#'
#' @return
#'
#' @export
mytableone <- function(x, vars, ...) {
  purrr::iwalk(vars, ~ data.table::setattr(x[[.y]], "label", .x))
  return(table1::table1(~., x, ...))
}
