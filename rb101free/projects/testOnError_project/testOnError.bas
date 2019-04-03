global counter

on error goto [errorHandler]

print 4/0



[notAnErrorHandler]

  print "don't come here"



[errorHandler]

  print "you can't do that!"

  link #test, "This is a test", [test] : print

  link #dbz, "Divide by zero again", [goInsane] : print

  link #inFn, "Divide by zero in a function", [inFn] : print

  if counter = 2 then on error goto  'cancel the handler

  wait



[test]

  counter = counter + 1

  print counter

  print "We're working now!"

  wait



[goInsane]

  counter = counter + 1

  print counter

  a = 4/0



[inFn]

  print divideByZero()



function divideByZero()

  counter = counter + 1

  print counter

  print "I'm going to do the impossible!"

  print 4/0

end function