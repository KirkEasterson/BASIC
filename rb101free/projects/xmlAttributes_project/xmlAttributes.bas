a$ = "<program name=""myprog"" author=""Carl Gundel""/>"

xmlparser #parser, a$

print #parser key$()

for x = 1 to #parser attribCount()

key$ = #parser attribKey$(x)

print key$; ", ";

print #parser attribValue$(x)

next x