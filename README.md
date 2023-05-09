# Four_WINE-Os

## WHY:  Quality of Portugal Wines!  

How does one determine the best quality of wine?  Is it about taste? Color? What region is it from?  How about chemical properties?  

The Four-WINE-Os are here to help wine enthusiasts gather more information on Portugal wines through the exploration of over 2000 types of wine from over 13 different regions.  We will show the quality rating score of 3 to 9 (9 being the highest) of Portugal wines based on several different factors to include sugar, sulphate, pH, sulfur dioxide, citric acid, and more. 

Let’s help you discover what is determined the best quality of Portugal wine based on chemical properties! 

## QUESTIONS
  * Which of these variables, if any, have the largest correlation between their value and the quality of the wine?
  * Can machine learning be used to predict the qualty of a wine based upon an analysis of it's various chemical properties?


## DATA DESCRIPTION

The data is made up of both chemical and sensory data for 2037 unique wines, all hailing from a single wine-producing area of Portugal. The chemical properties of each wine that have been collected contain several impactful pieces of information about each individual wine, from the acidity, to the residual sugar left beind after fermentation, to the level of sulphates present. All told 11 pieces of numerical chemical data were collected for every wine featured in the dataset, with all the values existing as continuous variables. They are as follows:

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

The final piece of data present in the dataset is not chemical data, and in fact is not even objective data. It is a ranking of quality gathered by individuals from sensory data taken from tasting the wines. This quality ranking falls on a scale of 1 to 10, with 1 being the highest and 10 being the lowest, although in practice there were only results falling between 3 and 9, with no wines having a final ranking of 1, 2 or 10. Further adding to the concentration of values in the middle of the data range is a pronounced lack of values that fall on the edges of the present quality values, with only 7 wines being scored either 3 or 9. All told, of the 2037 wines sampled, 1924 of them were given of final quality ranking of either 5, 6 or 7. This concentration of data in the middle of the possible values is reflected in the summary statistics of the entire dataset, which finds the inner-quartile range of the quality values to exist entirely between the scores of 5 and 6.

The chemical data all fall on varying scales, with some chemical values numbering in the thousands, while others are distinguished by hunderdths of a decimal. The chemical values all seem to represent an acceptable spread of values, with the exception of the density, which returns a maximum value of over 100 despite a mean of barely over 1, so that value will be treated as either an error or an extreme outlier and will be removed from the dataset.

The data is mostly clean already and saw few complication when preparing it for loading into an SQL database, with the lone excpetion of the alcohol column. Some columns, 12 to be exact, had values in this column that saw decimal values extendin to 9 or 12 places, with each set of 3 being separated by an additional decimal point. Because that is not a valid number the entire column is formatted as a string, and when loading the data into an SQL database it returns an error as those values are not valid for the float datatype that is expected. The solution for this was to iterate through the dataset and locate any values in the alcohol column that contianed more than 1 decimal point, and as that only affected 12 of the over 2000 data points, we elected to remove these data for the sake of simplicity. That was accomplished with the following lines of code: 

```
check_decimals = lambda x: str(x).count('.') <= 1

remove_extra_decimals = wine_df['alcohol'].apply(check_decimals)

wine_df = wine_df[remove_extra_decimals]
```

Upon removing the offending data and reclassifying the column as float values, the data loaded correctly into our database and also was able to be scaled and prepared for machine learning.

![image](https://user-images.githubusercontent.com/14171474/236974667-99a8d14e-c829-4659-a1d9-a2ee48ecb3ce.png)

## TECHNOLOGIES - LANGUAGES - TOOLS - ALGORITHMS
Confusion Matrix, Decision Tree Classifier, Github Pages, Jupyter Notebook, Linear Regression, Matplotlib, Microsoft Powerpoint, Numby, Pandas, PostgreSQL, Random Forest Classifier, Scatter Plots, SKLearn, Standard Scaler, Tableau, Visual Studio Code

** Note: The data used for wine region and wine color is "dummy" data.  This was gathered and randomly distributed throughout the original data to provide identifiers for the individual data points beyond the index, but do not have any real-life signifcance.

REGION MAP:


![WineMapofPortugal](https://user-images.githubusercontent.com/14171474/234731441-6d4f7538-121a-4f90-848f-42fa3d7b3226.png)


## "Graphs" branch
* graphed the number of wines for each quality rating
* did a groupby on the quality column and searched for vairables that had a noticable coorelation to quality


CITATIONS: 
- "Portugal Wine Data"; Marilia Prata; https://www.kaggle.com/datasets/mpwolke/cusersmarildownloadswinecsv?resource=download. 2021
- "The WInes of Portugal (Organized by Region)"; Madeline Puckette; https://winefolly.com/deep-dive/what-wines-to-drink-from-portugal-by-region/winefully.com. 2023
- "ERD.png"; https://app.quickdatabasediagrams.com/. 2023

#### Disclaimer the data in this project is gathered for training purposes only.   
