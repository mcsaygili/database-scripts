/*
LOB (large object) is a group of Oracle database build-in data types. LOB data type can store unstructured data, 
such as text, graphic images, video clips and sound waveforms, in character or binary format.
 */

/* determine LOB segment size */
SELECT L.OWNER, L.TABLE_NAME, L.COLUMN_NAME, L.SEGMENT_NAME, S.BYTES / 1024 / 1024
FROM DBA_LOBS L,
     DBA_SEGMENTS S
WHERE L.SEGMENT_NAME = S.SEGMENT_NAME
  AND L.OWNER = S.OWNER
  AND L.OWNER = 'CGDSDB'
ORDER BY S.BYTES / 1024 / 1024 DESC;