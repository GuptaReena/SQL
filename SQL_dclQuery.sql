
-- DCL QUERY
create user 'developer1 '@' localhost' identified by 'dev1';

GRANT select on demodb.person_details to developer1@localhost;

grant insert , update, delete on demodb.person_details to developer1@localhost; 

grant all on demodb to developer1@localhost;

revoke create, alter, drop on demodb from developer1@localhost;

-- priviledge list  create, insert,update, delete, index,alter, drop , grant,all, update
-- time to test the command 

