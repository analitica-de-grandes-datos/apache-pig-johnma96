/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.tsv' AS (letter:CHARARRAY, date:CHARARRAY, number:INT);
letters = FOREACH data GENERATE letter;
group_by = GROUP letters BY letter;
counter = FOREACH group_by GENERATE group, COUNT(letters);
STORE counter INTO 'output' USING PigStorage(',');




