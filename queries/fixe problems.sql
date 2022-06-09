select distinct description 
       from maintenance_issues_list m1, maintenance_issues m2 
            where m1.mid = m2.mid 
                  and m2.mid not in (
                                        select distinct m1.mid 
                                            from maintenance_issues_list m1, maintenance_issues m2
                                                 where m1.mid = m2.mid
                                                       and m2.fixed = 0
                                    );
