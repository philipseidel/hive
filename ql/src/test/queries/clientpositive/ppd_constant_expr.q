set hive.optimize.ppd=true;
CREATE TABLE ppd_constant_expr(c1 STRING, c2 INT, c3 DOUBLE) STORED AS TEXTFILE;

EXPLAIN
FROM src1 
INSERT OVERWRITE TABLE ppd_constant_expr SELECT 4 + NULL, src1.key - NULL, NULL + NULL;

FROM src1 
INSERT OVERWRITE TABLE ppd_constant_expr SELECT 4 + NULL, src1.key - NULL, NULL + NULL;

SELECT ppd_constant_expr.* FROM ppd_constant_expr;

DROP TABLE ppd_constant_expr;