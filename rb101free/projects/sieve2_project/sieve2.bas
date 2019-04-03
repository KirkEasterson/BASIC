    size = 7000

    dim flags(7001)

    start = time$("ms")

    print sieve(size); " primes found."

    print "End of iteration.  Elapsed time in milliseconds: "; time$("ms")-start

    end



    function sieve(size)

        for i = 0 to size

            if flags(i) = 0 then

                prime = i + i + 3

                k = i + prime

                while k <= size

                    flags(k) = 1

                    k = k + prime

                wend

                sieve = sieve + 1

            end if

        next i

    end function

