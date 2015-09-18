## load needed library
library(shiny)
library(reshape)
require(rCharts)

## create dataset
set.seed(1)
a1 <- round(c(1:100), digits = 0)
a <- round(as.integer(rnorm(100, mean = 20, sd = 6), digits = 2))
b <- round(as.integer(rnorm(100, mean = 25, sd = 4), digits = 2))
c <- round(as.integer(rnorm(100, mean = 15, sd = 2), digits = 2))
d <- round(as.integer(rnorm(100, mean = 28, sd = 3), digits = 2))
e <- round(as.integer(rnorm(100, mean = 24, sd = 5), digits = 2))
data <- as.data.frame(cbind(a1,a,b,c,d,e))
colnames(data) <- c("day", "Noah", "Emma", "Ethan","Abigail", "Lucas")

shinyServer(function(input, output) {
        
        output$Tabledata <- renderTable({
                data[c(input$n[1]:input$n[2]),]
        })
        
        output$Summary <- renderPrint({
                summary(data[c(input$n[1]:input$n[2]),c(2:6)])
        })
        
        output$Boxplot <- renderPlot({
                boxplot(data[c(input$n[1]:input$n[2]),c(2:6)])
        })
        
        output$Hist <- renderPlot({
                hist(data[c(input$n[1]:input$n[2]), as.character(input$name)], col = "BLUE", border = "Yellow", main = paste("Histogram of", as.character(input$name)), xlab = "number of km runned")
        })
        
        output$text2 <- renderPrint({
                paste("a histogram of the results of", as.character(input$name))
        })
        output$myChart <- renderChart({
                df <- data[data$day >= input$n[1] & data$day <= input$n[2],]
                df_m <- melt(df, id.vars = "day")
                n1 <- nPlot(value ~ day, group = "variable", data = df_m, type = "multiBarChart")
                n1$addParams(dom = 'myChart')
                return(n1)
        })
}
)
