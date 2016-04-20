Next Word Prediction Application
========================================================
author: D. C. Tee  
date: 18 april 2016  
transition: rotate  

  
<small>
Data Science Capstone - Module10  
Johns Hopkins University  
Swiftkey  
</small>

Introduction 
===
<style>
/* slide titles */
.reveal h3 { 
  font-size: 50px;
  color: blue;
}
</style>

<small>
This pitch presentation is for the module 10 - **"Data Science Capstone"**.
A simple and easy to use shiny application (Next Word Prediction Application) is built for the purpose to predict the next most possible word/text based on the input word/text/phrase given by user. This is similar to the text prediction in SMS in the mobile phone where next text is suggested to user so that it save user's time from typing next word.
</small>

<small>
The main consideration in my shinny application is the speed of next-word display to user. If the prediction is slow, the user might as well typing the next word by themself. For this, i trade-off some accuracy of the text prediction. Also, the accuracy is limited by the memory allocated to free shiny application to process large dataset. User documentation is included for detail explanation on the application.   
</small>

<small>
Source code for ui.R and server.R files for the application are available at: 
<https://github.com/teedinchai/m10_Capstone>  
</small>

Algorithm used in the Application
========================================================

<ol style="font-size:22pt; line-height:29px;">
The Capstone dataset used includes twitter and news from HC Corpora. I performed data cleaning, sampling and sub-setting the data to a reasonable size before i saved it in R data frames which will be loaded in the ShinyApp. Text Mining and NLP techniques are applied to the R data frame for the purpose to create <b>N-grams (unigram, bigram and trigram)</b> dataset. <b>Simple backoff algorithm</b> is used to predict the next word when input text are keyed in by user. For the case where no input text is detected, a warning message is displayed to ask user for input text.    
</ol>  
<ol style="font-size:22pt; line-height:29px;">
The user input text is cleaned with same method before compared to the aforementioned N-grams data. The most possible text is displayed and maximum of 5 other possible texts are displayed in table form.
</ol>

<h5>Simple Backoff Algorithm steps:</h5>

<ol style="font-size:18pt; line-height:20px;">
<li>If input text less than two words</li>
  <ul style="width:110%">
  <li>Bigram data loaded to search for next word. If found, next word displayed with other matches.;
  <li>If not found,Unigram data loaded and highest probability word is shown together with other suggestion; 
  </ul>
<li>If input text more than one words</li>
  <ul style="width:110%">
  <li>Trigram data loaded for next word, if found, next word displayed with other matches.;
  <li>If not found, Bigram data loaded to search for next word and display next word if found;     
  <li>If still none matching, the most frequent words in the Unigram data is displayed with other possible word.
  </ul>
</ol>

Next Word Prediction App User Interface
========================================================

![user interface](UIscreenshot.jpg)


Steps to use and how the app function
========================================================
**Steps to use the application (What you have to do):**  
<small>
1) Type in text(s)/word(s)/phrase that you want to see the next most possible text/word') in the text input box  
2) Click the "Start Predict!" button to initiate the app to display next most possible text/word')  
3) Wait within 1 second to enjoy the results. Shiny server problem if you have to wait more than 1 second.
</small>

**How the application function (What you will get/see):**  
<small>
1) User input will be process in the shiny server and the predicted next word will be display automatically in main panel after step (2) in above.  
2) The other possible text(s)/word(s) if exist will be shown also in table format.  
3) Noted that if no input inserted, warning message prompt to request for input text.  
</small>      

