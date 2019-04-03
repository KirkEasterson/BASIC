  call css

  dim tableOne(5, 2)

  dim tableTwo(5, 2)

  for x = 0 to 5

    for y = 0 to 2

      tableOne(x, y) = x+y

      tableTwo(x, y) = x*y

    next y

  next x

  table #one, tableOne()

  table #two, tableTwo()



  #one allclass("one")

  print "add"

  render #one



  #two allclass("two")

  print "multiply"

  render #two



sub css

  cssclass "table.one", "{border: 2px ridge #A33 ;  border-spacing: 1px}"

  cssclass "td.one", "{background: #8F8}"

  cssclass "tr.one", "{font-family: helv; font-size: 50%}"

  cssclass "table.two", "{border: 1px ridge #33A ;  border-spacing: 1px}"

  cssclass "td.two", "{background: #F88}"

  cssclass "tr.two", "{font-family: courier; font-size: 150%}"

end sub