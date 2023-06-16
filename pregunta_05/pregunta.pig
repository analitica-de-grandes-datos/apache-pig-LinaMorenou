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
data = LOAD 'data.tsv' USING PigStorage('\t') AS (col1:chararray, col2:BAG{dict:TUPLE(letter:chararray)});

selection = FOREACH data GENERATE col2;

Letters = FOREACH selection GENERATE FLATTEN(col2) AS letter;

groupedLetters = GROUP Letters BY letter;

count = FOREACH groupedLetters GENERATE group, COUNT(Letters);

STORE count INTO 'output' USING PigStorage(',');
