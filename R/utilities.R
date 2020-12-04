#' @export installed_packages
installed_packages <- function() {
  packages <- as_tibble(installed.packages())
  rename_all(
    packages,
    to_snake_case
  )
}
