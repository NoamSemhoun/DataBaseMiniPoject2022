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
                 desc fetch first 1 row only)
