  run "titledImage.bas", #imageObject

  print "Type an image file: ";

  textbox #imagefield, "mandelbrot.jpg"

  print " Type a title: ";

  textbox #titlefield, "Fractal image"

  print

  link #showMe, "Show the image", [showIt]

  print

  render #imageObject

  wait



[showIt]

  #imageObject setImage(#imagefield contents$())

  #imageObject setTitle(#titlefield contents$())

  wait