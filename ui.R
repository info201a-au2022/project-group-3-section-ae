library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Cost of Living"),
    
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      uiOutput("selectRegion")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("regionPlot"),
      #textOutput("sampleText")
    )
  )
))