-- First observe crime scene report as per the information given
select * from crime_scene_report where type='murder' and city = 'SQL City';

-- Now check for the witness details after gathering information from the 1st query
select * from person where address_street_name = 'Northwestern Dr' order by address_number limit 1
select * from person where name like 'Annabel%' and address_street_name = 'Franklin Ave'
-- note down the person id from the above query

-- now lets check the interview details of those witnessess
select * from interview where person_id in ('person_id of 1st witness','person_id of 2nd witness')

-- lastly dig down to the data as per the information of the witnessess to find out murderer
select * from get_fit_now_check_in as gfn join get_fit_now_member as gfm
on gfn.membership_id = gfm.id
join person as p on p.id = gfm.person_id
join drivers_license as dl on p.license_id = dl.id
where gfn.membership_id like '48Z%' and membership_status='gold' and dl.plate_number like '%H42W%'
-- insert the murderer name as per instruction

-- still theres master mind behind this murderer, lets check the interview of that murderer and find master mind
select * from interview where person_id = 'person_id of murderer'

-- now as per the information given by the murderer lets find the master mind behind the murder
with cte as (select * from drivers_license where hair_color= 'red' and 
			 height between 65 and 67 and car_make = 'Tesla' and car_model='Model S')
select * from cte join person as p on cte.id = p.license_id
join facebook_event_checkin as fb on fb.person_id = p.id
-- insert the master mind name as per instruction