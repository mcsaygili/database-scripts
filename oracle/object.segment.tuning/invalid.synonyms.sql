/*
After changing any database object can cause some database objects to become "invalid". You can use these scripts for identifying invalid objects.
*/

  SELECT DISTINCT OS.*
    FROM ALL_OBJECTS OS, ALL_SYNONYMS AS
   WHERE OS.OBJECT_TYPE = 'SYNONYM'
         AND OS.STATUS = 'INVALID'
         AND OS.OBJECT_NAME = AS.SYNONYM_NAME
         AND NOT EXISTS
                (SELECT UNIQUE (1)
                   FROM ALL_OBJECTS AO1
                  WHERE     AO1.OBJECT_NAME = AS.TABLE_NAME
                        AND AO1.OWNER = AS.TABLE_OWNER)
ORDER BY 2;
