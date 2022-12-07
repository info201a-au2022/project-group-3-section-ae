library(shiny)
library(shinythemes)
library(plotly)


navbarPage( theme = shinytheme("darkly"),
            "Quality of Life", 
            tabPanel("Introduction", h1("Overview"),
                     p("Nowadays, quality of life has become a major concern for all of us and a low quality of life prevents us from being comfortable and secure in our own environment. In today’s society, large numbers of people are extremely worried about their families’ well-being, constantly concerned about people around them, or experiencing financial difficulties. By facilitating conditions that ensure a higher quality of life, individuals will feel happier and more secure. Our group has decided to focus on three main aspects of the quality of life: crime rates, cost of living, and healthcare that helps us in determining which of the countries in North, South, and Central America are the safest to live in. Below are datasets that look at various aspects of a meaningful life. Examining these sets of data will help and give us a clarified comprehension of which nations have the best quality of life."),
                     h2("Problem Domain"),
                     h3("Background"),
                     p("Finding the best quality of life in a certain country means analyzing and finding information on different aspects. The three main aspects we have chosen to focus on are crime rate, cost of living, and healthcare. These are some main topics that affect an individual's quality of life and will be the main focus when finding the best countries."),
                     h3("Direct Stakeholders"),
                     p("Some direct stakeholders that are involved in the research of this topic are the individuals in the countries from North and South America and are impacted by crime rate, cost of living, and healthcare. These are things that affect someone living in a country and overall impact their decisions and their community. They are directly affected if there are high crime rates resulting in an unsafe environment, and they are also adding risk. In addition, the cost of living can typically be harmful to the individual if it's high, as it is harder to buy living necessities like food, water, and shelter. Lower cost of living areas tend to be better for people as they can pay for their needs but also have some extra money to use on other activities. Lastly, healthcare and accessibility in an area plays a big role in the community as it has the potential to make individuals feel valued and taken care of with healthcare aids."),
                     h3("Indirect Stakeholders"),
                     p("Some indirect stakeholders that are involved are the governments of each given country. In addition with high crime rates, cost of living and bad healthcare, more citizens are frustrated and they are the ones who need to figure out a way to establish better systems. If the people aren't happy the government is in charge to take care of them and create a working atmosphere."),
                     h3("Human Values"),
                     p("In addition, some human values consist of accessibility, safety, fun, and valued citizens in a certain country. These qualities all makeup what a good quality of life encompasses and what humans value when they move to a new place. Someone should feel as though they can live comfortably without worrying about things that are unintentionally harmful to them. Having accessible help, food, healthcare, and activities allows people to have fun and not have underlying stress about things they cannot control."),
                     h3("Potential Benefits"),
                     p("Some potential benefits of this are creating an atmosphere where people have the best conditions and can live their lives to the fullest . It will create a strong community within each country and increase human population, and accessibility which is an enormous aspect of living. More people will be attended to if they are sick and have a better chance of surviving disease. In addition, the economy will increase and more will feel inclined to come live in that area."),
                     h3("Potential Harms"),
                     p("Lastly, some potential harm could be a country’s image, economy, and population. If the crime rates are really bad in an area and are broadcasted to the world many will assume that it is an unsafe area and won’t think about coming to live there. Not only does this scare others away but it affects the job market for people, and in the long term affects the economy of the country. All these aspects depend on each other and are affected when one thing goes wrong."),
                     
                     h2("Research Questions"),
                     p("How do crime rates correlate with quality of life index?"),
                     p("How does cost of living vs groceries have an impact on the quality of life?"),
                     p("How does healthcare have an impact on the quality of life?"),
                     
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
                         plotlyOutput("regionPlot"),
                         #textOutput("sampleText")
                       )
                     )),
            tabPanel("Summary Takeaways",
                     h3("Three Summary Takeaways:")
                     
            ),
            tabPanel("Report",
                     h1("Code Name"),
                     h1("Quality of Life"),
                     h2("Authors"),
                     p("Daphni George, Trisha Thonupunoori, Aradhana M."),
                     h2("Affiliation"),
                     h2("December 8th, 2022"),
                     h2("Abstract"),
                     p("Our main question is which countries in North, South, and Central America have the best living conditions for its citizens. This question is important because it highlights which countries in those regions have the best and affordable services offered to its people. To address this question, we will focus on three main areas: crime rates, cost of living and healthcare affordability."),
                     h2("Keywords"),
                     p("Quality of Life; Crime Index; Cost of living; Healthcare Affordability"),
                     h2("Introduction"),
                     p("Nowadays, quality of life has become a major concern for all of us and a low quality of life prevents us from being comfortable and secure in our own environment. In today’s society, large numbers of people are extremely worried about their families’ well-being, constantly concerned about people around them, or experiencing financial difficulties. By facilitating conditions that ensure a higher quality of life, individuals will feel happier and more secure. Our group decided to focus on three main aspects of the quality of life: crime rates, cost of living, and healthcare that helps us in determining which of the countries in North, South, and Central America are the safest to live in. Below are datasets that look at various aspects of a meaningful life. Examining these sets of data will help and give us a clarified comprehension of which nations have the best quality of life."),
                     h2("Problem Domain"),
                     h4("Background"),
                     p("Finding the best quality of life in a certain country means analyzing and finding information on different aspects. The three main aspects we have chosen to focus on are crime rate, cost of living, and healthcare. These are some main topics that affect an individual's quality of life and will be the main focus when finding the best countries."),
                     h4("Direct Stakeholders"),
                     p("Some direct stakeholders that are involved in the research of this topic are the individuals in the countries from North and South America and are impacted by crime rate, cost of living, and healthcare. These are things that affect someone living in a country and overall impact their decisions and their community. They are directly affected if there are high crime rates resulting in an unsafe environment, and they are also adding risk. In addition, the cost of living can typically be harmful to the individual if it's high, as it is harder to buy living necessities like food, water, and shelter. Lower cost of living areas tend to be better for people as they can pay for their needs but also have some extra money to use on other activities. Lastly, healthcare and accessibility in an area plays a big role in the community as it has the potential to make individuals feel valued and taken care of with healthcare aids."),
                     h4("Indirect Stakeholders"),
                     p("Some indirect stakeholders that are involved are the governments of each given country. In addition with high crime rates, cost of living and bad healthcare, more citizens are frustrated and they are the ones who need to figure out a way to establish better systems. If the people aren't happy the government is in charge to take care of them and create a working atmosphere."),
                     h4("Human Values"),
                     p("In addition, some human values consist of accessibility, safety, fun, and valued citizens in a certain country. These qualities all makeup what a good quality of life encompasses and what humans value when they move to a new place. Someone should feel as though they can live comfortably without worrying about things that are unintentionally harmful to them. Having accessible help, food, healthcare, and activities allows people to have fun and not have underlying stress about things they cannot control."),
                     h4("Potential Benefits"),
                     p("Some potential benefits of this are creating an atmosphere where people have the best conditions and can live their lives to the fullest . It will create a strong community within each country and increase human population, and accessibility which is an enormous aspect of living. More people will be attended to if they are sick and have a better chance of surviving disease. In addition, the economy will increase and more will feel inclined to come live in that area."),
                     h4("Potential Harms"),
                     p("Lastly, some potential harm could be a country’s image, economy, and population. If the crime rates are really bad in an area and are broadcasted to the world many will assume that it is an unsafe area and won’t think about coming to live there. Not only does this scare others away but it affects the job market for people, and in the long term affects the economy of the country. All these aspects depend on each other and are affected when one thing goes wrong."),
                     h2("Research Questions"),
                     p("How do crime rates correlate with quality of life index?"),
                     p("How does cost of living vs groceries have an impact on the quality of life?"),
                     p("How does healthcare have an impact on the quality of life?"),
                     h2("The Dataset"),
                     h2("Findings"),
                     h2("Discussion"),
                     h2("Conclusion"),
                     h2("References"),
                     
            ),
            
            
            
)