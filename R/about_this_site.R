

#' @export about_this_site_ui
about_this_site_ui <- function(id, label = "Slider", width = 12) {
  ns <- NS(id)
  box(
    textInput(ns("package_name"), label = label),
    verbatimTextOutput(ns("code")),
    width = width
  )
}

#' @export about_this_site_server
about_this_site_server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      output$code <- renderPrint({
        chosen_packages <- filter(
          installed_packages(),
          str_detect(package, input$package_name)
        )

        chosen_packages <-
          select(
            chosen_packages,
            package,
            version,
            license,
            built
          )
        print("Directory APP is Running From")
        print(dir_ls(all = TRUE))
        print(chosen_packages)
      })
    }
  )
}
