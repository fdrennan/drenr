## app.R ##
library(drenr)
style_file("app.R")
ui <- dashboardPage(

  # HEADER ------------------------------------------------------------------
  dashboardHeader(title = "drenr"),

  # SIDEBAR -----------------------------------------------------------------
  dashboardSidebar(),

  # BODY -----------------------------------------------------------------
  dashboardBody(
    # Boxes need to be put in a row (or column)
    fluidRow(
      about_this_site_ui("about_site"),
      box(plotOutput("plot1", height = 250)),
      box(
        title = "Controls",
        sliderInput("slider", "Number of observations:", 1, 100, 50)
      )
    )
  )
)

server <- function(input, output) {
  output$plot1 <- renderPlot({
    data <- rnorm(500)[seq_len(input$slider)]
    hist(data)
  })
  about_this_site_server("about_site")
}

shinyApp(ui, server)
