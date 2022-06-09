--second view - return the most maintenence nedded location
create view view2(building, floor, room) AS
select buildingid, floorid, roomid
from location 
where locationid = (select locationid
                           from maintenance_issues 
                           where fixed = 0
                           group by locationid 
                           order by count(locationid) desc 
                           FETCH first 1 ROW ONLY
                           );
