  open "prefs.xml" for input as #x

  s$ = input$(#x, lof(#x))

  close #x

  xmlparser #doc, s$

  print #doc key$()

  call displayElements #doc, ""

  end



sub displayElements #xmlDoc, indent$

  indent$ = indent$ + "    "

  count = #xmlDoc elementCount()

  for x = 1 to count

    #elem = #xmlDoc #element(x)

    print indent$; "Key: "; #elem key$();

    value$ = #elem value$()

    if value$ <> "" then

      print " Value: "; value$;

    end if

    print

    call displayElements #elem, indent$

  next x

end sub