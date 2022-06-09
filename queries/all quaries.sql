--first quary
select distinct description 
       from maintenance_issues_list m1, maintenance_issues m2 
         where m1.mid = m2.mid 
           and m2.mid not in (
                   select distinct m1.mid 
                         from maintenance_issues_list m1, maintenance_issues m2
                           where m1.mid = m2.mid
                             and m2.fixed = 0
                              );
--second quary
select distinct l.roomid, m1.description 
       from maintenance_issues_list m1, maintenance_issues m2, location l 
       where m1.mid = m2.mid
             and m2.locationid = l.locationid
             and l.buildingid = 1
             and l.floorid = 2
             and m2.fixed = 0
                 order by l.roomid;


--third quary
select workerid, itemid, count(saleid)
from sales
where itemid IN (select itemid
               from sales
               group by itemid
               order by count(saleid) desc
               FETCH FIRST 40 ROW only)
               
 group by workerid, itemid
 order by count(saleid) desc
 FETCH FIRST 40 ROW only;
 


--4th quary
select itemname, prise* (select count(saleid) 
                                from sales 
                                group by itemid 
                                order by count(saleid) 
                                desc fetch first 1 row only) as profit
  from gift_shop 
  where itemid = (
                 select itemid 
                 from sales 
                 group by itemid 
                 order by count(saleid) 
                 desc fetch first 1 row only);


--5th quary
select l.*, (select count(locationid)  
                    from maintenance_issues 
                    group by locationid 
                    order by count(locationid) desc 
                    fetch first 1 row only) as call_times 
       from location l 
       where locationid = (select locationid 
                                  from maintenance_issues 
                                  group by locationid 
                                  order by count(locationid) desc 
                                  fetch first 1 row only);

--6th quary
select saledate, count(saleid) as sales_number 
from sales 
group by saledate;


--7th quary
select itemname, amount 
from gift_shop 
where amount < 25;


--8th quary
select m.description, (select count(mid) 
                    from maintenance_issues 
                    group by mid 
                    order by count(mid) desc 
                    fetch first 1 row only) as calls_number
from maintenance_issues_list m 
where mid = (select mid 
                    from maintenance_issues 
                    group by mid 
                    order by count(mid) desc 
                    fetch first 1 row only);

