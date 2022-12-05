#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(ggplot2)
library(dplyr)
library(plotly)
#install.packages("shinythemes")
#install.packages("mapproj")
#install.packages("maps")

final_dataset <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-ae/main/data/New_final_dataset%20-%20Sheet1.csv")
#View(final_dataset)

#TODO 

data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-ae/main/data/New_final_dataset%20-%20Sheet1.csv")
world_coordinates <- map_data("world")
world_coordinates <- rename(world_coordinates, Country = region)
data <- inner_join(x = data, y = world_coordinates, by = "Country")

df_crime <- select(final_dataset, 1,4,5)
#View(df_crime)

# Define server logic required to draw a bargraph
shinyServer(function(input, output) {
  output$selectCountry1 <- renderUI({
    selectInput("country", "Choose a country:", choices = unique(df_crime$Country))
    
  })
  
  barGraph <- reactive({
    plotData <- df_crime %>%
      filter(Country %in% input$country)
    country  = c(rep(plotData$Country, 2))
    condition = c("crime index", "safety index")
    value  = c(df_crime$Crime.Index[df_crime$Country==plotData$Country], df_crime$Safety.Index[df_crime$Country==plotData$Country])
    df = data.frame(country=country, condition=condition, value=value)
    
    
    ggplot(df, aes(fill=condition, y=value, x=country)) + 
      geom_col(width = 0.30, position = position_dodge(0.45), stat="identity", colour = "black") +
      scale_fill_manual(values = c("gold2", "darkolivegreen3")) +
      geom_text(aes(label = value), position = position_dodge(width = 0.45), vjust=2, size = 6) +
      #scale_y_continuous(expand=expansion(mult = 0, add = 0)) +
      theme_update() +
      labs(x=  "   Crime Index                Safety Index",
           y = "Values",
           title = "Crime and Safety in North, South, & Central America",
           caption = "This bar graph depicts crime & safety rates for countries in North and South America.") +
      theme(plot.title = element_text(face="bold", size=20), 
            axis.title = element_text(face="bold", size = 17), 
            axis.text = element_text(size = 15)) 
    #legend.title = element_text(face= "bold", size = 20)
  })
  
  
  output$barGraph <- renderPlot({
    barGraph()
  })
  
  #secondchart map
  
  output$selectCountry <- renderUI({
    output$value <- renderPrint({ input$slider1 })
    
    
  })
  
  plotMap <- reactive({
    country_selector <- data %>% 
      filter(Health.Care.Index < input$slider1) %>%
      pull(Country)
    plotData <- data %>% 
      filter(Country %in% country_selector)
    map <- ggplot(plotData)+geom_polygon(aes(x=long, y=lat, group = group, fill=Health.Care.Index))+coord_map() +
      labs(title = "Healthcare Index in North & South America") +
      theme(plot.title = element_text(face="bold", size=15)) 
    
    return(map)
  }) 
  
  output$countryPlot <- renderPlot({
    plotMap()
  })
})
