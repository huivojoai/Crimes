import pandas as pd
import re
import csv
path_crime = "Data\crimedata.csv"
path_zipcode ="Data\zip_code_database.csv"
df_crime=pd.read_csv(path_crime)
df_zipcode=pd.read_csv(path_zipcode)

"function to remove ending of community name"
def remove_ending(city):
    for ending in ['town','township','village','division','borough','city']:
        if city.endswith(ending):
            city=city[:-len(ending)]
    city=city.lower()
    city=city.replace(" ",'')
    return city

"function to remove space and change to lower string to lower case"
def remove_space_upper(city):
    city=str(city)
    city=city.lower()
    return city.replace(" ","")


#aplly functions to clean city names in both datasets
df_crime['communityName']=df_crime['communityName'].apply(remove_ending)
df_zipcode['primary_city']=df_zipcode['primary_city'].apply(remove_space_upper)

## join the two datasets based on matching both the city and the state
df_combined=pd.merge(df_crime,df_zipcode,how='left',left_on=['communityName','state'],right_on=['primary_city','state'])
df_combined.dropna(subset=['zip'])

## make sure the zip code is in a format of a string with 5 digits
df_zip=df_combined['zip'].apply(lambda x: str(x)).apply(lambda x: x.split('.',1)[0]).apply('{:0>5}'.format)
df_combined['zip']=df_zip.astype("str")

## write the file to a local CSV
path ="Data\crime_and_zip_cleaned.csv'
df_combined.to_csv(path, index = False)
