function divisorTest(num)
    if num % 2 == 0 || num % 3 == 0
        if num % 2 == 0 && num % 3 == 0
            println("2 and 3 are factor of $num")
        elseif num % 2 == 0 && !(num % 3 == 0)
            println("2 is factor of $num, but 3 is not")
        end
    else
        println("Nothing")
    end
end

divisorTest(12)
divisorTest(11)
divisorTest(10)