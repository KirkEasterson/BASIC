  xml$="<a href = ""http://www.runbasic.com"" target=""_blank"">The Run BASIC site"

  on error goto [parsingFailed]



[parseIt]

  xmlparser #href, xml$

  for x = 1 to #href attribcount()

  print #href attribkey$(x);", "; #href attribvalue$(x)

  next x

  end



[parsingFailed]

  print Err$

  print "Adding </a> tag and retrying."

  xml$ = xml$ + "</a>"

  goto [parseIt]