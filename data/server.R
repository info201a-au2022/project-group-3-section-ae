library(shiny)


#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    
    output$Region <- renderPrint({ input$radio })
    
  })
scatterPlot <- reactive({
  plotData <- new_chart %>%
    filter(region %in% input$region)
  ggplot(plotData, aes(x=Groceries.Index, y=Cost.of.Living.Index)) + 
    geom_point(aes(color = countries))
  labs( x = "Groceries Index", y= "Cost of Living Index", title = "Cost of Food")
  
})  

 output$countryPlot <- renderPlot({
   
   scatterPlot()
   
   }) 