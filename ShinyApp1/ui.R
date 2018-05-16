# Load packages ----
library(shiny)
library(quantmod)

shinyUI(fluidPage(
    titlePanel("Stocks and Indices Price Fluctuation"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Select a stock to examine. 
                     Information will be collected from Yahoo finance."),
            
            #  A Select Input to choose the stock symbol
            selectInput("symb", "Choose a symbol:",
                        list(`Stock` = c("GOOG", "AAPL", "IBM","MSFT"),
                             `Exchange` = c("SGX", "BSE", "INX","DAX"))
            ),
            #Date Range
            dateRangeInput("dates", 
                           "Date range",
                           start = "2018-01-01", 
                           end = as.character(Sys.Date())),
            
            br(),
            br(),
            
          #  checkboxInput("ctype", "Plot as candlesticks", 
           #               value = FALSE),
          radioButtons("ctype", "Show as",
                             c("Line" = "line",
                             "Candle Sticks" = "candlesticks",
                               "Match Sticks" = "matchsticks",
                               "Bars" = "bars"))
            
    ),
    mainPanel(plotOutput("plot"))
))
)