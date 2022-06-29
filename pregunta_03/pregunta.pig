/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
lines = LOAD 'data.tsv' AS (key:CHARARRAY,date:CHARARRAY,val:int);
ordered = ORDER lines BY val;
ordered_drop = FOREACH ordered GENERATE val;
ordered_lim = LIMIT ordered_drop 5;
STORE ordered_lim INTO 'output' USING PigStorage(',');
DUMP ordered_lim;
