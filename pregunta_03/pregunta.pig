/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (letter:CHARARRAY, date:CHARARRAY, number:INT);
numbers = FOREACH data GENERATE number;
ordered_data = ORDER numbers BY number;
top_5 = LIMIT ordered_data 5;
STORE top_5 INTO 'output' USING PigStorage (',');