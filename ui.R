library(shiny)
library(shinythemes)


navbarPage( theme = shinytheme("darkly"),
  "Quality of Life", 
  tabPanel("Introduction", h1("Overview"),
           p("Nowadays, quality of life has become a major concern for all of us and a low quality of life prevents us from being comfortable and secure in our own environment. In today’s society, large numbers of people are extremely worried about their families’ well-being, constantly concerned about people around them, or experiencing financial difficulties. By facilitating conditions that ensure a higher quality of life, individuals will feel happier and more secure. Our group has decided to focus on three main aspects of the quality of life: crime rates, cost of living, and healthcare that helps us in determining which of the countries in North, South, and Central America are the safest to live in. Below are datasets that look at various aspects of a meaningful life. Examining these sets of data will help and give us a clarified comprehension of which nations have the best quality of life.")
           
  ),
  tabPanel("Chart1",
           titlePanel("Crime & Safety in the Americas"),
           
           # Sidebar with a slider input for selecting countries
           sidebarLayout(
             sidebarPanel(
               uiOutput("selectCountry1"),
               p("This bar graph depicts the crime & safety of seventeen countries in North, South, and Central America. There is a yellow bar representing the crime rate in each of those countries. On the other hand, there is the green bar representing the safety. The lower the crime, the more safer is to live in that country. By selecting one country at a time through the selecting panel, the bar graph reveals that Venezuela in South America has the most crime rate (83.19) which means that it is 16.84 safe. It is also visible that Panama in Central America has the lowest crime rate (43.61) which means that it is 56.39 safe to live.")
               
             ),
             
             # Show a plot of the generated distribution
             mainPanel(
               plotOutput("barGraph")
             )
           ),
  ),
  
  tabPanel("Chart2",
           titlePanel("Healthcare Index in the Americas"),
           
           # Slidebar
           sidebarLayout(
             sidebarPanel(
           sliderInput("slider1", label = h3("Healthcare Index"), min = 50,
                       max = 80, value = 50), 
           p("The map shows the healthcare indexes of each country.The lighter the color the better the healthcare services
              in that particular country and vice versa. The slider to the left controls the range of healthcare indexes among certain countries. 
              For eaxample when the user slidess the slider to 60 the map will display countries with a healthcare index of 60 or lower.")
           
             ),
           # Show a plot of the generated distribution
           mainPanel(
           plotOutput("countryPlot")
           )
           ),
          
  ),
  
  
  tabPanel("Chart3",  titlePanel("Cost of Living"),
           
           
           # Sidebar with a slider input for number of bins
           sidebarLayout(
             sidebarPanel(
               uiOutput("selectRegion"),
               p("The scatter plot shows the relationship between the living cost of a country
                 and the cost of groceries. The drop down menu allows the users to select and compare
                 the different regions of the Americas regarding their living cost and groceries. ")
               
             ),
             
             # Show a plot of the generated distribution
             mainPanel(
               plotOutput("regionPlot"),
               #textOutput("sampleText")
             )
           )),
  tabPanel("Summary Takeaways",
           h3("Three Summary Takeaways:")
           
  ),
  tabPanel("Report")
  
)