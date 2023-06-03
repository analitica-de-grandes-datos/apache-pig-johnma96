/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.tsv' AS (letter:CHARARRAY, dicc:bag{}, mapa:map[]);
result = FOREACH data GENERATE  FLATTEN(dicc) AS (claved:CHARARRAY),FLATTEN(mapa) AS (clavec:CHARARRAY);
GRUPO = GROUP result BY (claved,clavec);
res = FOREACH GRUPO GENERATE group, COUNT(result.claved);
STORE res INTO 'output' USING PigStorage (',');


