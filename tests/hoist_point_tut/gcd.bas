05 REM find greatest common divisor (Euclidean Algorithm)
10 HOME : TEXT
20 LET A = 1071 : LET B = 462
30 IF A < B THEN C = A : A=B : B=C
40 PRINT A,B
50 LET C = A - INT(A/B)*B : REM C = A MOD B (A modulo B)
60 LET A = B : B = C
70 IF B > 0 THEN GOTO 40
80 PRINT "GCG is ";A
90 END