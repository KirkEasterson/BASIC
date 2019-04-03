'declare css

cssid #boxes, "{ padding: 4px; background: #EEF }"

cssid #colorBox, "{ padding: 4px; background: #FCC; width: 100px; float: left; }"

cssid #shapeBox, "{ padding: 4px; background: #CFC; width: 100px;  }"



dim color$(2)

  color$(0)="red"

  color$(1)="green"

  color$(2)="blue"

  color$ = "green"



dim shape$(2)

  shape$(0)="square"

  shape$(1)="triangle"

  shape$(2)="circle"

  shape$ = "triangle"



[showAll]

  cls

  graphic #area, 300, 200

  html "<h2>Spirals, a Listbox demo</h2>"



  div boxes

    div colorBox

      listbox #color, color$(), 5

      #color select(color$)

    end div

    div shapeBox

      listbox #shape, shape$(), 3

      #shape select(shape$)

    end div

  end div



   cssid #specialText, "{ color: "; color$;"; font-family: ""Times New Roman""; font-size: 20pt}"



  div specialText

    link #go, "Draw", [handleSelection]

  end div



  print

  gosub [draw]

  render #area

  wait



[handleSelection]

  color$ = #color selection$()

  shape$ = #shape selection$()

  goto [showAll]



[draw]

  #area color(color$)

  #area place(150, 100)

  select case shape$

  case "square"

    for x = 1 to 150

      #area go(x) : #area turn(91)

    next x

  case "triangle"

    for x = 1 to 170

      #area go(x) : #area turn(121)

    next x

  case "circle"

    for x = 1 to 510

      #area go(x/30) : #area turn(9)

    next x

  end select

  return



