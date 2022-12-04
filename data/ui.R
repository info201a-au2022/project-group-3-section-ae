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

    # Application title
    titlePanel("Cost of Living"),

    fluidPage(
      
      # Copy the line below to make a set of radio buttons
      radioButtons("radio", label = h3("Radio buttons"),
                   choices = list("South America" = 1, "North America" = 2, "Central America" = 3), 
                   selected = 1),
      
      hr(),
      fluidRow(column(3, verbatimTextOutput("value")))
      
    ),
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
)
