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
data = LOAD './data.csv' using PigStorage(',') AS (id:int, firstName:chararray, lastName:chararray, birthDay:chararray, color:chararray, lvl:int);

result = FOREACH data GENERATE SUBSTRING(birthDay,0,4), SUBSTRING(birthDay,2,4);

STORE result INTO 'output/' using PigStorage(',') ;
