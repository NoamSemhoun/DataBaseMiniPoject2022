-- name and salary of the goodest worker
select w.name,w.salaryperhour
from sales, mklemfne.worker w
where itemid IN (select itemid
               from sales
               group by itemid
               order by count(saleid) desc
               FETCH FIRST 1 ROW only)
               AND
               sales.workerid = w.workerid
               
 group by w.name,w.salaryperhour
 order by count(saleid) desc
 FETCH FIRST 1 ROW only;
 
