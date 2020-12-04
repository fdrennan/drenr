#' @export navbar
navbar <- function() {
  navbarPage(
    theme = drenr_theme(),
    "drenr",
    tabPanel("Home"),
    navbarMenu(
      "More",
      tabPanel("Summary"),
      "----",
      "Section header",
      tabPanel("Table")
    )
  )
}
