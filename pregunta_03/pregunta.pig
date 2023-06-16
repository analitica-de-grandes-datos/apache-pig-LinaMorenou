/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD './data.tsv' AS (letter:chararray, date:chararray, amount:int);

sortedData = ORDER data BY amount;

select = limit sortedData 5;

result = FOREACH select GENERATE amount;

STORE result INTO 'output/' using PigStorage(',');
