--show full table

SELECT * FROM covid_deaths
ORDER BY 3,4;


--showing full table without continent in location

SELECT * FROM covid_deaths
WHERE continent IS NOT null
ORDER BY 3,4;


--What is the result of sorting the data from the 'covid_deaths' table by 
--location and then by date, while selecting the columns for location, 
--date, total cases, new cases, total deaths, and population?

SELECT location, date, total_cases, new_cases, total_deaths,
population FROM covid_deaths 
WHERE continent IS NOT null 
ORDER BY 1,2;



--What is the pecentage of death, looking at total_cases vs total_deaths

SELECT location, date, total_cases, total_deaths, 
(total_deaths::numeric/total_cases::numeric)*100 as death_pecentage
FROM covid_deaths
WHERE continent IS NOT null 
AND total_cases IS NOT null
AND total_deaths IS NOT null
ORDER BY 1,2;

--what is the pecentage of death in the United States?

SELECT location, date, total_cases, total_deaths, 
(total_deaths::numeric/total_cases::numeric)*100 as death_pecentage
FROM covid_deaths 
WHERE location = 'United States'
AND total_cases IS NOT null
AND total_deaths IS NOT null
ORDER BY 1,2;



--looking at Total Cases vs Population
--shows what pecentage population got covid in the United States

SELECT location, date, population, total_cases,  
(total_cases::numeric/population::numeric)*100 as case_pecentage
FROM covid_deaths 
WHERE location = 'United States' 
AND total_cases IS NOT null
AND total_deaths IS NOT null
ORDER BY 1,2;



--country with the highest infection rate compared to population


SELECT location, population, MAX(total_cases) aAS highestInfectedCount, 
MAX((total_cases::numeric / population::numeric)) * 100 AS 
pecentagePopulationInfected
FROM covid_deaths
WHERE continent IS NOT null
AND total_cases IS NOT null
GROUP BY location, population
ORDER BY pecentagePopulationInfected DESC;



--showing highest death count per population

SELECT location, MAX(total_deaths) AS highestdeathCount
FROM covid_deaths
WHERE continent IS NOT null 
AND total_deaths IS NOT null
GROUP BY location
ORDER BY highestdeathCount DESC;


-- showing death count by continent

SELECT continent, MAX(total_deaths) AS highestdeathCount
FROM covid_deaths
WHERE continent IS NOT null 
GROUP BY continent
ORDER BY highestdeathCount DESC;


--What are the total number of cases and deaths for each location?


SELECT location, SUM(total_cases) AS total_cases, SUM(total_deaths) AS total_deaths
FROM covid_deaths
WHERE total_cases IS NOT null
AND total_deaths IS NOT null
AND continent IS NOT null
GROUP BY location
ORDER BY 3 DESC;


--What is the average number of total deaths per million people for each continent?

SELECT continent, AVG(total_deaths_per_million) AS avg_deaths_per_million
FROM covid_deaths
WHERE continent IS NOT null
GROUP BY continent;


--How does the total number of cases change over time for the United States?

SELECT date, total_cases
FROM covid_deaths
WHERE location = 'United States'
AND total_cases IS NOT null
ORDER BY date;


--showing average number of deaths in the United States

SELECT location, AVG(total_deaths) AS average_deaths
FROM covid_deaths
WHERE location = 'United States'
GROUP BY location;


--showing covid_vaccination table

SELECT * FROM covid_vaccination;


--joinig covid_deaths table and covid_vaccination table

SELECT * FROM covid_deaths death
JOIN covid_vaccination vaccine
ON death.location = vaccine.location
AND death.date = vaccine.date;

--looking at Total Population vs New Vaccination

SELECT death.continent, death.location, death.date, death.population,
vaccine.new_vaccinations
FROM covid_deaths death JOIN covid_vaccination vaccine
ON death.location = vaccine.location
AND death.date = vaccine.date
WHERE death.continent IS NOT null
ORDER BY 2,3;


--looking at new vaccination cases in the United States with new cases

SELECT death.date, death.new_cases, vaccine.new_tests,
vaccine.new_vaccinations
FROM covid_deaths death JOIN covid_vaccination vaccine
ON death.location = vaccine.location
AND death.date = vaccine.date
WHERE death.location ='United States'
ORDER BY 1;


---creating a temporary table to calculate percentage of population vaccinated
--for each country


DROP TABLE IF EXISTS PercentPopulationVaccinated;
CREATE TEMP TABLE PercentPopulationVaccinated (
    continent TEXT,
    location TEXT,
    date DATE,
    population NUMERIC,
    new_vaccinations NUMERIC,
    peopleVaccinated NUMERIC);

INSERT INTO PercentPopulationVaccinated
SELECT 
    death.continent, 
    death.location, 
    death.date, 
    death.population,
    vaccine.new_vaccinations,
    SUM(vaccine.new_vaccinations) OVER (PARTITION BY death.location ORDER BY death.location, death.date) AS peopleVaccinated
FROM covid_deaths death 
JOIN covid_vaccination vaccine
ON death.location = vaccine.location
    AND death.date = vaccine.date;

SELECT *, 
    (peopleVaccinated / population) * 100 as percentPopulationVaccinated
FROM PercentPopulationVaccinated;
 
 
 ---creating a temporary table to calculate percentage of population vaccinated
--for the United states


DROP TABLE IF EXISTS PercentPopulationVaccinated;
CREATE TEMP TABLE PercentPopulationVaccinated (
    continent TEXT,
    location TEXT,
    date DATE,
    population NUMERIC,
    new_vaccinations NUMERIC,
    peopleVaccinated NUMERIC);

INSERT INTO PercentPopulationVaccinated
SELECT 
    death.continent, 
    death.location, 
    death.date, 
    death.population,
    vaccine.new_vaccinations,
    SUM(vaccine.new_vaccinations) OVER (PARTITION BY death.location ORDER BY death.location, death.date) AS peopleVaccinated
FROM covid_deaths death 
JOIN covid_vaccination vaccine
ON death.location = vaccine.location
    AND death.date = vaccine.date;

SELECT *, 
    (peopleVaccinated / population) * 100 as percentPopulationVaccinated
FROM PercentPopulationVaccinated
 WHERE location = 'United States';
