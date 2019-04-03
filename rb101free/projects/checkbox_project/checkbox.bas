  buffer$ = "Uppercase me!"

  txt$ = buffer$



[display]

  cls

  checkbox #cbox, txt$, flag

  link #doIt, "Execute", [execute]

  wait



[execute]

  flag = #cbox value()

  if flag = 1 then

    txt$ = upper$(buffer$)

  else

    txt$ = buffer$

  end if

  goto [display]