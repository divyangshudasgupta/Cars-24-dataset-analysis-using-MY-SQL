Create database Cars24;
Use Cars24;



# Insight-1: Model wise count of the cars, to count which cars are the most listed . Showing top 5
Select name, count(name) as count_of_car
From cars24
Group by name #Getting a count of the model of the cars, grouping by name
Order by count_of_car DESC  #Ordering by the count in the descending order
Limit 5; #Seeing only the top 5

# Insight-2. Which type of fuel is mostly used by the listed cars
Select fuel, count(fuel) as count_fuel, concat(round(((count(fuel) / 8128) * 100 ),2), '%')  as percentage
From cars24 #Getting a count of the fuel type of the cars, and the percentage
Group by fuel #grouping by type
Order by count_fuel desc; #Ordering by the count in the descending order to get which is used the most above

# Insight-3 How many cars are of manual transmission type and how many are automatic?
Select transmission, count(transmission) as count, concat(round(((count(transmission) / 8128) * 100 ),2), '%')  as percentage
from cars24 #Getting a count of the transmission type of the cars,and the percentage (using round to get to 2 decimal places)
Group by transmission  #grouping by type
Order by count desc; #Ordering by the count in the descending order

# Insight-4. What is the average selling price of the cars.
# Also what is the highest and lowest price at which a car is sold
Select avg(selling_price) as average_selling_price, max(selling_price) as maximum_selling_price,
 min(selling_price) as minimum_selling_price
from cars24; #Using the avg, max and min function to find the average, maximum and minmum price

# Insight-5 How many total cars are there?
Select count(name)
from cars24; #using count to calculate the total number

# Insight 6 Average number of kilometers driven by the cars
Select avg(km_driven)
from cars24; # Using avg to calculate

# Insight-7. Which type of seller dominates the listings
Select seller_type, count(seller_type) as count, concat(round(((count(seller_type) / 8128) * 100 ),2), '%')  as percentage
from cars24 # Getting the seller type with their count and percentage of total( using round to round off the percentage to 2 decimal places)
Group by seller_type #grouping by type
Order by count  desc; #Ordering by the count

# Insight-8 Which seater type is most prevalent among the listed cars
Select seats, count(seats) as count, concat(round(((count(seats) / 8128) * 100 ),2), '%')  as percentage
from cars24 # Fetching seater type, count and percentage of total
Group by seats #grouping by type
Order by count desc # Ordering by the count

# Insight-9: Ownership pattern of the listed cars
Select owner, count(owner) as count, concat(round(((count(owner) / 8128) * 100 ),2), '%')  as percentage
from cars24 # Getting the number of previous owners, the count and the percentage of total
Group by owner #grouping by type
Order by count desc #Ordering by the count in descending order

#Insight-10 Is there a relationship between ownership and mileage?
Select owner, round(avg(mileage),2) as average, max(mileage) as maximum_mileage 
from cars24 #Fetching owner column, and the average of mileage as well as the maximum mileage
Group by owner #Using average and max function to find the average and max mileage, grouping by ownership
Order by average desc;  #Ordering by the average in descending order 

# Insight-11 Is there a relationship between ownership and price?
Select owner, avg(selling_price)as average_selling_price, max(selling_price) as maximum_selling_price ,
 min(selling_price) as minimium_selling_price 
from cars24 #Fetching owner column, average selling price, mimimum selling price, and maximum selling price
Group by owner #Using average and max function to find the average, min , and max mileage, grouping by ownership
Order by average_selling_price desc;  # Ordering by average selling price

# Insight-12 Ownership wise kilometer driven
Select owner, avg(km_driven)as average_km, max(km_driven) as maximum_km , min(km_driven) as minimium_km
from cars24 #Fetching owner column, average km driven, mimimum km driven, and maximum km driven
Group by owner #Using average and max function to find the average, min , and max km driven, grouping by ownership
Order by average_km desc; # Ordering by average km driven

# Insight-13 Fuel type wise selling price
Select fuel, avg(selling_price)as average_sp
from cars24 #Fetching fuel column, average selling price from cars24
Group by fuel #Grouping by fuel
Order by average_sp desc; # Ordering by average selling price

# Insight-14: Year wise average prices
Select year, avg(selling_price)as average_selling_price
from cars24 #Fetching year, average selling price from cars 24
Group by year  #Grouping by year
Order by average_selling_price desc; # Ordering by average selling price

# Decade wise average selling prices-
select CASE when year>=1980 and year<1990 then "1980-1989" WHEN year>=1990 and year<2000 then "1990-1999" 
WHEN year>=2000 and year<2010 then "2000-2009" WHEN year>=2010 and year<2020  then "2010-2019"
 when year>=2020 and year<2030 then "2020-2029"end as Year_range, avg(selling_price) as average_sp
from cars24 # clubbing the years into different ranges using case
Group by Year_range # grouping by year range
Order by average_sp desc; # Ordering by average selling price

#  Insight-15 Relationship between transmission and selling price
Select transmission, avg(selling_price)as average_selling_price, max(selling_price) as maximum_selling_price, min(selling_price) as minimum_selling_price
from cars24 #Fetching transmission, average selling price, maximum selling price, minimum selling price
Group by  transmission #Using average and max function to find the average, min , and max selling price, grouping by transmission
Order by average_selling_price desc; #Ordering by average selling price

#  Insight-17 Relationship between seats and selling price
Select seats, avg(selling_price)as average_selling_price
from cars24 #Fetching seats, average selling price from cars24
Group by  seats #grouping by seats
Order by average_selling_price desc; #Ordering by average selling price

# Insight-18 Relationship between mileage and transmission
Select transmission, round(avg(mileage),2)as average_mileage
from cars24 #Fetching transmission, average mileage from cars24
Group by transmission # #grouping by transmission
Order by average_mileage desc; #Ordering by average mileage

# Insight-19 Relationship between mileage and fuel type
Select fuel, round(avg(mileage),2)as average_mileage, max(mileage)
from cars24 #Fetching fuel, average mileage from cars24
Group by fuel  #grouping by transmission
Order by average_mileage desc; #Ordering by average mileage


# Insight 20 : Relationship between km driven and price
select CASE when km_driven<=1000  then "less than 1000 km" 
WHEN km_driven >1000 and km_driven <=100000 then "Between 1000 and 1L km" 
WHEN km_driven>100000 and km_driven<=1000000 then "Between 1L and 10L KM" 
WHEN km_driven>1000000 and km_driven<=2000000  then "Between 10L and 20L" when km_driven>=2000000 then "More than 20L KM"end as Km_driven_range, 
avg(selling_price) as average_selling_price
from cars24 # Clubbing the km_driven into different ranges using case, and selecting average selling price from cars 24
Group by Km_driven_range # grouping by km driven
Order by average_selling_price desc; # Ordering by average selling price

# Insight 21: Relationship between engine displacement and fuel type
Select fuel, round(avg(engine),2)as average_engine_disp, max(engine) as max_engine_disp,min(engine) as min_engine_disp
from cars24 #Selecting fuel column, average engine displacement, maximium engine displacement ,minimum engine displacement from cars24
Group by fuel #group by fuel
Order by average_engine_disp desc; # Ordering by average engine displacement

# Insight22 :Relationship between engine displacement and transmission
Select transmission, round(avg(engine),2)as average_engine_disp, max(engine) as max_engine_disp,min(engine) as min_engine_disp
from cars24  #Selecting transmission column, average engine displacement, maximium engine displacement ,minimum engine displacement from cars24
Group by transmission #grouping by transmission
Order by average_engine_disp desc;  #Ordering by average engine displacement


# Insight: Relationship between number of seats and engine displacement
Select seats, round(avg(engine),2)as average_engine_disp, max(engine) as max_engine_disp,min(engine) as min_engine_disp
from cars24
Group by seats #Using average and max function to find the average, min , and max mileage, grouping by ownership
Order by average_engine_disp desc;

# Insight 23: Relationship between max_power and fuel type
Select fuel, round(avg(max_power),2)as average_max_power
from cars24  #Selecting fuel column, average engine displacement from cars24
Group by fuel # grouping by fuel column
Order by average_max_power desc; #Ordering by average maximum power

# Insight 24 : Relationship between transmission and max_power
Select transmission, round(avg(max_power),2)as average_max_power
from cars24 #Selecting transmission column, average engine displacement from cars24
Group by transmission # grouping by transmission columns
Order by average_max_power desc; #Ordering by average maximum power

# Insight 25- Relationship between price, transmission, ownership and fuel
Select transmission,owner, fuel, avg(selling_price) as average_selling_price
from cars24 #Selecting transmission column,owner, fuel, average selling prices from cars24
group by transmission,owner, fuel # Grouping by fuel , transmission, owner
order by average_selling_price desc; #Ordering by average selling price

# Insight 26- Relationship between mileage, transmission, ownership and fuel
Select transmission,owner, fuel, round(avg(mileage),2) as average
from cars24 #Selecting transmission column,owner, fuel, average mileage from cars24
group by transmission,owner, fuel  # Grouping by fuel , transmission, owner
order by average desc;# Ordering by average mileage

# Insight 27-Top 5 cars with the highest mileage-
Select distinct(name),mileage
from cars24  #Selecting name column values without duplicates and ,mileage column from cars 24
order by mileage desc # Ordering by mileage in descending order
limit 5; #Limiting to only 5 values so as to see the top 5

# Insight 28- Top 5 cars with the least mileage-
Select distinct(name), mileage
from cars24 #Selecting name column values without duplicates and ,mileage column from cars 24
where mileage!=0 # Ignoring the 0 mileage values
order by mileage asc   # Ordering by mileage in ascending order
limit 5; #Limiting to only 5 values so as to see the top 5

# Insight 29 - Top 5 cars with the highest price
Select name,km_driven,transmission,owner,fuel,transmission, mileage, selling_price
from cars24 #Selecting name, km_driven,transmission,owner,fuel,transmission, mileage, selling_price  from cars 24
order by selling_price desc # Ordering by selling price in descending order
limit 5;  #Limiting to only 5 values so as to see the top 5


# Insight 30 - top 5 cars with the lowest selling price

Select name,km_driven,transmission,owner,fuel,transmission, mileage, selling_price
from cars24  #Selecting name, km_driven,transmission,owner,fuel,transmission, mileage, selling_price  from cars 24
order by selling_price asc  # Ordering by selling price in ascending order
limit 5; #Limiting to only 5 values so as to see the top 5

# Insight 31 - Top 5 Cars with the highest engine displacement
Select distinct(name), engine
from cars24 #Selecting name column values without duplicates and ,engine column from cars 24
order by engine desc # Ordering by engine column in descending order
limit 5; #Limiting to only 5 values so as to see the top 5

# Insight 32 - Top 5 Cars with the lowest engine displacement
Select distinct(name),engine
from cars24 #Selecting name column values without duplicates and ,engine column from cars 24
order by engine asc # Ordering by engine column in ascending order
limit 5; #Limiting to only 5 values so as to see the top 5


# Insight 33- Top 5 cars with the highest max output the car's engine.
Select distinct(name),max_power
from cars24 #Selecting name column values without duplicates and ,max_power column from cars 24
order by max_power desc # Ordering by max_power in descending order
limit 5; #Limiting to only 5 values so as to see the top 5



