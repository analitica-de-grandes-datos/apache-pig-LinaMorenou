/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD './data.csv' using PigStorage(',') AS (id:int, name:chararray, lastName:chararray, date:chararray, color:chararray, lvl:int);

select = FOREACH data GENERATE SUBSTRING(date, 0, 4) AS ano;

selectGroup = GROUP select BY ano;

result = FOREACH selectGroup GENERATE $0, COUNT($1);

STORE result INTO 'output/' using PigStorage(',');
