/*
Calculation of backup sizes based on the type of backup.
*/

SELECT CTIME "Date",
         DECODE (BACKUP_TYPE,
                 'L', 'Archive Log',
                 'D', 'Full',
                 'Incremental')
            BACKUP_TYPE,
         BSIZE "Size MB"
    FROM (  SELECT TRUNC (BP.COMPLETION_TIME) CTIME,
                   BACKUP_TYPE,
                   ROUND (SUM (BP.BYTES / 1024 / 1024), 2) BSIZE
              FROM V$BACKUP_SET BS, V$BACKUP_PIECE BP
             WHERE     BS.SET_STAMP = BP.SET_STAMP
                   AND BS.SET_COUNT = BP.SET_COUNT
                   AND BP.STATUS = 'A'
          GROUP BY TRUNC (BP.COMPLETION_TIME), BACKUP_TYPE)
ORDER BY 1, 2;