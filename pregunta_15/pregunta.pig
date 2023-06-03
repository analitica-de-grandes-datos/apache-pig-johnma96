/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color
   FROM 
       u 
   WHERE color = 'blue' AND firstname LIKE 'Z%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/
u = LOAD 'data.csv' USING PigStorage (',') AS (id:INT, 
firstname: CHARARRAY, 
surname: CHARARRAY,
birthday: CHARARRAY,
color: CHARARRAY,
quantity: INT);
filtered_data = FILTER u BY color == 'blue' AND SUBSTRING(firstname, 0, 1) == 'z';
result = FOREACH filtered_data GENERATE firstname, color;
STORE result INTO 'output' USING PigStorage('\t');