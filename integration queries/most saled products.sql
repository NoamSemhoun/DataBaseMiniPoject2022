-- 40 products most saled and who saled them the most
select w.name, itemid, count(saleid)
from sales, mklemfne.worker w
where itemid IN (select itemid
               from sales
               group by itemid
               order by count(saleid) desc
               FETCH FIRST 40 ROW only)
               AND
               sales.workerid = w.workerid
               
 group by w.name, itemid
 order by count(saleid) desc
 FETCH FIRST 40 ROW only;
 
