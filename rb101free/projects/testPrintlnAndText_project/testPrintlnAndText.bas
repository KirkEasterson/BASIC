print "Click the more link again and again."

textarea #tb, ""

print

link #more, "more", [more] : print

link #clear, "clear", [clear]

wait



[more]

#tb println("more...")

wait



[clear]

#tb text("")

wait