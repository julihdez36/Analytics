# Visualización de datos en Python

'''
Hay ciertas  consideración previas al ploteo:
    1. La naturaleza de los datos:
        a. Cross-sectional [corte transversal]:
            caracteristicas tomadas sobre una muestra
            en un momento específico del tiempo.
            IID: independientes e identicamente distribuidos 
        b. Time-series [series temporales]:
            registros sobre una unidad de análisis a través
            del tiempo.
            Están exhiben correlación serial. 
'''


import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

df = sns.load_dataset('penguins')
df.sample(5)

len(df)

stock = sns.load_dataset('dowjones')
stock.sample(5)

# Vamos a graficar!!!

### Graficos según naturaleza de los datos

stock.columns
# Series temporales

plt.plot(stock['Date'], stock['Price'])
plt.title('Dow-Jones Industrial Stock Price Index for US')
plt.grid(linestyle = '--')
plt.ylabel('$Price$')
plt.xlabel('$Date$')

'''
Una serie debe analizarse en sus componentes:
    1. Tendencia-Ciclo
    2. Estacionalidad
    3. Ruido

'''


# Cross-sectional
df.columns
plt.plot(df['bill_length_mm'])
plt.ylabel('bill_length_mm')
plt.show()


### Gráficos según variables

# Grafícos para v.cualitativas: barras o proporciones

df['island'].unique()
df['species'].value_counts()

pd.crosstab(df['species'],df['island'])

df['species'].value_counts().values
plt.bar(df['species'].unique(),
        df['species'].value_counts().values
)

sns.countplot(data = df, x = 'species')

pd.crosstab(df['species'],df['sex'])

sns.countplot(data = df, x = 'species', hue= 'island')


# Cuantitativo-continuos: boxplots, histogramas

df.columns

plt.hist(df['bill_length_mm'], bins = 'sturges')
plt.title('Histograma')

sns.histplot(data = df, x = 'bill_length_mm',
             hue = 'species')

