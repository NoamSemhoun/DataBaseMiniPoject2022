select distinct l.roomid, m1.description 
       from maintenance_issues_list m1, maintenance_issues m2, location l 
       where m1.mid = m2.mid
             and m2.locationid = l.locationid
             and l.buildingid = 1
             and l.floorid = 2
             and m2.fixed = 0      
                 order by l.roomid;
