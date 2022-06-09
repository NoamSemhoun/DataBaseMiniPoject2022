--first view - return all the unfixed maintanence issues
create view view1(issue_location, issue_description) AS
select distinct m2.locationid, m1.description 
       from maintenance_issues_list m1, maintenance_issues m2
       where m1.mid = m2.mid
             and m2.fixed = 0
                 order by m2.locationid;
