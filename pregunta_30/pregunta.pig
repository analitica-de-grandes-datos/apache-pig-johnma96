/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el codigo en Pig para manipulación de fechas que genere la siguiente
salida.

   1971-07-08,08,8,jue,jueves
   1974-05-23,23,23,jue,jueves
   1973-04-22,22,22,dom,domingo
   1975-01-29,29,29,mie,miercoles
   1974-07-03,03,3,mie,miercoles
   1974-10-18,18,18,vie,viernes
   1970-10-05,05,5,lun,lunes
   1969-02-24,24,24,lun,lunes
   1974-10-17,17,17,jue,jueves
   1975-02-28,28,28,vie,viernes
   1969-12-07,07,7,dom,domingo
   1973-12-24,24,24,lun,lunes
   1970-08-27,27,27,jue,jueves
   1972-12-12,12,12,mar,martes
   1970-07-01,01,1,mie,miercoles
   1974-02-11,11,11,lun,lunes
   1973-04-01,01,1,dom,domingo
   1973-04-29,29,29,dom,domingo

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
SUBSTRING(birthday,8,10) AS dia_semana_numero_cer,
GetDay(ToDate(birthday, 'yyyy-MM-dd')) AS dia_semana_numero,
Case ToString(ToDate(birthday,'yyyy-MM-dd'), 'EEE')
When 'Sun' THEN 'dom' When 'Mon' THEN 'lun' When 'Tue' THEN 'mar'
When 'Wed' THEN 'mie' When 'Thu' THEN 'jue' When 'Fri' THEN 'vie'
When 'Sat' THEN 'sab' End AS dia_semana_abreviatura,
Case ToString(ToDate(birthday,'yyyy-MM-dd'), 'EEE')
When 'Sun' THEN 'domingo' When 'Mon' THEN 'lunes' When 'Tue' THEN 'martes'
When 'Wed' THEN 'miercoles' When 'Thu' THEN 'jueves' When 'Fri' THEN 'viernes'
When 'Sat' THEN 'sábado' End AS dia_semana_completo;

STORE formatted_dates INTO 'output' USING PigStorage(',');
