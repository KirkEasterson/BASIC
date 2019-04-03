' Hangman by Janet Terra

' Released to Public Doman 1/21/07



 global #g



[restart]

 HangWord$ = HangWord$()

 GuessWord$ = ""

 Alpha$ = ""

 nWrongGuesses = 0

 

 For i = 1 to Len(HangWord$)

 GuessWord$ = GuessWord$;"_"

 Next i

 For i = 65 to 90

 Alpha$ = Alpha$;Chr$(i)

 Next i

 

 Graphic #g, 400, 300

 

[GuessLetter]

 cls

 #g Cls("White")

 Call Gallows

 If nWrongGuesses > 0 Then

 Call HangedMan1

 End If

 If nWrongGuesses > 1 Then

 Call HangedMan2

 End If

 If nWrongGuesses > 2 Then

 Call HangedMan3

 End If

 If nWrongGuesses > 3 Then

 Call HangedMan4

 End If

 If nWrongGuesses > 4 Then

 Call HangedMan5

 End If

 If nWrongGuesses > 5 Then

 Call HangedMan6

 End If

 Call HangWord GuessWord$

 Call Alphabet Alpha$

 #g Flush()

 Render #g

 print

 ltr$ = ""

 

 Input "Letter > ";ltr$

 If ltr$ = "" then [GameOver]

 Alpha$ = Alphabet$(Alpha$, ltr$)

 If Instr(HangWord$, Lower$(ltr$)) Then

 GuessWord$ = CorrectGuess$(HangWord$, GuessWord$, ltr$)

 Else

 nWrongGuesses = nWrongGuesses + 1

 End If

 

 If Instr(GuessWord$, "_") = 0 Then

 cls

 Call HangWord GuessWord$

 Call Alphabet Alpha$

 Call GameWin HangWord$

 Else

 If nWrongGuesses < 7 Then

 Goto [GuessLetter]

 Else

 cls

 Call HangedMan7

 Call GameLose HangWord$

 End if

 End If

 

[GameOver]

 cls

 #g Flush()

 Render #g

 print

 z$ = "N"

 Input "Like to play again (Y/[N])";z$

 if instr("YESyes", z$) > 0 then [restart]

 End

 

Sub GameWin HangWord$

 #g Color("Red")

 #g Place(50, 170)

 #g "\You guessed it!"

 #g "\";HangWord$

End Sub

 

Sub GameLose HangWord$

 #g Color("Red")

 #g Place(50, 170)

 #g "\You lose!"

 #g "\";HangWord$

End Sub

 

Sub HangWord text$

 #g Color("Black")

 x = 50

 For i = 1 to Len(text$)

 #g Place(x, 50)

 #g "\";Mid$(text$, i, 1)

 x = x + 20

 Next i

End Sub

 

Sub Alphabet Alpha$

 #g Color("Black")

 x = 10

 For i = 1 to Len(Alpha$)

 #g Place(x, 280)

 #g "\";Mid$(Alpha$, i, 1)

 x = x + 15

 Next i

End Sub

 

Sub Gallows

 #g Color("brown")

 #g Size(5)

 #g Line(150, 110, 150, 100)

 #g Size(10)

 #g Line(150, 100, 250, 100)

 #g Line(250, 100, 250, 250)

 #g Line(275, 250, 125, 250)

End Sub

 

Sub HangedMan1

 #g Color("blue")

 #g Size(4)

 #g Place(150, 125)

 #g Circle(15)

End Sub

 

Sub HangedMan2

 #g Color("blue")

 #g Size(5)

 #g Line(150, 140, 150, 190)

End Sub

 

Sub HangedMan3

 #g Color("blue")

 #g Size(5)

 #g Line(150, 160, 125, 140)

End Sub

 

Sub HangedMan4

 #g Color("blue")

 #g Size(5)

 #g Line(150, 160, 175, 140)

End Sub

 

Sub HangedMan5

 #g Color("blue")

 #g Size(5)

 #g Line(150, 190, 125, 230)

End Sub

 

Sub HangedMan6

 #g Color("blue")

 #g Size(5)

 #g Line(150, 190, 175, 230)

End Sub

 

Sub HangedMan7

 #g Color("gray")

 #g Size(7)

 #g Line(125, 115, 175, 115)

 #g Line(140, 110, 160, 110)

End Sub



Function CorrectGuess$(HangWord$, GuessWord$, ltr$)

 CorrectGuess$ = ""

 For i = 1 to Len(HangWord$)

 If Mid$(HangWord$, i, 1) = Lower$(ltr$) Then

 CorrectGuess$ = CorrectGuess$;Mid$(HangWord$, i, 1)

 Else

 CorrectGuess$ = CorrectGuess$;Mid$(GuessWord$, i, 1)

 End If

 Next i

End Function

 

Function Alphabet$(Alpha$, ltr$)

 Alphabet$ = ""

 For i = 65 to 90

 If Mid$(Alpha$, i - 64, 1) = Upper$(ltr$) Then

 Alphabet$ = Alphabet$;Chr$(0)

 Else

 Alphabet$ = Alphabet$;Mid$(Alpha$, i - 64, 1)

 End If

 Next i

End Function

 

Function HangWord$()

 list$ = "shoulder revenge grinder engraved larger garble calendar bravely delusion ultimate quality defect bruised toughest shampoo fumble removed multiply fixture gopher"

 HangWord = Int(Rnd(1) * 20) + 1

 HangWord$ = Word$(list$, HangWord)

End Function