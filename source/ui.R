library(shiny)
library(shinythemes)
library(plotly)
library(readr)
datasets <- read_csv("https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-ae/main/data/Datasets%20-%20Sheet1.csv")

navbarPage( theme = shinytheme("darkly"),
            "Quality of Life", 
            tabPanel("Introduction", h1("Overview"),
                     p("Nowadays, quality of life has become a major concern for all of us and a low quality of life prevents us from being comfortable and secure in our own environment. In today’s society, large numbers of people are extremely worried about their families’ well-being, constantly concerned about people around them, or experiencing financial difficulties. By facilitating conditions that ensure a higher quality of life, individuals will feel happier and more secure. Our group has decided to focus on three main aspects of the quality of life: crime rates, cost of living, and healthcare that helps us in determining which of the countries in North, South, and Central America are the safest to live in. Below are datasets that look at various aspects of a meaningful life. Examining these sets of data will help and give us a clarified comprehension of which nations have the best quality of life."),
                     tags$img(src ="https://images.unsplash.com/photo-1499209974431-9dddcece7f88?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80", height = "400", width = "800"),
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
                     h2("Datasets"),
                     h3("Dataset 1: Crime Rates"),
                     p("The crime rates dataset relates to our problem domain as it is one of the specific factors we decided to analyze when it comes to the quality of life in countries located in the Americas. The crime rates dataset includes data on the crime index for each country as well as that country's safety index. This dataset will help answer the research question about which country has the safest environment in regards to criminal activity."),
                     h3("Dataset 2: Cost of Living"),
                     p("The cost of living dataset relates to our problem domain as it's another one of the factors that we are analyzing to determine the quality of life in each country located in the Americas. The cost of living datasets are based off of New York City's cost of living. Additionally this dataset includes the groceries index. Using the cost of living and groceries index we can see the cost relationship between each countries living cost as well as food costs.  It will help answer the research question which country has the most affordable living conditions"),
                     h3("Dataset 3: Healthcare Index"),
                     p("The healthcare dataset relates to our problem domain as it examines the healthcare aspect of the quality of life in countries located in the Americas. The dataset ranks each country on its healthcare index. This dataset will help answer which country have better healthcare systems and which places do not have as highend healthcare services "),
                     h3("Dataset 4: Healthcare Expenditure"),
                     p("The healthcare expenditures relate to our problem domain because it helps answer the question which country has the most affordable healthcare. This dataset shows how much out of pocket expenditure for healthcare occurs in each country. The dataset and the healthcare index dataset together will help answer the question which countries have the most viable healthcare based on quality service and price."),
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
                         plotlyOutput("countryPlot")
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
                     tags$img(src ="https://images.unsplash.com/photo-1498050108023-c5249f4df085?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2972&q=80", height = "400", width = "800"),
                     h2("Summary Takeaways",
                        h4("Our first takeaway focuses on the crime and safety index of the quality of life. Through the bar graph, we learned that Venezuela in South America has the highest crime rate. Knowing this, it allows us to analyze the correlation between how much crime vs. how safe it is. Generally, the lower the crime rate, the safer it is to live in. Though, this has a high crime rate, this does not reflect or paint the real situation of the nation, just something for the individuals to be cautious about because there may be other conditions that people are facing."),
                        h4("Through our study, we also noticed how most of the South American continents lacked infrastructure in order to provide easy access to healthcare. High crime rates were also another thing that was pretty consistent throughout most of those countries. This could indicate a lack of development in certain areas therefore affecting crucial things within society. This is something that we should be aware of and also understand that each country faces different challenges."),
                        h4("Lastly,another takeaway we were able to learn is how crucial is it for civilians to be aware of their countries crime index, cost of living and healthcare access. These all play such a big role upon people’s lives and if they are not aware of these aspects, their quality of life can be altered. In order to maintain a good lifestyle you need to be informed about these things before you make a decision.")
                     )
                     
                     
            ),
            tabPanel("Report",
                     h1("Project Quality-Life"),
                     h1("Quality of Life"),
                     h2("Authors"),
                     p("Daphni George, Trisha Thonupunoori, Aradhana M."),
                     h2("Affiliation"),
                     p("INFO-201: Technical Foundations of Informatics - The Information School - University of Washington"),
                     h2("Date"),
                     p("Autumn 2022"),
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
                     (fluidPage(titlePanel("Datasets"),
                                sidebarLayout(
                                  sidebarPanel(
                                    selectInput("dataset", "Select a Dataset", choices = datasets$`Name of Data File`)
                                  ),
                                  mainPanel(
                                    tableOutput("data")
                                  )
                                )
                     )
                     ),
                     h2("Findings"),
                     p("Through our charts and studying our data, we were able to analyze different countries and their aspects, to find the best quality of life in the world. When observing the crime rates, cost of living, and health care within these countries we were able to find some similarities and differences between each region. We compared North, South, and Central American countries and used 18 of them to make our project more concise. Within looking at the crime rates in relation to the quality of life we noticed that through our scatter plot in South America there were around 17 countries that had lower than a $40 groceries and cost of living index. This indicates that most countries within South America have a cheaper cost of living compared to around the world. The population of South America could be higher as considering a more affordable cost of living, more people will resort to living there. But in comparison when looking into North America there is almost a direct opposite of the graph as almost all of the countries are higher than $65 for the grocery and quality of life except one. We can tell that North American countries indicate a much higher cost of living index overall in consideration of the high grocery index as well. Central America has a neutral scatterplot with 3 countries and each in a low, medium, and high level. We can see that a higher cost of living within a country makes it harder for civilians to survive and everything is more expensive. Regarding if healthcare has an impact on the quality of life, we can see that through our map. As indicated, we can see that North America has a better healthcare index as it is lighter in color than South America. In South America, there are mostly medium blue colors with some parts being pretty dark. We can tell by this that in North America healthcare access is better but also has a more expensive cost of living to be sustainable. In South America, there is a cheaper cost of living, and healthcare accessibility is lower as not as much money is being provided for that amenity. With a lower cost of living there is a lower amount of tax on goods and less money can be supplied for healthcare, insurance, and economic amenities. We can see the crime and safety index within these regions as well, looking at the bar graphs. Some South American countries listed have a high crime rate indicating a low safety index. Such as Venezuela and Argentina. Although in North America some countries such as Trinidad and Tobago Dominican Republic also have high crime rates. This, therefore, indicates that there isn’t a strong relationship between healthcare and cost of living affecting crime rates as it is present in both regions. It truly depends on the country and there are high and low crime and safety indexes in both regions. Throughout our charts, we were able to depict certain similarities and understand the reasoning behind how healthcare, crime rates, and cost of living affects certain regions."),
                     h2("Discussion"),
                     p("Understanding which countries have a better quality of life and why they have a better quality of life is important because it is the key to improving life for all people in all nations. In our project we honed our focus onto central, south and north america. We tried to understand the factors behind a country's quality of life which is why we narrowed it down to three aspects: crime, healthcare and cost of living. As observed in our findings the cost of living in south american countries is much lower than north american countries. Overall living in South America is cheaper than in North American countries. This could imply numerous things: perhaps products in South American countries are producing more products to sell and therefore can afford to lower the cost of living for their citizens or it could also mean that what's being sold could be made of cheaper quality. Looking at the crime index in different countries we observed that crime index vary greatly between the americas. Compared to north american countries, south american countries tend to have the higher crime indexes. This could be because South American countries have lower policies to keep crime rates low or simply don't have the resources to do so compared to countries with lower crime indexes. Finally looking at the healthcare services in different countries, once again north america appears to offer better healthcare than southern and central america. This could be because these countries have more power to offer better healthcare services or simply are able to offer better training to their medical professionals. Looking at these three aspects overall it's important to identify countries that are doing well in each aspect as these countries will offer the best living conditions for people to live their life. Aside from that, identifying in which areas a particular country may be struggling in supporting their citizens signals the need for more resources and public policies directed in that particular area."),
                     h2("Conclusion"),
                     p("In conclusion, our group chose this topic because we realize that there are many people around the world that are being concerned the people around them, their wellbeing, and the expenses within groceries in their country. Through researching information, data wrangling, creating informative and interactive visualizations, we are able to inform individuals which countries are the safest to live in and that are being impacted by these issues. Each country varied within these three overarching topics, and we compared the differences between the countries that have data for all. Investigating these areas provided us with a solid grasp of how these correlates with each other and determine which country is the safest to live in."),
                     p("If we could leave our audience with one key point, learn from different information and be cautious of what is going on around you. There are many people around the world that are being concerned the people around them, their wellbeing, and the expenses in their country. The data is not meant to pinpoint specific data that may not accurately depict the reality in the country, but rather to inform, learn about different countries and possibly the right place, especially for people who are having concerns about how they live their life. It is merely a warning sign to the government that this may be a public policy priority. Just because some countries have greater crime rates, higher expenditures on groceries, and poor healthcare services does not imply to cause some sort of harm to the society, but to encourage people in their countries to be cautious about what’s happening around the world."),
                     p("In this project, we analyzed data that help us answer questions, such as how crime rates correlate with the quality-of-life index, how cost of living vs groceries has an impact on the quality of life and how healthcare has an impact on quality of life. So, this project was to show individuals from North, South, and Central America about finding a country that is the safest to live, in regard to crime rates, cost of living in groceries, and healthcare services. Finally, we were able to learn to analyze & real-world information by data wrangling and creating interactive visualizations to help us better understand this and create a meaningful impact for people who are trying find the right place for them to live in!"),
                     h2("References"),
                     p("Cooper, W. (2022, October 14). Top 10 safest countries in the world for expats. William Russell. Retrieved October 31, 2022, from https://www.william-russell.com/blog/safest-countries-in-the-world-for-expats/"),
                     p("Health care. Cost of Living. (2022). Retrieved October 30, 2022, from https://www.numbeo.com/health-care/rankings_by_country.jsp"),
                     p("Numbeo. (2022). Crime. Cost of Living. Retrieved October 30, 2022, from https://www.numbeo.com/crime/rankings_by_country.jsp"),
                     p("Numbeo. (2022). Cost of living. Cost of Living. Retrieved October 30, 2022, from https://www.numbeo.com/cost-of-living/rankings_by_country.jsp"),
                     p("Out-of-pocket expenditure per capita on healthcare. Our World in Data. (2019). Retrieved October 31, 2022, from https://ourworldindata.org/grapher/out-of-pocket-expenditure-per-capita-on-healthcare"),
                     p("Unsplash. (n.d.). Download Free Pictures & Images [HD]. Unsplash. Retrieved December 8, 2022, from https://unsplash.com/images")
                     
                     
            ),
            
            
            
)