  'httpget example - this short program can fetch and display the contents

  'of html pages and also jpg files.

  on error goto [handler]

[repeat]

  cls

  print "Type a URL to fetch."

  input a$

  link #repeat, "Fetch another document", [repeat] : print

  result$ = httpget$(a$)

  if right$(upper$(a$), 4) = ".JPG" then

    open "public\"+shortPath$(a$) for binary as #JPG

    print #JPG, result$;

    close #JPG

    html "<img src=""/"+shortPath$(a$)+""">"

  else 

    print result$

  end if

  wait



[handler]

  print Err$

  print Err

  wait  



function shortPath$(path$)

  shortPath$ = path$

  while instr(shortPath$, "/")

    shortPath$ = mid$(shortPath$, 2)

  wend

end function