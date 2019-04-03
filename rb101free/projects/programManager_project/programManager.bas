[masterPage]

cls

html "<h2>Program manager</h2>"

link #wiki, "Wiki", [runTheWiki]

print " ";

link #multi, "Multicounter", [runTheMulticounter]

print

if launchFlag then render #subProg

wait



[runTheWiki]

run "runWiki", #subProg

launchFlag = 1

goto [masterPage]



[runTheMulticounter]

run "multicounter", #subProg

launchFlag = 1

goto [masterPage] 

