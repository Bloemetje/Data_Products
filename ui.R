library(shiny)

shinyUI(fluidPage(
        titlePanel("Results"),
        br(h6("During a period of 100 months data is collected (per month) of five people 
              (Noah, Emman, Ethan, Abigail and Lucas) who were running for fun.
              To look at the data, first select in the slider (please select period) the periode you want to view.
              The tab summary, boxplot and rChart gives a overview of the data for the selected period.
              In the tab Hist you can view the histogram of the data for the selected period and
              person with is selected in the selectbox (please select name for histogram).
              The data tab contains the raw data.
              ")),
        
        br(fluidRow(
                column(6, sliderInput("n", "please select period", 
                                      min = 1, max = 100, value = c(1,10))
                ),
                column(6, selectInput("name", "please select name for histogram",
                                      choices = c("Noah", "Emma", "Ethan", "Abigail", "Lucas"),
                                      selected = "Lucas"))
        )),
        
        br(fluidRow(
                navlistPanel(
                        tabPanel("summary", 
                                 print("summary of the raw data"),
                                 verbatimTextOutput('Summary')
                        ),
                        
                        tabPanel("Boxplot",
                                 print("A boxplot of your data results"),
                                 plotOutput("Boxplot")
                        ),
                        
                        tabPanel("rChart",
                                 showOutput("myChart", lib = "nvd3") 
                        ),
                        
                        tabPanel("Hist",
                                 textOutput("text2"),
                                 plotOutput("Hist")
                        ),
                        
                        tabPanel("data", 
                                 print("The raw data"),
                                 tableOutput('Tabledata')      
                        )
                )
        )
)
))
