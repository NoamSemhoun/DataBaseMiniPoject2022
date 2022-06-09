-- select the saler of the most saled item in the gift_shop
select workerid, itemid, count(saleid) 
from sales 
where itemid = (select itemid 
               from sales 
               group by itemid 
               order by count(saleid) desc 
               FETCH FIRST 1 ROW only)
 group by workerid, itemid 
 order by count(saleid) desc 
 FETCH FIRST 1 ROW only;
