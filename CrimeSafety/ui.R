library(shiny)

navbarPage(
  "Crime and Safety",
  tabPanel("Introduction",
           h3("Nowadays, quality of life has become a major concern for all of us and a low quality of life prevents us from being comfortable and secure in our own environment. In today’s society, large numbers of people are extremely worried about their families’ well-being, constantly concerned about people around them, or experiencing financial difficulties. By facilitating conditions that ensure a higher quality of life, individuals will feel happier and more secure. Our group decided to focus on three main aspects of the quality of life: crime rates, cost of living, and healthcare that helps us in determining which of the countries in North and South America are the safest to live in. Below are datasets that look at various aspects of a meaningful life. Examining these sets of data will help and give us a clarified comprehension of which nations have the best quality of life.")
  ),
  tabPanel("Chart1",
           titlePanel("Countries"),
           
           # Sidebar with a slider input for number of bins
           sidebarLayout(
             sidebarPanel(
               uiOutput("selectCountry")
             ),
             
             # Show a plot of the generated distribution
             mainPanel(
               plotOutput("countryPlot")
             )
           )),
  tabPanel("Chart2"),
  tabPanel("Chart3"),
  tabPanel("Summary Takeaways",
           h3("Three Summary Takeaways:")
           
  ),
  tabPanel("Report")
)
