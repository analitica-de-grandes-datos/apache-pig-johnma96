/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       birthday, 
       DATE_FORMAT(birthday, "yyyy"),
       DATE_FORMAT(birthday, "yy"),
   FROM 
       persons
   LIMIT
       5;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
u = LOAD 'data.csv' USING PigStorage (',') AS (id:INT, 
firstname: CHARARRAY, 
surname: CHARARRAY,
birthday: CHARARRAY,
color: CHARARRAY,
quantity: INT);
years = FOREACH u GENERATE SUBSTRING(birthday,0,4) AS year, SUBSTRING(birthday,2,4) AS year2;
STORE years INTO 'output' USING PigStorage (',');