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

data = LOAD './data.csv' using PigStorage(',') AS (id:int, name:chararray, lastName:chararray, date:chararray, color:chararray, lvl:int);

select = FOREACH data GENERATE name, color;

selectFilter = FILTER select BY color == 'blue' AND STARTSWITH(name,'Z');

result = FOREACH selectFilter GENERATE CONCAT(name,' ',color);

STORE result INTO 'output' USING PigStorage(',');
