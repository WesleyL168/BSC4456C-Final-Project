print("Hello world")
import pandas as pd
import matplotlib.pyplot as plt
plastics = pd.read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-01-26/plastics.csv')
plastics.head()

plastics_2020 = plastics.query('year == 2020')

plastics_2020_T1 = plastics_2020.drop(columns=["num_events","volunteers","parent_company","year"])
plastics_2020_T1 = plastics_2020_T1.groupby(["country"]).describe()
plastics_2020_T1.head()

plastics_2020_total = plastics_2020.filter(items = ["country","grand_total"])
plastics_2020_total = plastics_2020_total.groupby(["country"]).sum()
plastics_2020_total.plot.bar()
plt.show()

