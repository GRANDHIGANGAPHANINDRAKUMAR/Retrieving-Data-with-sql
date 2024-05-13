use Portfolio_project

--Shows Entire Covid Data

select * from covid_data_sqlproject

--Select Data that we are going to analyse

select cd.Location,cd.Population,
cd.Confirmed,cd.Deaths,cd.Active,cd.Region from covid_data_sqlproject cd

--Shows total_cases vs Deaths for each location 

select cd.Location,cd.Confirmed,cd.Deaths from covid_data_sqlproject cd


--Shows total_cases vs Active_cases for each location 

select cd.Location,cd.Confirmed,cd.Active from covid_data_sqlproject cd


--Shows total_cases vs Recovery_cases for each location 

select cd.Location,cd.Confirmed,cd.Recovered from covid_data_sqlproject cd


--Shows How much percentage of dyiningRate by population for each country

select Location,Confirmed,Deaths,population,
Case
	when Population!=0 then(cast(Deaths as decimal(18,2))/nullif(cast(Population as decimal(18,2)),0))*100 
	else
		NUll
End as Percentage_of_deaths from covid_data_sqlproject order by Percentage_of_deaths


--Shows How much percentage of Active_cases by population for each country

select Location,Confirmed,Active,population,
Case
	when Population!=0 then(cast(Active as decimal(18,2))/nullif(cast(Population as decimal(18,2)),0))*100 
	else
		NUll
End as Percentage_of_ActiveCases from covid_data_sqlproject order by Percentage_of_ActiveCases desc


--Shows How much percentage of Recovery_cases by population for each country

select Location,Confirmed,Recovered,population,
Case
	when Population!=0 then(cast(Recovered as decimal(18,2))/nullif(cast(Population as decimal(18,2)),0))*100 
	else
		NUll
End as Percentage_of_RecoveryCases from covid_data_sqlproject order by Percentage_of_RecoveryCases desc

--shows highest_cases of covid for each country

select Location,Confirmed
from covid_data_sqlproject order by cast(confirmed as int) desc

--shows highest deaths_count for each country 

select Location ,
Deaths from covid_data_sqlproject 
order by cast(deaths as int) desc

--shows country wise recoverd cases and which country has highest recoverd cases

select Location ,Recovered from covid_data_sqlproject order by cast(Recovered as int) desc

--shows what percentage of population got covid by each country

select Location,population,Confirmed,
case
	when confirmed!=0 and population!=0 then
	(cast(confirmed as decimal(18,2))/nullif(cast(population as decimal(18,2)),0))*100
	else
		null
	end as Percentage_of_got_covid 
from covid_data_sqlproject

-- looking at the countries with highest covid infection count compared to the population

select location,population,max(cast(confirmed as int)) 
as Highest_infectioncount from covid_data_sqlproject 
group by population,location order by 
Highest_infectioncount desc

--shows highest_infection count by region wise

select Region,max(cast(confirmed as int))
as Highest_infectioncount from covid_data_sqlproject 
group by Region order by Highest_infectioncount desc

--shows highest recovery count by each region

select Region,max(cast(Recovered as int))
as Highest_RecoveryCount from covid_data_sqlproject 
group by Region order by Highest_RecoveryCount desc

--show highest deaths  count by each region

select Region,max(cast(deaths as int))
as Highest_deathsCount from covid_data_sqlproject 
group by Region order by Highest_deathsCount desc

--shows highest infectionRate by each region compared to population 

select distinct Region ,
sum(cast(population as int)) as total_population ,
sum(cast(confirmed as int)) 
as total_cases,
(sum(cast(confirmed as bigint))/cast(sum(cast(population as bigint)) as decimal(20,2)))*100 
as total_infectionRate
from covid_data_sqlproject group by region order by total_infectionRate desc


--shows highest RecoveryRate by each region compared to population 

select distinct Region ,
sum(cast(population as int)) as total_population ,
sum(cast(Recovered as int)) 
as total_RecoveryCases,
(sum(cast(Recovered as bigint))/cast(sum(cast(population as bigint)) as decimal(20,2)))*100 
as total_RecoveryRate
from covid_data_sqlproject group by region order by total_RecoveryRate desc



--shows highest DyiningRate by each region compared to population 

select distinct Region ,
sum(cast(population as int)) as total_population ,
sum(cast(Deaths as int)) 
as total_DyiningCases,
(sum(cast(Deaths as bigint))/cast(sum(cast(population as bigint)) as decimal(20,2)))*100 
as total_DyiningRate
from covid_data_sqlproject group by region order by total_DyiningRate desc


--shows highest ActiveCasesRate by each region compared to population 

select distinct Region ,
sum(cast(population as int)) as total_population ,
sum(cast(Active as int)) 
as total_ActiveCases,
(sum(cast(Active as bigint))/cast(sum(cast(population as bigint)) as decimal(20,2)))*100 
as total_ActiveRate
from covid_data_sqlproject group by region order by total_ActiveRate desc


select * from covid_data_sqlproject
