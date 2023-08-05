import nltk
from nltk.sentiment import SentimentIntensityAnalyzer
import numpy as np
import module1 as t1
import settings

def sentiment():
    df = t1.rename_columns()
    sentiments = SentimentIntensityAnalyzer()
    # Create sentiment column
    # Calculate sentiment scores for each review and assign 'positive' or 'negative' based on the scores
    scores = df['reviews_text'].apply(lambda text: sentiments.polarity_scores(text))
    df['sentiment'] = scores.apply(lambda score: 'positive' if score['pos'] > score['neg'] else 'negative')
    return df

def process_text():
    df = sentiment()
    # Tokenize the reviews_text column using nltk's word_tokenize function
    
    tokens = df['reviews_text'].apply(lambda text: nltk.word_tokenize(text))
    # Normalize the tokenized words using the normalize function from settings
    df['reviews_text'] = tokens.apply(lambda token: settings.normalize(token))
    return df

def export_the_dataset():
    # Call process_text() to get the cleaned dataset with sentiment analysis and tokenization
    df = process_text()
    # Export the cleaned dataset to a new CSV file named 'ecommerce.csv'. use index = False.
    df.to_csv("ecommerce.csv")
    return df



# TASK 4: Load the Cleaned dataset 'ecommerce.csv' to the database provided.
# follow the instruction in the Task 5 description and complete the task as per it.

# check if mysql table is created using "ecommerce"
# Use this final dataset and upload it on the provided database for performing analysis in MySQL
# To run this task click on the terminal and click on the run project



