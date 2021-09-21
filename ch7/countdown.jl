function countdown(n)
    while n > 0
        print(n, " ")
        n = n - 1 
    end
    println("Boom!!")
end

countdown(5)