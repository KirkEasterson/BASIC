[show]
 cls
 link #up, "++", [up]
 print " ";
 link #down, "--", [down]
 print " ";
 textbox #value, a
 wait

[up]
 a = #value value()
 a = a + 1
 #value print(a)
 goto [show]

[down]
 a = #value value()
 a = a - 1
 #value print(a)
 goto [show]