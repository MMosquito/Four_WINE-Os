import plotly.express as px
import pandas as pd

df = pd.read_csv("Wine_RegionColor.csv")

#histogram for quality column
hist = px.histogram(df, x='quality', color_discrete_sequence=['#a31038'], labels={'quality':'Quality Rating', 'count':'Count'})

hist.update_layout(
    plot_bgcolor='#f7bfb0'
)

hist.write_html("docs/histogram.html")

hist.show()



