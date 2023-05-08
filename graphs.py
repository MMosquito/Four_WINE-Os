import plotly.express as px
import pandas as pd

df = pd.read_csv("Wine_RegionColor.csv")

#histogram for quality column
hist = px.histogram(df, x='quality')

hist.write_html("histogram.html")



