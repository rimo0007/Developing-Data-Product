library(shiny)
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel (
      
      div(h2(code(strong("Predict A Patient Will Survive 5 years or longer  or Die Within 5 Years After A Surgery For Breast Cancer")), style = "color:#DF3D82"))),
    sidebarPanel (
      img(src="3.png", height = 120, width = 400),
      numericInput('age', div('Age Of Patient At Time Of Operation', style = "color:#4A96AD"), 30),
      numericInput('year', div("Patient's Year Of Operation", style = "color:#4A96AD"), 1964),
      numericInput('positivenodes', div('Number Of Positive Axillary Nodes Detected', style = "color:#4A96AD"), 1),
      selectInput("algo", div("Algorithm:",style = "color:#4A96AD"),
                  choices=c("Random Forest")),
      
      submitButton('Submit')
      
    ),
    mainPanel (
      navbarPage((strong(div("Breast Cancer Prediction!!!",style = "color:#CC0033"))),
                 tabPanel((strong(div("Home",style = "color:#CC0033"))),
                          img(src="1.png", height = 150, width = 800),
                          img(src="2.png", height = 40, width = 800),
                          hr(),
                          p(h4("This Predictive model was bulid up on the basis of Haberman's Survival Data Set .",
                               "The dataset contains cases from a study that was conducted between 1958 and 1970 at 
                               the University of Chicago's Billings Hospital on the survival of patients who had undergone surgery for breast cancer.
                               This application will predict the patient survived 5 years or longer or  the patient died within 5 year after a surgery for breast cancer.",
                                 style = "font-family: 'times'; font-si16pt", align = "justify"), 
                              
                              h3 (div((h1(code(strong("Patient Report :")), style = "color:#DF3D82")))),
                            tableOutput("data"),
                            h3 (div((h1(code(strong('Results :')), style = "color:#DF3D82"))))),
                          
                          h3(textOutput("prediction"), style = "color:green"),
                          br(),
                          br(),
                          br()
                          ),
                 tabPanel((strong(div("User Guide",style = "color:#CC0033"))), 
                          strong( h3("To Use this Application Follow the Below Instructions :",br(),style = "color:seagreen")),
                          strong( h4("Step1 : Enter the Age Of Patient At Time Of Operation", br(),
                                     "Step2 : Enter Patient's Year Of Operation",br(),
                                     "Step3 : Number Of Positive Axillary Nodes Detected",br(),
                                     "Step4 : Select the Random Forest Algorithm",br(),
                                     "Step4 : Wait for few seconds to get the Result",br(),
                                     style = "color:seagreen"))),
                 
                 tabPanel((strong(div("Data Set",style = "color:#CC0033"))), h4("This is the Haberman's Survival Data Set that was used to build the Model "), br(),tableOutput("data1"))
                 
      
       
    )
      
    )
  )
  
  
  )

