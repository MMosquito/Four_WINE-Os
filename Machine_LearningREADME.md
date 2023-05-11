# Machine_Learning Branch Read Me

## documentation of files within the 'Machine_Learning' Branch

### 

### Machine Learning Model

The type of model this dataset would require would perform categorical classification in order to try and predict the quality rating of the wine given the chemical properties. We created models of the following types in order to try and fit an accurate model to the data:

* Decision Tree
* Random Forest Classifier
* Extra Forest Classifier
* Support Vector Machine

These models saw limited success, with the highest accuracy score only reaching around 60%, and several of the models seeing dramatically worse performance.

!('RCF.png')

!('ECF.png')

!('SVM.png')

A neural network model using the cateogrical cross-entropy loss estimator is a work in progress, it has returned 51% accuracy but is still a work in progress.

!('neural_network_result.png')

Further work on improving these models will focus on eliminating features that are negatively impacting model performance and dialing in the model structure.
