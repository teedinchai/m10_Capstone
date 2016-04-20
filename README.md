# m10_Capstone for Coursera Data Science Specilization


### Introduction about the application
This shiny application (Next Word Prediction Application) is built for the 
purpose to predict the next most possible word/text based on the input word/text/phrase given by user. This is 
similar to the text prediction in SMS in the mobile phone where next text is suggested to user so that it save
time from typing.  
The user is required to type in text(s)/word(s)/phrase(s) that he/she is interested. Only English word
is supported due to this Data-Science Capstone is conducted in English language. The most possible next text/word
will be shown to user after user press the "Start Predict!" button. In addition, other possible text(s)/word(s)
following the most possible text/word is also presented in the table form for variety of next text/word options.  
The accuracy for the predicted next text/word might not be very high due to limited data resources, trade off between
accuracy and computation time (time response to display next text/word to user). This shinny application is designed to
response to user within 1 second. The data for prediction model comes from Swiftkey (partner for coursera for this
capstone project). The data include twitter data (en_US.twitter), news data (en_US.news) and blogs data (en_US.blogs).  
These data are pre-process for tokenization, n-gram (Unigram, Bigram and Trigram) and term document matrix before the 
final data are loaded into the program. This can faster the response of the program.  
The next word prediction algorithm is based on simple backoff algorithm. If the input text is only one word, the next
word is searched from extracted Bigram data. If next word not found, Unigram data with highest occurance is displayed.   
If input text more than one word, next word is searched from Trigram data, if not found, then Bigram data is searched 
for matching, if still not found, Unigram data is used. If no text is input by user, warning message will prompt out 
to request user to type in text.  


###Steps for using the application
You are required to do two things on sidebar panel:  
**(1)** Type in text(s)/word(s)/phrase(s) that you want to see the next most possible text/word  
**(2)** Click the "Start Predict!" button to initiate the app to display next possible text/word  
        **NOTE: You must click the "Start Predict!" for the app to display results**  
        
###Visualize results on main panel:  
**(1)** The predicted next text/word will be display in main panel together with other possible text(s)/word(s) if exist')  

####Link to server.R and ui.R codes at github
        https://github.com/teedinchai/m10_Capstone  

####Link to Milestone project for data-preprocessing at Rpubs  
    https://rpubs.com/DC_Tee/162392
        