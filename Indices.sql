create index idx_vesseltypes_description on VesselTypes using btree(description);
create index idx_vessels_type on Vessels using btree(type);
create index idx_positions_vessel_id on positions using btree(vessel_id);
create index idx_positions_speed on positions using btree(speed);
create index idx_positions_t on positions using btree(t);