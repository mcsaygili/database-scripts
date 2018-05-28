/*
After changing any database object can cause some database objects to become "invalid". 
You can use these scripts for identifying invalid objects.
*/

  SELECT OWNER,
         OBJECT_TYPE,
         OBJECT_NAME,
         STATUS
    FROM DBA_OBJECTS
   WHERE STATUS = 'INVALID' AND OWNER = 'CGDSDB'
ORDER BY OWNER, OBJECT_TYPE, OBJECT_NAME;