library(shiny)
library(httr)
library(caret)
library(randomForest)
library(rpart)
f<- read.csv("data/haberman.csv",sep=",", header=T)
f$Status <- as.factor(f$Status)
m <- randomForest(Status~ ., data=f)

shinyServer(
  function(input, output){ 
    
    output$prediction <- renderPrint ({
      Age = input$age
      Year = input$year
      PositiveNodes = input$positivenodes
      testdata<- data.frame(Age,Year,PositiveNodes)
      testdata$status <- predict(m, testdata)

     if(testdata$status=='1' & input$year <2015)
       print("The patient survived 5 years or longer after her breasr surgery")
     if(testdata$status=='2' & input$year <2015) 
       print(" The patient died within 5 years after her breasr surgery")
     if(testdata$status=='1' & input$year >2015)
       print("The patient will survive 5 years or longer!!!")
     if(testdata$status=='2' & input$year >2015)
       print(" The patient will die within 5 years!!!")
    
      
    output$data<- renderTable({
        testdata[, 1:3]
      })
    
    output$data1<- renderTable({
      f
    })
      
      }) 
  }
  
  )

#shinyapps::deployApp('F:/R_Coding/Developing Data Products/CourseProject')
#shinyapps::deployApp('F:/R_Coding/Developing Data Products/proj1',account='kalyannandi1')
#https://kalyannandi1.shinyapps.io/proj2