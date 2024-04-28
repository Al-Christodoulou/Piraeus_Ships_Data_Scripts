-- so that PostGres uses the partitions
set constraint_exclusion=on;

-- =====================================
--        VesselType partitions
-- =====================================
create table VesselTypes_0_19
(
	check(code >= 0 and code <= 19)
) inherits(VesselTypes);

create table VesselTypes_20_39
(
	check(code >= 20 and code <= 39)
) inherits(VesselTypes);

create table VesselTypes_40_59
(
	check(code >= 40 and code <= 59)
) inherits(VesselTypes);

create table VesselTypes_60_69
(
	check(code >= 60 and code <= 69)
) inherits(VesselTypes);

create table VesselTypes_70_89
(
	check(code >= 70 and code <= 89)
) inherits(VesselTypes);

create table VesselTypes_90_120
(
	check(code >= 90 and code <= 120)
) inherits(VesselTypes);

create or replace function VesselTypes_insert()
returns trigger as $$
begin
	if new.code >= 0 and new.code <= 19
	then insert into VesselTypes_0_19 values(new.*);

	elseif new.code > 20 and new.code <= 39
	then insert into VesselTypes_20_39 values(new.*);

	elseif new.code > 40 and new.code <= 59
	then insert into VesselTypes_40_59 values(new.*);

	elseif new.code > 60 and new.code <= 69
	then insert into VesselTypes_60_69 values(new.*);

	elseif new.code > 70 and new.code <= 89
	then insert into VesselTypes_70_89 values(new.*);

	elseif new.code > 90 and new.code <= 120
	then insert into VesselTypes_90_120 values(new.*);

	end if;
	return null;
end;
$$ language plpgsql;

create trigger VesselTypes_insert
	before insert on VesselTypes
	for each row execute function VesselTypes_insert();

delete from VesselTypes;
copy VesselTypes from 'C:/Users/VesselTypes.csv'
with csv header delimiter ',';

create index idx_vesseltypes_0_19_description on VesselTypes using btree(description);
create index idx_vesseltypes_20_39_description on VesselTypes using btree(description);
create index idx_vesseltypes_40_59_description on VesselTypes using btree(description);
create index idx_vesseltypes_60_69_description on VesselTypes using btree(description);
create index idx_vesseltypes_70_89_description on VesselTypes using btree(description);
create index idx_vesseltypes_90_120_description on VesselTypes using btree(description);

-- =====================================
--          Vessels partitions
-- =====================================
create table Vessels_0_19
(
	check(type >= 0 and type <= 19)
) inherits(Vessels);

create table Vessels_20_39
(
	check(type >= 20 and type <= 39)
) inherits(Vessels);

create table Vessels_40_59
(
	check(type >= 40 and type <= 59)
) inherits(Vessels);

create table Vessels_60_69
(
	check(type >= 60 and type <= 69)
) inherits(Vessels);

create table Vessels_70_89
(
	check(type >= 70 and type <= 89)
) inherits(Vessels);

create table Vessels_90_120
(
	check(type >= 90 and type <= 120)
) inherits(Vessels);

create or replace function Vessels_insert()
returns trigger as $$
begin
	if new.type >= 0 and new.type <= 19
	then insert into Vessels_0_19 values(new.*);

	elseif new.type > 20 and new.type <= 39
	then insert into Vessels_20_39 values(new.*);

	elseif new.type > 40 and new.type <= 59
	then insert into Vessels_40_59 values(new.*);

	elseif new.type > 60 and new.type <= 69
	then insert into Vessels_60_69 values(new.*);

	elseif new.type > 70 and new.type <= 89
	then insert into Vessels_70_89 values(new.*);

	elseif new.type > 90 and new.type <= 120
	then insert into Vessels_90_120 values(new.*);

	end if;
	return null;
end;
$$ language plpgsql;

create trigger Vessels_insert
	before insert on Vessels
	for each row execute function Vessels_insert();

delete from Vessels;
copy Vessels from 'C:/Users/Vessels.csv'
with csv header delimiter ',';

create index idx_Vessels_0_19_type on Vessels using btree(type);
create index idx_Vessels_20_39_type on Vessels using btree(type);
create index idx_Vessels_40_59_type on Vessels using btree(type);
create index idx_Vessels_60_69_type on Vessels using btree(type);
create index idx_Vessels_70_89_type on Vessels using btree(type);
create index idx_Vessels_90_120_type on Vessels using btree(type);

-- =====================================
--         Position partitions
-- =====================================

create table Positions_0_01
(
	check(speed >= 0 and speed <= 0.1)
) inherits(Positions);

create table Positions_01_05
(
	check(speed > 0.1 and speed <= 0.5)
) inherits(Positions);

create table Positions_05_5
(
	check(speed > 0.5 and speed <= 5)
) inherits(Positions);

create table Positions_5_10
(
	check(speed > 5 and speed <= 10)
) inherits(Positions);

create table Positions_10_30
(
	check(speed > 10 and speed <= 30)
) inherits(Positions);

create table Positions_30_110
(
	check(speed > 30 and speed <= 110)
) inherits(Positions);

create or replace function Positions_insert()
returns trigger as $$
begin
	if new.speed >= 0 and new.speed <= 0.1
	then insert into Positions_0_01 values(new.*);
	
	elseif new.speed > 0.1 and new.speed <= 0.5
	then insert into Positions_01_05 values(new.*);

	elseif new.speed > 0.5 and new.speed <= 5
	then insert into Positions_05_5 values(new.*);

	elseif new.speed > 5 and new.speed <= 10
	then insert into Positions_5_10 values(new.*);
	
	elseif new.speed > 10 and new.speed <= 30
	then insert into Positions_10_30 values(new.*);
	
	elseif new.speed > 30 and new.speed <= 110
	then insert into Positions_30_110 values(new.*);
	
	end if;
	return null;
end;
$$ language plpgsql;

create trigger Positions_insert
	before insert on Positions
	for each row execute function Positions_insert();

delete from Positions;
copy Positions from 'C:/Users/Positions.csv'
with csv header delimiter ',';

create index idx_positions_0_01_vessel_id on positions_0_01 using btree(vessel_id);
create index idx_positions_0_01_speed on positions_0_01 using btree(speed);
create index idx_positions_0_01_t on positions_0_01 using btree(t);
create index idx_positions_01_05_vessel_id on positions_01_05 using btree(vessel_id);
create index idx_positions_01_05_speed on positions_01_05 using btree(speed);
create index idx_positions_01_05_t on positions_01_05 using btree(t);
create index idx_positions_05_5_vessel_id on positions_05_5 using btree(vessel_id);
create index idx_positions_05_5_speed on positions_05_5 using btree(speed);
create index idx_positions_05_5_t on positions_05_5 using btree(t);
create index idx_positions_5_10_vessel_id on positions_5_10 using btree(vessel_id);
create index idx_positions_5_10_speed on positions_5_10 using btree(speed);
create index idx_positions_5_10_t on positions_5_10 using btree(t);
create index idx_positions_10_30_vessel_id on positions_10_30 using btree(vessel_id);
create index idx_positions_10_30_speed on positions_10_30 using btree(speed);
create index idx_positions_10_30_t on positions_10_30 using btree(t);
create index idx_positions_30_110_vessel_id on positions_30_110 using btree(vessel_id);
create index idx_positions_30_110_speed on positions_30_110 using btree(speed);
create index idx_positions_30_110_t on positions_0_01 using btree(t);