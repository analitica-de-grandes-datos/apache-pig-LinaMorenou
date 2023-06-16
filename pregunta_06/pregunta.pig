/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD './data.tsv' AS (col1:chararray, col2:chararray, col3:map [] );

selection = FOREACH data GENERATE col3;

selectionValues = FOREACH selection GENERATE FLATTEN(col3);

groups = GROUP selectionValues BY $0;

result = FOREACH groups GENERATE group, COUNT($1);

STORE result INTO 'output/' using PigStorage(',');
