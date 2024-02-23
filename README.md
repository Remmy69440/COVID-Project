# COVID Data Analysis with SQL

This portfolio contains SQL scripts and analysis based on COVID-19 data sourced from [Our World in Data](https://ourworldindata.org/covid-deaths).

## Table of Contents

- [Overview](#overview)
- [Data Source](#data-source)
- [Data Exploration](#data-exploration)
- [Visualization](#visualization)
- [SQL Queries](#sql-queries)
  - [Full Table Queries](#full-table-queries)
  - [Data Sorting and Filtering](#data-sorting-and-filtering)
  - [Comparative Analysis](#comparative-analysis)
  - [Vaccination Analysis](#vaccination-analysis)
- [Conclusion](#conclusion)

## Overview

This portfolio contains SQL scripts for analyzing COVID-19 data, including trends, comparisons, and vaccination progress.

## Data Source

The data used in these analyses is sourced from [Our World in Data](https://ourworldindata.org/covid-deaths).

## Data Exploration

Before delving into detailed analysis, it's essential to explore the dataset to understand its structure and contents. Here are some initial exploration steps that i performed:

- **Inspecting Data Structure**: Checked the columns, data types, and general structure of the `covid_deaths` and `covid_vaccinations` tables.
- **Data Quality Checks**: Identify missing values, outliers, or inconsistencies in the data that may need to be addressed before analysis.
- **Temporal Trends**: Plot temporal trends of key variables such as total cases, total deaths, and vaccination rates over time to observe patterns and changes.
- **Geographical Distribution**: Visualize the geographical distribution of COVID-19 cases and vaccination rates using maps or charts to identify hotspots or areas with high impact.

## Visualization

You can find a visualization created using Tableau in the [Tableau](https://public.tableau.com/app/profile/remigius.ufomba/viz/covidproject1_17085647978130/COVIDPROJECTDASHBOARD) directory. The visualization provides additional insights into the COVID-19 data and complements the SQL analysis in this portfolio.
![COVID PROJECT DASHBOARD](https://github.com/Remmy69440/COVID-Project/assets/159604919/fdbc2376-3734-4811-95dd-f33c46a5b791)


## SQL Queries

### Full Table Queries

- **Show Full Table**: Displays the entire `covid_deaths` table sorted by location and date.
- **Show Full Table Without Continent in Location**: Displays the entire `covid_deaths` table excluding rows where the location is a continent.
  
### Data Sorting and Filtering

- **Sorting Data by Location and Date**: Sorts the `covid_deaths` table by location and date, selecting specific columns for location, date, total cases, new cases, total deaths, and population.
- **Percentage of Death**: Calculates the percentage of death by dividing total deaths by total cases for each location.
- **Percentage of Death in the United States**: Calculates the percentage of death specifically for the United States.
- **Percentage of Population Infected in the United States**: Calculates the percentage of the population infected with COVID-19 in the United States based on total cases and population.
  
### Comparative Analysis

- **Country with the Highest Infection Rate Compared to Population**: Identifies the country with the highest infection rate compared to its population.
- **Country with the Highest Death Count per Population**: Identifies the country with the highest death count per population.
- **Death Count by Continent**: Displays the highest death count by continent.
- **Total Number of Cases and Deaths for Each Location**: Calculates the total number of cases and deaths for each location.
- **Average Number of Total Deaths per Million People for Each Continent**: Calculates the average number of total deaths per million people for each continent.
- **Total Number of Cases Over Time for the United States**: Shows how the total number of cases changes over time for the United States.
- **Average Number of Deaths in the United States**: Calculates the average number of deaths in the United States.

### Vaccination Analysis

- **Display covid_vaccination Table**: Displays the `covid_vaccination` table.
- **Joining covid_deaths Table and covid_vaccination Table**: Joins the `covid_deaths` table with the `covid_vaccination` table.
- **New Vaccination Cases in the United States with New Cases**: Shows new vaccination cases in the United States along with new COVID-19 cases.
- **Percentage of Population Vaccinated for Each Country**: Calculates the percentage of the population vaccinated for each country.
- **Percentage of Population Vaccinated for the United States**: Calculates the percentage of the population vaccinated specifically for the United States.


## Conclusion

In conclusion, this portfolio showcases various SQL queries and analyses performed on COVID-19 data from Our World in Data. Through these analyses, insights can be gained into the spread of the virus, vaccination progress, and comparative statistics across different countries and continents.
