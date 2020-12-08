library(shiny)
data("longley")

shinyServer(function(input, output) {
    model1 <- lm(Employed ~ GNP, data = longley)
    model1pred <- reactive({
        gnp1 <- input$Slidergnp
        predict(model1, newdata = data.frame(GNP = gnp1))
    })

    output$plot1 <- renderPlot({
        gnp1 <- input$Slidergnp
        plot(longley$GNP, longley$Employed, xlab = "Gross National Product", ylab = "Number of people employed",
             xlim = c(240, 550), ylim = c(60, 71))
        if(input$showmodel) {
            abline(model1, col = "red", lwd = 2)
        }
        legend(395, 120, c("Prediction Model"))
        points(gnp1, model1pred(), col = "blue", pch = 16, cex = 2)
    })

    output$pred1 <- renderText({
        model1pred()
    })
})
