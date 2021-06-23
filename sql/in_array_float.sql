CREATE FUNCTION julia_in_array(x float[])
RETURNS integer AS $$
    1
$$ LANGUAGE pljulia;

CREATE FUNCTION julia_in_array_with_nulls(x float[])
RETURNS float AS $$
    y = [i for i in x if i!=nothing]
    return sum(y)
$$ LANGUAGE pljulia;

SELECT julia_in_array('{1.4,2.2,3}'::float[]);

SELECT julia_in_array('{1.4,NULL,3}'::float[]);

SELECT julia_in_array('{{1.4,NULL,3}, {2.3, 2.3, 4.5}}'::float[]);

SELECT julia_in_array('{{{1,2},{3,4},{5,6}},{{7,8},{9,10},{11,12}},{{13,14},{15,16},{17,18}}}'::float[]);

SELECT julia_in_array_with_nulls('{{{1,2},{3,4.86},{5,6}},{{7,8},{9,10},{11,12}},{{13,14},{15,16},{17,18}}}'::float[]);

SELECT julia_in_array_with_nulls('{{{NULL,2},{3,4.86},{5,6}},{{7,8},{9,10},{11,12}},{{13,14},{15,16},{17,NULL}}}'::float[]);

DROP FUNCTION julia_in_array(x float[]);

DROP FUNCTION julia_in_array_with_nulls(x float[]);
