import pandas as pd
from wordcloud import WordCloud, STOPWORDS, ImageColorGenerator
import matplotlib.pyplot as plt
% matplotlib inline
import plotly.plotly as py
import cufflinks as cf

from plotly.offline import iplot
cf.go_offline()

from sklearn.feature_extraction.text import CountVectorizer

df = pd.read_csv("../input/sh_msg.txt",sep='|',index_col=0, parse_dates=True,
                 header=None,names=['timestamp','process','func_level','log_entry'])
def plot_world_cloud (text):
    # Create stopword list:
    #stopwords = set(STOPWORDS)

    # Create and generate a word cloud image:
    #wordcloud = WordCloud(width=500, height=350, stopwords=stopwords, max_words=100, background_color="white").generate(text)
    wordcloud = WordCloud(width=600, height=350, max_words=100, background_color="white").generate(text)

    # Display the generated image:
    plt.imshow(wordcloud, interpolation='bilinear')
    plt.axis("off")
    plt.show()

# get all log entries
text = " ".join(entry for entry in df.log_entry)
plot_world_cloud(text)

