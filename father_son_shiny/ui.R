
# This is the user-interface definition of Exploring Person's Father-Son Data

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Exploring Pearson's Father-Son Data"),

  # Sidebar with a slider input for father height
  sidebarLayout(
    sidebarPanel(
      sliderInput("height",
                  "height of father, in.",
                  min = 55,
                  max = 80,
                  value = 70),
      # include info about the model fit
      textOutput('heightGuess'),
      # include documentation written in markdown
      includeMarkdown('about.md')
      
    ),
    

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("heightPlot")
    ),
  )
))
