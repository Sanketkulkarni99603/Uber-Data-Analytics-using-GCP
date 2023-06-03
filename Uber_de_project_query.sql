CREATE OR REPLACE TABLE `uber-de-project-388705.uber_de_data.analytics_table` AS (
SELECT 
f_table.trip_id,
f_table.VendorID,
dt.tpep_pickup_datetime,
dt.tpep_dropoff_datetime,
pass.passenger_count,
trip.trip_distance,
rate.rate_code_name,
pick.pickup_latitude,
pick.pickup_longitude,
drop.dropoff_latitude,
drop.dropoff_longitude,
pay.payment_type_name,
f_table.fare_amount,
f_table.extra,
f_table.mta_tax,
f_table.tip_amount,
f_table.tolls_amount,
f_table.improvement_surcharge,
f_table.total_amount
FROM 

`uber-de-project-388705.uber_de_data.fact_table` f_table
JOIN `uber-de-project-388705.uber_de_data.datetime_dim` dt  ON f_table.datetime_id = dt.datetime_id
JOIN `uber-de-project-388705.uber_de_data.passenger_count_dim` pass  ON pass.passenger_count_id = f_table.passenger_count_id  
JOIN `uber-de-project-388705.uber_de_data.trip_distance_dim` trip  ON trip.trip_distance_id = f_table.trip_distance_id  
JOIN `uber-de-project-388705.uber_de_data.rate_code_dim` rate ON rate.rate_code_id = f_table.rate_code_id  
JOIN `uber-de-project-388705.uber_de_data.pickup_location_dim` pick ON pick.pickup_location_id = f_table.pickup_location_id
JOIN `uber-de-project-388705.uber_de_data.dropoff_location_dim` drop ON drop.dropoff_location_id = f_table.dropoff_location_id
JOIN `uber-de-project-388705.uber_de_data.payment_type_dim` pay ON pay.payment_type_id = f_table.payment_type_id)
;