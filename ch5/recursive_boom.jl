function countdown(n)
    if n ≤ 0
        println("Boom!")
    else
        print("$n ")
        countdown(n-1)
    end
end

countdown(5)