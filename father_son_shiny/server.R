
# This is the server logic for Exploring Pearson's Data


# Load libraries and data set
library(UsingR)
library(shiny)
data(father.son)

shinyServer(function(input, output) {

  # Calculate the fit once to cache it.
  fit <- lm(sheight ~ fheight, data = father.son)
 
  
  output$heightPlot <- renderPlot({

    # Get height from the ui slider
    selected_height <- input$height
    # predict based on the fit
    predicted_height <- predict(fit, data.frame(fheight=selected_height), interval = 'prediction')
    
    # Plot the points, the lm, and then a point marking the user's 
    # selection
    ggplot(father.son, aes(x = fheight, y=sheight)) + 
      geom_point() +
      geom_smooth(method='lm') +
      geom_point(aes(x = selected_height, y = predicted_height[1,1]), 
                 color = 'red', size = 4)
    
    
  })
  
  output$heightGuess <- renderText({
    # Predict based on chosen value from slider
    selected_height <- input$height
    predicted_height <- predict(fit, data.frame(fheight=selected_height), interval = 'prediction')
    
    # Return text with fit value and confidence interval, rounded.
    text <- paste("For a father height of ", selected_height, ' in. ',
          "a linear regression predicts a height of ", round(predicted_height[1, 1]), 
          " in. for the son, with a 95% confidence interval of ",
          round(predicted_height[1,2]), " to ", round(predicted_height[1,3]), " in.")
  })

})
