library(shiny)
library(datasets)
data(mtcars)
mtcars$am <- factor(mtcars$am, labels=c("Auto", "Manual"))
fit <- lm(mpg ~ am + wt + hp, mtcars)
shinyServer(
    function(input, output) {
        predictF <- reactive({predict(fit, data.frame(wt = as.numeric(input$wt) / 1000,
                                                      hp = as.numeric(input$hp),
                                                      am = input$am))})
        output$wt <- renderText({input$wt})
        output$hp <- renderText({input$hp})
        output$am <- renderText({input$am})
        output$prediction <- renderText({
            predictF()
        })
    }
)