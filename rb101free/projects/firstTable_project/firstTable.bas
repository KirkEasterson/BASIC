call setCSS

dim a(4, 4)

for x = 0 to 4

for y = 0 to 4

a(x,y) = x*y

next y

next x

table #t1, a()

#t1 caption("This is a magical place")

#t1 columnnames("zero,one,two,three,four")

#t1 cssclass("fix")

render #t1

wait



sub setCSS

  cssclass "caption", "{ background: #EEF }"

  cssclass "table.fix", "{ table-layout: fixed }"

  cssclass "table", "{ width: 800px; border: 8px ridge #CCF ;  border-spacing: 3px }"

  cssclass "tr", "{ background: #CCF }"

end sub