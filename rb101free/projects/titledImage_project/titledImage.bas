'This object accepts an image filename and a title and

'displays them.  This is used by the tinyImageApp program.



global #image, title$, imageFile$



function setTitle(str$)

  title$ = str$

  call updateRendering

end function



function setImage(filename$)

  imageFile$ = filename$

  call updateRendering

end function



sub updateRendering

  cls

  if title$ <> "" and imageFile$ <> "" then

    loadgraphic #image, imageFile$

    howTall = #image height()

    #image color("white")

    xPosition = (#image width() - #image stringwidth(title$)) / 2

    #image place(xPosition, howTall - 14)

    #image "\";title$

    render #image

  end if

end sub

