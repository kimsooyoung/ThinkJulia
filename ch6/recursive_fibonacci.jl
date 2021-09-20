function fib(n)
    if n == 0 || n == 1
        return 1
    end
    
    return fib(n - 1) + fib(n - 2)
end

# 1 1 2 3 5 8
result = fib(2)
println(result)
