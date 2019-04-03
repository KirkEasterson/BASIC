'This example is part of the organizer example.  Open the

'organizer project and run it to see how this example is

'embedded in the the organizer.



global counter

counter = 1

call display

wait



sub display

  cls

  print "Groceries"

  if counter > 1 then

    link #unscratch, "Unscratch one", [unscratch]

    print

  end if

  list$ = "Milk Eggs Bread Butter Salt"

  for x = counter to 5

    print x; ". "; word$(list$, x)

  next x

end sub



function scratch()

  counter = counter + 1

  call display

end function



[unscratch]

  counter = counter - 1

  call display

  wait