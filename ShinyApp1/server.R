# Load packages ----
library(shiny)
library(quantmod)
# adjusts yahoo finance data with the monthly consumer price index 

# Server logic
shinyServer(function(input, output) {
    
    dataInput <- reactive({
        getSymbols(input$symb, src = "yahoo", 
                   from = input$dates[1],
                   to = input$dates[2],
                   auto.assign = FALSE)
    })
    
    output$plot <- renderPlot({
        
        chartSeries(dataInput(), theme = chartTheme("white"), 
                    type = input$ctype, TA = NULL)
    })
    
})

