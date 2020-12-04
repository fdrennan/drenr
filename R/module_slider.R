#' @export module_slider_ui
module_slider_ui <- function(id, label = "Slider") {
  ns <- NS(id)
  sidebarPanel(
    sliderInput(ns("obs"),
      label,
      min = 0,
      max = 1000,
      value = 500
    )
  )
}

#' @export module_slider_server
module_slider_server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      count <- reactiveVal(0)
      observeEvent(input$obs, {
        cat(input$obs)
      })
      output$out <- renderText({
        as.numeric(input$obs)
      })

      count
    }
  )
}
