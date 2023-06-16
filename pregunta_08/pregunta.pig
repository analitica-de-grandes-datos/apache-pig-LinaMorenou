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

data = LOAD 'data.tsv' USING PigStorage('\t') AS (col1:chararray, col2:BAG{dict:TUPLE(letter:chararray)}, col3:MAP[]);

selection = FOREACH data GENERATE col2, col3;

selectionResult = FOREACH selection GENERATE FLATTEN(col2),FLATTEN(col3);

groupResult = GROUP selectionResult BY ($0, $1);

result = FOREACH groupResult GENERATE group , COUNT($1);

STORE result INTO 'output/' using PigStorage(',') ;
