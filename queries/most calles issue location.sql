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
                                  fetch first 1 row only)
