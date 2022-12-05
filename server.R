library(shiny)
library(tidyverse)
library(ggplot2)

new_data <- read.csv ("https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-ae/main/data/Dataset%20with%20Regions%20-%20Sheet1.csv")

data <- read.csv("https://countlove.org/data/data.csv")



# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$selectRegion <- renderUI({
    selectInput("region", "Choose a region:", choices = unique(new_data$region))
  })
  
  
  #data <- data %>% 
    #mutate(states = str_sub(Location, -2, -1)) %>% 
    #head(500)
  
  scatterPlot <- reactive({
    plotData <- new_data %>% 
      filter(region %in% input$region)
    
    ggplot(plotData, aes(x=Groceries.Index, y=Cost.of.Living.Index)) +
      geom_point() +
      labs(x = "Groceries Index",
           y = "Cost of Living Index", 
           title = paste("Cost of Food vs Cost of Living", input$region))
  })
  
  output$regionPlot <- renderPlot({
    scatterPlot()
  })
  
  output$sampleText <- renderText({
    paste("Hello! Welcome to my sample Shiny web app. This visualization shows a scatter of the number of attendees, depending
            on the date of the protest and the state it happened in.")
  })
  
})