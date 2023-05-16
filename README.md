# FOUR-WINE-Os

## WHY:  Quality of Portugal Wines!  

How does one determine the best quality of wine?  Is it about taste? Color? What region is it from?  How about chemical properties?  

The Four-WINE-Os are here to help wine enthusiasts gather more information on Portugal wines through the exploration of over 2000 types of wine from over 13 different regions.  We will show the quality rating score of 1 to 10 (1 being the highest) of Portugal wines based on several different factors to include sugar, sulphate, pH, sulfur dioxide, citric acid, and more. 

Let’s help you discover what is determined the best quality of Portugal wine based on chemical properties! 

## QUESTIONS

  * Which of these variables, if any, have the largest correlation between their value and the quality of the wine?
  * Can machine learning be used to predict the qualty of a wine based upon an analysis of it's various chemical properties?


## DATA DESCRIPTION

The data is made up of both chemical and sensory data for 2037 unique wines, all hailing from a single wine-producing area of Portugal. 11 pieces of numerical chemical data were collected for every wine featured in the dataset, with all the values existing as continuous variables.

 -Fixed Acidity
 
 -Volatile Acidity
 
 -Citric Acid
 
 -Residual Sugar
 
 -Chlorides
 
 -Free Sulfur Dioxide
 
 -Total Sulfur Dioxide
 
 -Density
 
 -pH
 
 -Sulphates
 
 -Alcohol

The data is mostly clean and saw few complications when preparing it for loading into an SQL database, except the alcohol column. Some of the data points were strings that contained multiple decimal points and could not be converted to float values, so we opted to drop those specific data points. That was accomplished with the following lines of code: 

```
check_decimals = lambda x: str(x).count('.') <= 1

remove_extra_decimals = wine_df['alcohol'].apply(check_decimals)

wine_df = wine_df[remove_extra_decimals]
```

Upon removing the offending data and reclassifying the column as float values, the data loaded correctly into our database and also was able to be scaled and prepared for machine learning.

![image](https://user-images.githubusercontent.com/14171474/236974667-99a8d14e-c829-4659-a1d9-a2ee48ecb3ce.png)

## DATA EXPLORATION

The final piece of data present in the dataset is a ranking of quality gathered by individuals from sensory data taken from tasting the wines. This quality ranking falls on a scale of 1 to 10, with 1 being the highest and 10 being the lowest, although there were only actual results between 3 and 9. The data is heavily weighted towrds middle values, with 1924 of the 2037 wines sampled being given a final quality ranking of either 5, 6 or 7. This concentration of data in the middle of the possible values is reflected in the summary statistics of the entire dataset, which finds the inner-quartile range of the quality values to exist entirely between the scores of 5 and 6.

The chemical data all fall on varying scales, with some chemical values numbering in the thousands, while others are distinguished by hunderdths of a decimal. The chemical values all seem to represent an acceptable spread of values, with the exception of the density, which returns a maximum value of over 100 despite a mean of barely over 1, so that value will be treated as either an error or an extreme outlier and will be removed from the dataset.

## DATA ANALYSIS



We created a histogram that displays the number of wines for each quality rating to give an overview of the data we are working with.
```
hist = px.histogram(df, x='quality')
```
Quality Distribution
* 1: 0
* 2: 0
* 3: 3
* 4: 40
* 5: 589
* 6: 944
* 7: 391
* 8: 66
* 9: 4
* 10: 0

There are zero wines that have a quality of 1, 2, or 10. A vast majority of the wines got a rating of 5, 6, or 7.

Then we grouped the data by quality to find the average property value for each quality rating.
```
df.groupby(by=["quality"], as_index=False).mean()
```
Since the primary objective of our analysis is to discover the relationship between wine properties and quality rating, we performed a linear regression analysis on each property vs quality rating (single_variable_linear_regression.ipynb).

<img width="134" alt="image" src="https://github.com/MMosquito/Four_WINE-Os/assets/79022140/3ef8d8be-b450-4673-91fd-d9a1b82531d9">

For most properties, there is no correlation to quality. There is a low negative correlation for "chlorides" (-0.3) and "total sulfur dioxide" (-0.18).

## Machine Learning Model

The type of model this dataset would require would perform categorical classification in order to try and predict the quality rating of the wine given the chemical properties. We created models of the following types in order to try and fit an accurate model to the data:

* Decision Tree
* Random Forest Classifier
* Extra Forest Classifier
* Support Vector Machine

These models saw limited success, with the highest accuracy score only reaching around 60%, and several of the models seeing dramatically worse performance.

![image](https://github.com/MMosquito/Four_WINE-Os/assets/119082569/130b1893-612a-4415-af49-4f34cd698d46)

![image](https://github.com/MMosquito/Four_WINE-Os/assets/119082569/88f55a1c-5d82-4ba9-b652-ab2b2abebb0a)

![image](https://github.com/MMosquito/Four_WINE-Os/assets/119082569/0cadab40-d70a-43ad-bc3d-339e18690b84)

The most successful model was an extra forest classifier model with 50 estimators, which returned the following confusion matrix and classfication report:

![image](https://github.com/MMosquito/Four_WINE-Os/assets/119082569/80498596-42a4-401b-98d2-da08818d0fcd)

![image](https://github.com/MMosquito/Four_WINE-Os/assets/119082569/720ce8d7-2024-4662-a915-dc245e58dfbf)

A neural network model using the cateogrical cross-entropy loss estimator is a work in progress, it has returned 51% accuracy but is still a work in progress.

![image](https://github.com/MMosquito/Four_WINE-Os/assets/119082569/422c9195-5363-4a43-8fe2-cb7e0481b978)

Further work on improving these models will focus on eliminating features that are negatively impacting model performance and dialing in the model structure.

## DASHBOARD

[(https://public.tableau.com/views/Updated_FOUR-WINE-Os/FOUR-WINE-OsDashboard?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link)](https://public.tableau.com/app/profile/melissa.mosquito/viz/Updated_FOUR-WINE-Os/FOUR-WINE-OsDashboard?publish=yes)

REGION MAP:

![WineMapofPortugal](https://user-images.githubusercontent.com/14171474/234731441-6d4f7538-121a-4f90-848f-42fa3d7b3226.png)


## "GRAPHS" BRANCH

* graphed the number of wines for each quality rating
* did a groupby on the quality column and searched for vairables that had a noticable coorelation to quality

## FILES PRESENT IN REPOSITORY

-'ERD.png' is an image of the entity relationship diagram created to lay out the structure of our database.
-'Updated_wine_queries.sql' is a series of queries that convert the tables in the database into a single table using joins
-'preprocessed_wine_data.csv' is the data after it has been processed for outlier data and faulty data points
-'wine_data_preprocessing.ipynb' is the code for the preprocessing of the data
-'wine_queries.sql' is the initial set of queries for database management before editing
-'wine_schema.sql' is the set of queries that create the tables in the database for the data to be loaded into

## TECHNOLOGIES - LANGUAGES - TOOLS - ALGORITHMS

Confusion Matrix, Decision Tree Classifier, Github Pages, Jupyter Notebook, Linear Regression, Matplotlib, Microsoft Powerpoint, Numby, Pandas, PostgreSQL, Random Forest Classifier, Scatter Plots, SKLearn, Standard Scaler, Tableau, Visual Studio Code

## CITATIONS

- "Portugal Wine Data"; Marilia Prata; https://www.kaggle.com/datasets/mpwolke/cusersmarildownloadswinecsv?resource=download. 2021
- "The WInes of Portugal (Organized by Region)"; Madeline Puckette; https://winefolly.com/deep-dive/what-wines-to-drink-from-portugal-by-region/winefully.com. 2023
- "ERD.png"; https://app.quickdatabasediagrams.com/. 2023

#### NOTE: The data used for wine region and wine color is "dummy" data.  This was gathered and randomly distributed throughout the original data to provide identifiers for the individual data points beyond the index, but do not have any real-life signifcance. The data in this project is gathered for training purposes only.   
