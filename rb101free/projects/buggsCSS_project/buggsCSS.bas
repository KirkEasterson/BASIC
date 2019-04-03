global #buggs

call setCSS

gosub [displayAll]

wait



[displayAll]

  cls

  gosub [displayBanner]

  gosub [displayLinks]

  gosub [displayEntries]

  wait



[displayBanner]

  print "Buggs, a issue management web application"

  print

  return



[displayLinks]

  print "Links will go here"

  link #newEntry, "New Entry", [newEntry]

  print " ";

  link #refresh, "Refresh", [displayAll]

  print

  return



[displayEntries]

  print "Entries"

  call connect

  #buggs execute("select ID,USERNAME,DESCRIPTION,EMAIL from entries")

  #buggs cssclass("result")

  #buggs trclass("result")

  #buggs link("ID", "viewEntry")

  render #buggs

  call disconnect

  return



sub viewEntry itemName$

  print itemName$; " clicked"

end sub



[newEntry]

  cls

  gosub [displayBanner]

  div newEntry

    div title : print "New Entry": end div

    html "<table>"

    html "<tr><td>User name:</td><td>" : textbox #username, "" : html "</td></tr>"

    html "<tr><td>Email address:</td><td>" : textbox #email, "" : html "</td></tr>"

    html "<tr><td>Description:</td><td>" : textbox #desc, "" : html "</td></tr></table>"

    print "Content:" : textarea #content, "" : print

    link #accept, "Accept", [acceptEntry]

    print " "; 

    link #cancel, "Cancel", [cancelEntry]

  end div

  wait



[acceptEntry]

  val$ = str$(nextID())+","

  val$ = val$ + "'" + #username contents$() + "',"

  val$ = val$ + "'" + #desc contents$() + "',"

  val$ = val$ + "'" + #content contents$() + "',"

  val$ = val$ + "38896"+ ","

  val$ = val$ + "0"+ ","

  val$ = val$ + "'" + #email contents$() + "'"

  execute$ = "insert into entries (ID, USERNAME, DESCRIPTION, CONTENT, DATE, PARENTID, EMAIL) values ("+val$+")"

  call execute execute$

  goto [displayAll]



[cancelEntry]

  goto [displayAll]



sub connect

  sqliteconnect #buggs, "buggs.db"

end sub



sub disconnect

  #buggs disconnect()

end sub



function nextID()

  call connect

  #buggs execute("select * from ids")

  if #buggs hasanswer() then

    nextID = val(#buggs nextRow$())

   else

    #buggs execute("insert into ids (COUNTER) values (1)")

  end if

  #buggs execute("update IDS set COUNTER = "+str$(nextID+1))

  call disconnect

end function



sub execute sqlStatement$

  call connect

  #buggs execute(sqlStatement$)

  call disconnect

end sub



sub setCSS

  cssid #title, "{ font-size: 1.5em ; font: bold }"

  cssclass "caption", "{ background: #EEF }"

  cssclass "table.fix", "{ table-layout: fixed }"

  cssclass "table.result", "{ width: 800px; border: 3px ridge #DDF ;  border-spacing: 3px }"

  cssclass "tr.result", "{ background: #CCF }"

  cssid #newEntry, "{ background: #CCF; width: 590px; padding: 16px }"

end sub

