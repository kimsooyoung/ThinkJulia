function seq(n)
    while n != 1
        println(n)
        if n % 2 == 0
            n = n / 2
        else
            n = n * 3 + 1
        end
    end
end

seq(3)