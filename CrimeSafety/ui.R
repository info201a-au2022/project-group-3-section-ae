library(shiny)

navbarPage(
  "Crime and Safety",
  tabPanel("Introduction",
           h3("Nowadays, quality of life has become a major concern for all of us and a low quality of life prevents us from being comfortable and secure in our own environment. In today’s society, large numbers of people are extremely worried about their families’ well-being, constantly concerned about people around them, or experiencing financial difficulties. By facilitating conditions that ensure a higher quality of life, individuals will feel happier and more secure. Our group has decided to focus on three main aspects of the quality of life: crime rates, cost of living, and healthcare that helps us in determining which of the countries in North, South, and Central America are the safest to live in. Below are datasets that look at various aspects of a meaningful life. Examining these sets of data will help and give us a clarified comprehension of which nations have the best quality of life.")
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
           ),
           h2("This bar graph depicts the crime & safety of seventeen countries in North, South, and Central America. There is a yellow bar representing the crime rate in each of those countries. On the other hand, there is the green bar representing the safety. The lower the crime, the more safer is to live in that country. By selecting one country at a time through the selecting panel, the bar graph reveals that Venezuela in South America has the most crime rate (83.19) which means that it is 16.84 safe. It is also visible that Panama in Central America has the lowest crime rate (43.61) which means that it is 56.39 safe to live.")
           ),
  
  tabPanel("Chart2"),
  tabPanel("Chart3"),
  tabPanel("Summary Takeaways",
           h3("Three Summary Takeaways:")
           
  ),
  tabPanel("Report")
)