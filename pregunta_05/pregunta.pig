/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.tsv' AS (letter:CHARARRAY, dicc:bag{}, mapa:map[]);
col =  FOREACH data GENERATE FLATTEN(dicc) AS (clave: CHARARRAY);
GRUPO = GROUP col BY clave;
res = FOREACH GRUPO GENERATE group, COUNT(col.clave);
STORE res INTO 'output' USING PigStorage (',');