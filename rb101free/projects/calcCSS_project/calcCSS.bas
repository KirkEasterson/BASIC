'calculator

  call setCSS

  answer$ = "?"



[display]



  cls

  div banner : end div

  div calc

    print "Type in two values and pick an operation."

    textbox #first, first

    print " ";

    textbox #second, second

    print " = "; answer$

    print

    link #add, "+", [add]

    link #sub, "-", [subtract]

    link #mul, "*", [multiply]

    link #div, "/", [divide]

    #add cssclass("calcButton")

    #sub cssclass("calcButton")

    #mul cssclass("calcButton")

    #div cssclass("calcButton")

  end div

  wait



[add]

  gosub [getFields]

  answer$ = str$(first+second)

  goto [display]



[subtract]

  gosub [getFields]

  answer$ = str$(first-second)

  goto [display]



[multiply]

  gosub [getFields]

  answer$ = str$(first*second)

  goto [display]



[divide]

  gosub [getFields]

  if second = 0 then

    answer$ = "Divide by zero.  :-("

   else

    answer$ = str$(first/second)

  end if

  goto [display]



[getFields]

  first = #first value()

  second = #second value()

  return 



sub setCSS

  cssid #banner, "{ background-repeat: no-repeat; background-image: url('http://localhost:8008/resources/calcbanner.PNG') ; height: 80px}"



  cssid #calc, "{ background: #CCF; width: 590px; padding: 16px }"



  cssclass "a.calcButton", "{ text-decoration: none; font-size: 20pt; width: 30px; height: 30px; display: block; float: left; background: #EEF; margin-right: 5px; text-align: center }"

  cssclass "a.calcButton:hover", "{ background: #FFF }"



end sub