-- third query - the most oldest workers in the musiun
select w.name, w.email 
from  mklemfne.worker w
where w.birthdate in (select w.birthdate 
                             from mklemfne.worker w 
                             order by w.birthdate desc
                             fetch first 40 row only )
       
