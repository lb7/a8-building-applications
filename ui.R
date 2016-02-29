require(shiny)
require(plotly)

shinyUI(fluidPage(
  titlePanel('Iris Data'),
  sidebarLayout(
    sidebarPanel(
      uiOutput('xaxis'),
      uiOutput('yaxis')
    ),
    mainPanel(
      plotlyOutput('plot')
    )
  )
))