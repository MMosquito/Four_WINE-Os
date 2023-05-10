#!/usr/bin/env python
# coding: utf-8

# In[2]:


import pandas as pd
from pathlib import Path
import matplotlib.pyplot as plt
import plotly.graph_objects as go
from sklearn.linear_model import LinearRegression


# In[3]:


df = pd.read_csv("Wine_RegionColor.csv")
df.head()


# In[4]:


#cant pass "alcohol" column through linear regression function because it is "object" type
df.dtypes


# In[5]:


df.columns[0:10]


# In[6]:


#create function that calculates linear regression for all of the vairables
def linear_regression_calc():
    variables = df.columns[0:10]
    correlations = {}
    
    for var in variables:
        
        #define x and y
        X = df['quality']
        y = df[var]
        
        #reshape x 
        X_reshape = X.values.reshape(-1,1)
        y_reshape = y.values.reshape(-1,1)
        
        #fit model
        model = LinearRegression()
        model.fit(X_reshape, y_reshape)
        
        
        y_pred = model.predict(X_reshape)
        
        #plot
        plt.scatter(X_reshape, y_reshape)
        plt.plot(X_reshape, y_pred, color='red')
        plt.ylabel(var)
        plt.xlabel("Quality")
        plt.legend(model.coef_)
        plt.show()
        
        #append variable and correlation coef to "correlations" dict
        correlations[var] = model.coef_
        
    return correlations
linear_regression_calc()


# In[ ]:





# In[ ]:





# In[ ]:




