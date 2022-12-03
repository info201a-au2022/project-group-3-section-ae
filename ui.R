#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  fluidRow(
    column(4,
           
           # Copy the line below to make a slider bar 
           sliderInput("slider1", label = h3("Slider"), min = 0, 
                       max = 100, value = 50)
    ),
  # Application title
  #titlePanel("Healthcare Index"),
  
  
  # Sidebar with a slider input for number of bins
  #sidebarLayout(
    #sidebarPanel(
      
      
      #uiOutput("selectCountry")
    #),
    

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("countryPlot")
        )
    )
)
)

