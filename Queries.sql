-- Find the number of spots (lon, lat) per calendar day and
-- sort the result in descending order (by number of spots).
select t::Date, count(t::Date) as num_of_spots
from Positions
group by t::Date
order by num_of_spots desc;

-- Find how many Greek-flagged ships per ship type are registered in the database.
select VesselTypes.description, count(Vessels.type) as num_of_vessels
from Vessels join VesselTypes on Vessels.type=VesselTypes.code
where flag='Greece' and type is not null
group by VesselTypes.description;

-- Find out which ships at some point developed a speed of more than 30 knots
select Positions.vessel_id, VesselTypes.description
from (Positions join Vessels on Positions.vessel_id=Vessels.id)
	join VesselTypes on Vessels.type=VesselTypes.code
where speed > 30
group by vessel_id, description;

-- Find out which ships at some point developed a speed of over 30 knots, what
-- was their type, and how many of those ships existed, by type
select description, count(description) as num_of_vessels
from (Positions join Vessels on Positions.vessel_id=Vessels.id)
	join VesselTypes on Vessels.type=VesselTypes.code
where speed > 30
group by description;

-- Specifically for passenger ships ("passenger..." types), how many spots were
-- recorded per day in the period 2019/08/14 - 2019/08/18?
select t::Date, count(t::Date) as num_of_spots
from (Positions join Vessels on Positions.vessel_id=Vessels.id)
	join VesselTypes on Vessels.type=VesselTypes.code
where VesselTypes.description like 'Passenger%'
	and t::Date >= '2019-08-14'::Date and t::Date <= '2019-08-18'::Date
group by t::date;

-- Which cargo ships were 'anchored' (zero speed) at some point during the
-- period 2019/08/15 - 2019/08/18
select Positions.vessel_id, VesselTypes.description
from (Positions join Vessels on Positions.vessel_id=Vessels.id)
	join VesselTypes on Vessels.type=VesselTypes.code
where VesselTypes.description like 'Cargo%'
	and t::Date >= '2019-08-15'::Date and t::Date <= '2019-08-18'::Date
	and Positions.speed=0
group by Positions.vessel_id, VesselTypes.description;

-- Which cargo ships were 'anchored' for the entire period 2019/08/12 - 2019/08/19?
select Positions.vessel_id, VesselTypes.description, sum(speed) as total_travelled_dist
from (Positions join Vessels on Positions.vessel_id=Vessels.id)
	join VesselTypes on Vessels.type=VesselTypes.code
where VesselTypes.description like 'Cargo%'
	and t::Date >= '2019-08-12'::Date and t::Date <= '2019-08-19'::Date
group by Positions.vessel_id, VesselTypes.description
having sum(speed)=0;