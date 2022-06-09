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
                    fetch first 1 row only)
