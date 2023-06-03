/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.tsv' AS (letter:CHARARRAY, dicc:bag{}, mapa:map[]);
raw = FOREACH data GENERATE letter, SIZE(dicc) AS count_col2, SIZE(mapa) AS count_col3;
ordered_data = ORDER raw BY letter,count_col2, count_col3;
STORE ordered_data INTO 'output' USING PigStorage (',');