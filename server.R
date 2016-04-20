################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################
##                                                                            ##
##                   Data Science Capstone Project 2016                       ##
##                                                                            ##            
##                                By D. C. Tee                                ##
##                                                                            ##
##           Github Repo: https://github.com/teedinchai/m10_Capstone          ##
##                                                                            ##
################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################

library(shiny)
library(tm)
library(NLP)

#setwd("C:/Users/user/Desktop/capstone/m10_Capstone")

source("./global.R")
#load preprocess data for faster prediction application
load('./Data/tdm2.RData')
load('./Data/tdm3.RData')
load('./Data/tdm1a.RData')


# Define server logic required to calculate reactive output and plot graph
shinyServer(function(input, output) {
  

  #output$PredictedText <- reactive({
  PredictedText2 <- reactive({ 
    
    if (input$Predict == 0)
      return()
#clean up input text    
    userinput <- as.character(input$text)
    userinput <- tolower(userinput)
    userinput <- removeNumbers(userinput)
    userinput <- removePunctuation(userinput)
    userinput <- stripWhitespace(userinput)
    
    
    if (nchar(userinput)==0 |input == ''|input == "na na"){
      #top6 word if usertext=NULL
      stop ('No input detected. Please key in some input text')
      #tdm1a_5 <- tdm1a[1:6,]
    } 
    
    #if only single text is typed in
    else if(length(userinput)==1){
      usertext<-strsplit(userinput,split=" ")
      usertext<-tail(usertext[[1]],n=1)
      usertext<-paste(usertext,sep="", collapse=" ")
      greptext<-tdm2$MyBigram[grep(paste("^",usertext,"[[:space:]]",sep=""),tdm2$MyBigram)]
#      greptext<-tdm2$dimnames$Terms[grep(paste("^",usertext,"[[:space:]]",sep=""),tdm2$dimnames$Terms)]
      if (length(greptext)!=0) {
        #2gram prediction
        sortgreptext<-data.frame(greptext)
        sortgreptext<-data.frame(tdm2=names(sortgreptext), frequency=sortgreptext)
#        sortgreptext<-sort(rowSums(as.matrix(tdm2[greptext,])), decreasing = TRUE)
#        sortgreptext<-data.frame(tdm2=names(sortgreptext), frequency=sortgreptext)
      } else {
        #1gram prediction
        #top6 word if usertext not found from N-grams
        tdm1a_5 <- tdm1a[1:6,]
      }
    }
    
    # for input text more than one text/word
    else {
      
      usertext<-strsplit(userinput,split=" ")
      usertext<-tail(usertext[[1]],n=2)
      usertext<-paste(usertext,sep="", collapse=" ")
      
      greptext<-tdm3$MyTrigram[grep(paste("^",usertext,"[[:space:]]",sep=""),tdm3$MyTrigram)]
#      greptext<-tdm3$dimnames$Terms[grep(paste("^",usertext,"[[:space:]]",sep=""),tdm3$dimnames$Terms)]
      if (length(greptext)!=0){
        #Predict by 3-gram first
        sortgreptext<-data.frame(greptext)
        sortgreptext<-data.frame(tdm3=names(sortgreptext), frequency=sortgreptext)
#        sortgreptext<-sort(rowSums(as.matrix(tdm3[greptext,])), decreasing = TRUE)
#        sortgreptext<-data.frame(tdm3=names(sortgreptext), frequency=sortgreptext)
      } else {
        usertext<-strsplit(userinput,split=" ")
        usertext<-tail(usertext[[1]],n=1)
        usertext<-paste(usertext,sep="", collapse=" ")
        greptext<-tdm2$MyBigram[grep(paste("^",usertext,"[[:space:]]",sep=""),tdm2$MyBigram)]
#        greptext<-tdm2$dimnames$Terms[grep(paste("^",usertext,"[[:space:]]",sep=""),tdm2$dimnames$Terms)]
        if (length(greptext)!=0) {
          #Predict by 2-gram next
          sortgreptext<-data.frame(greptext)
          sortgreptext<-data.frame(tdm2=names(sortgreptext), frequency=sortgreptext)
#          sortgreptext<-sort(rowSums(as.matrix(tdm2[greptext,])), decreasing = TRUE)
#          sortgreptext<-data.frame(tdm2=names(sortgreptext), frequency=sortgreptext)
        } else {
          #Predict by 1-gram last 
          tdm1a_5 <- tdm1a[1:6,]
        }
      }
    }
  })
  
#Most possible next text/word
  output$PredictedText <- renderText({
    if (input$Predict == 0)
      return()
    a<-PredictedText2()
#    lastword<-as.character(a[1,1])
#    lastword<-tail(strsplit(lastword, split=" ")[[1]],1) 
    lastword<-as.character(a[1,2])
    lastword<-tail(strsplit(lastword, split=" ")[[1]],1)
  })

#Other possible text(s)/word(s)   
  output$PredictedText1 <- renderTable({
    if (input$Predict == 0)
      return()
    ab<-PredictedText2()
    ab<-as.character(ab[,2])
    ab<-strsplit(ab, split=" ")
    ab<-data.frame(ab)
    ab<-t(ab)
    ab<-data.frame(ab[-3,ncol(ab)])
    names(ab)<-"other possibilities"
    rownames(ab)<-NULL
    head(ab,5)
#    ab<-as.character(ab[,1])
#    ab<-strsplit(ab, split=" ")
#    ab<-data.frame(ab)
#    ab<-t(ab)
#    ab<-data.frame(ab[-1,ncol(ab)])
#    names(ab)<-"other possibilities"
#    rownames(ab)<-NULL
#    head(ab,5)
  })
  
})
