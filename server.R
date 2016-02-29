require(shiny)
require(plotly)

shinyServer(function(input, output) {
  iris <- as.data.frame(iris)
  
  output$xaxis <- renderUI(selectInput('xaxis', 
                                       'X Axis', 
                                       choices = colnames(iris)))
  output$yaxis <- renderUI(selectInput('yaxis', 
                                       'Y Axis', 
                                       choices = colnames(iris)))
  output$plot <- renderPlotly({
    plot_ly(data = iris, 
            type = 'scatter',
            x = iris[, input$xaxis],
            y = iris[, input$yaxis],
            mode = 'markers') %>% 
      layout(
        xaxis = list(title = input$xaxis),
        yaxis = list(title = input$yaxis)
      )
  })
})