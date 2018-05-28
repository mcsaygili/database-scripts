/*
Updates and deletes on objects within a tablespace can create empty space that 
individually are not large enough to be reused for new data. This type of empty 
space is referred to as fragmented free space. You can use these scripts for 
calculate wasted space which can be reusable.
*/

  SELECT TABLE_NAME,
         ROUND((BLOCKS * 8),2) "SIZE (KB)",
         ROUND((NUM_ROWS * AVG_ROW_LEN / 1024), 2) "ACTUAL DATA (KB)",
         (ROUND((BLOCKS * 8),2) - ROUND((NUM_ROWS * AVG_ROW_LEN / 1024), 2)) "WASTED (KB)"
    FROM DBA_TABLES
   WHERE (ROUND((BLOCKS * 8),2) > ROUND((NUM_ROWS * AVG_ROW_LEN / 1024), 2))  
       AND OWNER LIKE 'MHRS'
ORDER BY 4 DESC;