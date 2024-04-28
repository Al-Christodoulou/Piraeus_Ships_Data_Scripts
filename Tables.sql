create table VesselTypes(
	code integer,
	description text,

	PRIMARY KEY(code)
);

create table Vessels(
	id text,
	type integer,
	flag text,

	PRIMARY KEY(id),
	CONSTRAINT fk_text FOREIGN KEY (type)
		REFERENCES public.VesselTypes (code) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
		NOT VALID
);

create table Positions(
	id text,
	vessel_id text,
	t timestamp,
	lon real,
	lat real,
	heading real,
	course real,
	speed real,
	
	PRIMARY KEY(id),
	CONSTRAINT fk_vessel_id FOREIGN KEY (vessel_id)
		REFERENCES public.Vessels (id) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
		NOT VALID
);

copy VesselTypes from 'C:/Users/VesselTypes.csv'
with csv header delimiter ',';
copy Vessels from 'C:/Users/Vessels.csv'
with csv header delimiter ',';
copy Positions from 'C:/Users/Positions.csv'
with csv header delimiter ',';