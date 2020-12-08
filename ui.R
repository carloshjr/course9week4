library(shiny)

shinyUI(fluidPage(

    titlePanel("Predict number of people employed from GNP"),

    sidebarLayout(
        sidebarPanel(
            h3("Input the Gross National Product (GNP)"),
            sliderInput("Slidergnp","Gross National Product", min = 240,
                        max = 550, value = 400),
            checkboxInput("showmodel", "Show Linear Model", value = TRUE)
        ),

        mainPanel(
            plotOutput("plot1"),
            h3("Predicted number of people employed"),
            textOutput("pred1")
        )
    )
))
