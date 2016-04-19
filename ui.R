
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

# Define UI for Coursera-Text Prediction Application
#shinyUI(pageWithSidebar(
shinyUI(fluidPage(theme = "bootstrap.css",  
  # Application title
  headerPanel("Next Word Prediction Application - Coursera 2o16"),

  sidebarPanel(
    h4('Input Word for Prediction'),
    h5('~Please type in word/text/phrase that you want to know what is 
       the most possible next word/text/phrase'),
    h5('~Only English words are prefered =)'),
    
    br(),
    textInput(inputId="text", label = "Your word/text/phrase here:"),
    
    br(),
    h5('Press button below to start prediction'),
    
   actionButton("Predict", "Start Predict!")
    
  ),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Main Prediction Results",
        h4('The most possible next word/text predicted based on your input is:'),
        verbatimTextOutput("PredictedText"),
        
        br(),
        
        #display the top 5 most possible next word/text based on user input     
        h4('Other possible next word(s)/text(s):'),
        tableOutput("PredictedText1"),
        br(),
      
      h4('~Notes~'),
      h5('The results suppose to display within 1 second.'),
      h5('If no results display within 1 second, it might due to shiny server problem or any unknown reasons'),
      h5('Please be patient =)')

      ),


      tabPanel("User Documentation", 
               
        h3('Introduction about the application'),
        p('This shiny application (Next Word Prediction Application) is built for the 
          purpose to predict the next most possible word/text based on the input word/text/phrase given by user. This is 
          similar to the text prediction in SMS in the mobile phone where next text is suggested to user so that it save
          time from typing.'),
        p('The user is required to type in text(s)/word(s)/phrase(s) that he/she is interested. Only English word
          is supported due to this Data-Science Capstone is conducted in English language. The most possible next text/word
          will be shown to user after user press the "Start Predict!" button. In addition, other possible text(s)/word(s)
          following the most possible text/word is also presented in the table form for variety of next text/word options.'),
        p('The accuracy for the predicted next text/word might not be very high due to limited data resources, trade off between
          accuracy and computation time (time response to display next text/word to user). This shinny application is designed to
          response to user within 1 second. The data for prediction model comes from Swiftkey (partner for coursera for this
          capstone project). The data include twitter data (en_US.twitter), news data (en_US.news) and blogs data (en_US.blogs).
          These data are pre-process for tokenization, n-gram (Unigram, Bigram and Trigram) and term document matrix before the 
          final data are loaded into the program. This can faster the response of the program.'),
        p('The next word prediction algorithm is based on simple backoff algorithm. If the input text is only one word, the next
          word is searched from extracted Bigram data. If next word not found, Unigram data with highest occurance is displayed. 
          If input text more than one word, next word is searched from Trigram data, if not found, then Bigram data is searched 
          for matching, if still not found, Unigram data is used. If no text is input by user, warning message will prompt out 
          to request user to type in text.'),
    br(),
        h3('Steps for using the application'),
        p('You are required to do two things on sidebar panel:'),
        p('1) Type in text(s)/word(s)/phrase(s) that you want to see the next most possible text/word'),
        p('2) Click the "Start Predict!" button to initiate the app to display next possible text/word'),
        code('NOTE: You must click the "Start Predict!" for the app to display results'),
    br(), br(), 
        p('Visualize results on main panel:'),
        p('1) The predicted next text/word will be display in main panel together with other possible text(s)/word(s) if exist'),
    br(),
        h3('Link to server.R and ui.R codes at github'),
        p('https://github.com/teedinchai/m10_Capstone'),
    br(),
    h3('Link to Milestone project for data-preprocessing at Rpubs'),
    p('https://rpubs.com/DC_Tee/162392'),
    br(),
      h4('Hope you enjoy this simple text prediction application !'),
    br(), br()           
      )
    )
  )
  
))
