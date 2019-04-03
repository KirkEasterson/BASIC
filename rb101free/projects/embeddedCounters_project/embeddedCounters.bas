'This example is used with the embeddedCountersPage example.

'Open that project and run it.  This project runs embedded inside

'of it.



global count, embed, #embCounter

count = 1

call display

wait



sub display

  cls

  link #add, "++", [add]

  print " Count: "; count

  if hasEmbedded() then

    render #embCounter

  end if

end sub



[add]

  result = increment()

  wait



function increment()

  count = count + 1

  call display

  if hasEmbedded() then

    #embCounter increment()

  end if

end function



function embedCounter(n)

  embed = 1

  run "embeddedCounters", #embCounter

  n = n - 1

  if n > 0 then

    #embCounter embedCounter(n)

  end if

  call display

end function



function hasEmbedded()

  hasEmbedded = embed > 0

end function

