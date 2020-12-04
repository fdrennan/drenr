library(drenr)

# User Interface ----------------------------------------------------------
# Freddy Drennan
# December 3, 2020
ui <- fluidPage(
  counterButton("counter1", "Counter #1")
)


# Server ------------------------------------------------------------------
# Freddy Drennan
# December 3, 2020
server <- function(input, output, session) {
  counterServer("counter1")
}

shinyApp(ui, server)
