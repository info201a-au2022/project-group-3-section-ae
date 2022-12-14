library(shiny)
library(tidyverse)
library(ggplot2)
library(dplyr)
library(plotly)
library(maps)
library(mapproj)
library(readr)


# These are all the datasets that are being used
final_dataset <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-ae/main/data/New_final_dataset%20-%20Sheet1.csv")
datasets <- read_csv("https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-ae/main/data/Datasets%20-%20Sheet1.csv")
data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-ae/main/data/New_final_dataset%20-%20Sheet1.csv")
df_crime <- select(final_dataset, 1,4,5)
new_data <- read.csv ("https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-ae/main/data/Dataset%20with%20Regions%20-%20Sheet1.csv")
df <- read.csv('https://raw.githubusercontent.com/plotly/datasets/master/2014_world_gdp_with_codes.csv')
data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-ae/main/data/New_final_dataset%20-%20Sheet1.csv")
data$Country[data$Country=="USA"]<-"United States"
df <- rename(df, Country = COUNTRY)
df <- inner_join(x = data, y = df, by = "Country")

#Server logic required to draw a bargraph, map and scatterplot
shinyServer(function(input, output) {
  output$selectCountry1 <- renderUI({
    selectInput("country", "Choose a country:", choices = unique(df_crime$Country))
    
  })
  output$selectCountry <- renderUI({
    output$value <- renderPrint({ input$slider1 })
    
    
    
    
  })
  output$selectRegion <- renderUI({
    selectInput("region", "Choose a region:", choices = unique(new_data$region))
  })
  output$data <- renderTable({
    datafilter <- subset(datasets, datasets$`Name of Data File` == input$dataset)
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
  })
  
  
  output$barGraph <- renderPlot({
    barGraph()
  })
  
 
  
  plotMap <- reactive({
    country_selector <- df %>% 
      filter(Health.Care.Index < input$slider1) %>%
      pull(Country)
    plotData <- df %>% 
      filter(Country %in% country_selector)
    
    l <- list(color = toRGB("grey"), width = 0.5)
    
    # specify map projection/options
    g <- list(
      showframe = FALSE,
      showcoastlines = FALSE,
      projection = list(type = 'Mercator')
    )
    
    fig <- plot_geo(plotData)
    fig <- fig %>% add_trace(
      z = plotData$Health.Care.Index, color = plotData$Health.Care.Index., colors = 'Blues',
      text = ~Country, locations = ~CODE, marker = list(line = l)
    )
    fig <- fig %>% colorbar(title = 'Health Care Index')
    fig <- fig %>% layout(
      title = 'Health Care Index in the Americas',
      geo = g
    )
    fig
  }) 
  
  output$countryPlot <- renderPlotly({
    plotMap()
  })
  scatterPlot <- reactive({
    plotData <- new_data %>% 
      filter(region %in% input$region)
    
     
    plot_ly(type = 'scatter', mode = 'markers') %>%
      layout(xaxis = list(title = "Groceries Index"), yaxis = list(title = "Cost of Living Index"), title = "Cost of Living vs. Groceries") %>%
      add_trace(plotData,
                x = plotData$Groceries.Index, 
                y = plotData$Cost.of.Living.Index,
                text = paste0("Country: ", plotData$Country),
                hoverinfo = 'text',
                marker = list(color='green'),
                showlegend = F
      )
  })
  
  
  output$regionPlot <- renderPlotly({
    scatterPlot()
  })
})