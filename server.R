#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(plotly)

data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-ae/main/data/New_final_dataset%20-%20Sheet1.csv")
world_coordinates <- map_data("world")
world_coordinates <- rename(world_coordinates, Country = region)
data <- inner_join(x = data, y = world_coordinates, by = "Country")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    # You can access the value of the widget with input$slider1, e.g.

  # You can access the values of the second widget with input$slider2, e.g.
  output$selectCountry <- renderUI({
    #selectInput("Country", "Choose a Country:", choices = unique(data$Country))
    output$value <- renderPrint({ input$slider1 })
    
    
    
  })
  
  plotMap <- reactive({
    country_selector <- data %>% 
      filter(Health.Care.Index < input$slider1) %>%
      pull(Country)
    plotData <- data %>% 
      filter(Country %in% country_selector)
    ggplot(plotData)+geom_polygon(aes(x=long, y=lat, group = group, fill=Health.Care.Index))+coord_map() +
    labs(title = "Healthcare Index in North & South America") +
    theme(plot.title = element_text(face="bold", size=15)) 
  }) 
 
output$countryPlot <- renderPlot({
  plotMap()
})
})
 
