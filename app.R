## app.R ##
library(drenr)
style_file("app.R")
ui <- dashboardPage(

  # HEADER ------------------------------------------------------------------
  dashboardHeader(title = "drenr"),

  # SIDEBAR -----------------------------------------------------------------
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th"))
    )
  ),

  # BODY -----------------------------------------------------------------
  dashboardBody(
    # Boxes need to be put in a row (or column)

    tabItems(
      # First tab content
      tabItem(
        tabName = "dashboard",
        fluidRow(
          box(plotOutput("plot1", height = 250)),
          about_this_site_ui("about_site"),
          box(plotOutput("plot1", height = 250)),
          box(
            title = "Controls",
            sliderInput("slider", "Number of observations:", 1, 100, 50)
          ),
          box(
            title = "Controls",
            sliderInput("slider", "Number of observations:", 1, 100, 50)
          )
        )
      ),

      # Second tab content
      tabItem(
        tabName = "widgets",
        h2("Widgets tab content")
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
