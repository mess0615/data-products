library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Auto MPG Prediction"),
    sidebarPanel(
        p("This application uses a multivariate linear model to predict the fuel economy of a vehicle.
           The model is built using the mtcars dataset."),
        p("Choose values below  for the vehicles weight (lbs), horsepower (hp) and transmission type to 
           see its estimated MPG."),
        numericInput("wt", "Weight (lbs):", 2000, min = 0, max = 5000, step = 100),
        numericInput("hp", "Horsepower (hp):", 150, min = 0, max = 500, step = 5),
        radioButtons("am", "Transmission Type:", c("Auto" = "Auto", "Manual" = "Manual"))
    ),
    mainPanel(
        h2("Prediction Results:"),
        h3("You entered:"),
        h4("Weight:"),
        verbatimTextOutput("wt"),
        h4("HP:"),
        verbatimTextOutput("hp"),
        h4("Transmission Type:"),
        verbatimTextOutput("am"),
        h3("Predicted MPG:"),
        verbatimTextOutput("prediction")
    )
))