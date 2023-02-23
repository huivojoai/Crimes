import pandas as pd

# path for schools financial data text file
pathX="Data\sdf96c1b.txt"




X = pd.read_csv(pathX, sep="\t", header=0)


# pathes for CSV files containing school information including addresses and zipcodes
pathY1="Data\SCHL95AI.csv"
pathY2="Data\SCHL95KN.csv"
pathY3="Data\SCHL95OW.csv"

Y1 = pd.read_csv(pathY1)
Y2 = pd.read_csv(pathY2)
Y3 = pd.read_csv(pathY3)

Y = Y1.append([Y2, Y3]).drop_duplicates()


# the school financial data is joined with school general information based on matching "LEAID"
x_y=pd.merge(Y,X ,left_on='leaid',right_on='LEAID')

# relevant columns containg school funding from federal, state, and local resources 
columns=['zip','TOTALREV','TFEDREV','TSTREV','TLOCREV']


# The school financials are summed by zipcodes and the ratios of federal, state, and local contributions are caclculated
df=x_y[columns].drop_duplicates()
df=df.groupby(['zip']).sum().reset_index()
df['federal_prec']=df['TFEDREV']/df['TOTALREV']*100
df['state_prec']=df['TSTREV']/df['TOTALREV']*100
df['local_prec']=df['TLOCREV']/df['TOTALREV']*100
columns=['zip','TOTALREV','federal_prec','state_prec','local_prec']
df=df[columns]

# data is written to a local file
df.to_csv("Data\schooldata.csv")



