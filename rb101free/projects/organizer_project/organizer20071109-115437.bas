global #groc

run "groceries", #groc



print "My Organizer"

print

link #scratch, "Scratch one", scratch

render #groc

wait



sub scratch handle$

  #groc scratch()

end sub



[scratch]

  print "Caught you!"

  #groc scratch()

  wait