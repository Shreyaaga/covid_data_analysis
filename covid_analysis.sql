-- select Location,date,total_cases,new_cases,total_deaths,population
-- from pp.coviddeaths 
-- where continent is not null
-- order by 1



-- -- --total cases vs total deaths


-- likelihood of dying in united states if u catch covid  
-- select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as death_percentage
-- from pp.coviddeaths where location like '%states%'
-- where continent is not null



-- total cases v/s population in india


-- select location,date,total_cases,Population,(total_cases/Population) as population_infected_percentage from
-- pp.coviddeaths where location= 'India'
-- and continent is not null



-- countries with highest infection rate


-- select Location,Population,MAX(total_cases) as highest_cases,MAX(total_cases/Population)*100 as percentage_population_infected 
-- from pp.coviddeaths
-- where continent is not null
-- group by Location,Population -- this will give all coutries once
-- order by percentage_population_infected desc



-- countries with highest death count per population

-- select Location,MAX(CAST(Total_deaths TO INT))as highest_death
-- from pp.coviddeaths
-- where continent is not null
-- group by Location -- this will give all coutries once
-- order by highest_death desc




-- BRINGING THINGS DOWN BY CONTINENT(total death per continent)

-- select continent ,sum(total_deaths) as total_death_count
-- from pp.coviddeaths
-- where continent is not null
-- group by continent
-- order by total_death_count desc



-- going global using dates
-- select date ,SUM(new_cases) as total_cases_per_date,SUM(new_deaths) as total_death_per_date-- each new case and new death on respective dates are added gloabally
-- from pp.coviddeaths
-- where continent is not null
-- group by date




-- total populatoin v/s vaccination


select coviddeaths.continent,coviddeaths.location,coviddeaths.date,covidvaccinations.new_vaccinations,SUM(covidvaccinations.new_vaccinations)
OVER (Partition by coviddeaths.location order by coviddeaths.location,coviddeaths.date) as uptodate_vaccination
from pp.covidvaccinations
join  pp.coviddeaths
on covidvaccinations.location=coviddeaths.location
and covidvaccinations.date=coviddeaths.date
where coviddeaths.continent is not null





