/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código en Pig para manipulación de fechas que genere la siguiente 
salida.

   1971-07-08,jul,07,7
   1974-05-23,may,05,5
   1973-04-22,abr,04,4
   1975-01-29,ene,01,1
   1974-07-03,jul,07,7
   1974-10-18,oct,10,10
   1970-10-05,oct,10,10
   1969-02-24,feb,02,2
   1974-10-17,oct,10,10
   1975-02-28,feb,02,2
   1969-12-07,dic,12,12
   1973-12-24,dic,12,12
   1970-08-27,ago,08,8
   1972-12-12,dic,12,12
   1970-07-01,jul,07,7
   1974-02-11,feb,02,2
   1973-04-01,abr,04,4
   1973-04-29,abr,04,4

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
formatted_dates = FOREACH u GENERATE birthday AS fecha, 
CASE ToString(ToDate(birthday, 'yyyy-MM-dd'), 'MM')
WHEN '01' THEN 'ene' WHEN '02' THEN 'feb' WHEN '03' THEN 'mar'
WHEN '04' THEN 'abr' WHEN '05' THEN 'may' WHEN '06' THEN 'jun'
WHEN '07' THEN 'jul' WHEN '08' THEN 'ago' WHEN '09' THEN 'sep'
WHEN '10' THEN 'oct' WHEN '11' THEN 'nov' WHEN '12' THEN 'dic'
ELSE 'unk' END
AS mes_letras,
ToString(ToDate(birthday, 'yyyy-MM-dd'), 'MM') AS mes_numeros,
REPLACE(ToString(ToDate(birthday, 'yyyy-MM-dd'), 'MM'), '^0', '') AS mes_numeros_sin_ceros;
STORE formatted_dates INTO 'output' USING PigStorage(',');