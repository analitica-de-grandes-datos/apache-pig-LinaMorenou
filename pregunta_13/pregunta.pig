/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta en SQL.

   SELECT
       color
   FROM 
       u 
   WHERE 
       color 
   LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
*/

data = LOAD './data.csv' using PigStorage(',') AS (id:int, name:chararray, lastName:chararray, data:chararray, color:chararray, lvl:int);

select = FOREACH data GENERATE color;

result =  FILTER select BY color matches '[b].*';

STORE result INTO 'output/' using PigStorage(',');
