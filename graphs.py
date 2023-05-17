import plotly.express as px
import plotly.graph_objects as go
from plotly.subplots import make_subplots
import pandas as pd

df = pd.read_csv("Wine_RegionColor_Cleaned.csv")

#histogram for quality column
hist = px.histogram(df, x='quality', color_discrete_sequence=['#a31038'], labels={'quality':'Quality Rating', 'count':'Count'})

hist.update_layout(
    plot_bgcolor='#f7bfb0'
)

hist.write_image("images/fig1.png")

hist.show()

#box plot properties (https://stackoverflow.com/questions/62901783/how-to-plot-boxplots-of-multiple-columns-with-different-ranges)

vars = df.columns[1:12]
fig = make_subplots(rows=1, cols=len(vars))
for i, var in enumerate(vars):
    fig.add_trace(
        go.Box(y=df[var],
        name=var, marker_color = '#a31038'),
        row=1, col=i+1
    )
fig.update_layout(showlegend=False)
fig.update_xaxes(tickangle=45)

fig.write_image("images/fig.png")

fig.show()


#### ADD PNGS TO PRESENTATION BRANCH ####