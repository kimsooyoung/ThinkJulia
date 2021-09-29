fibo_dict = Dict(1=>1, 2=>1)

function fibonacci(n)
    if n in keys(fibo_dict)
        return fibo_dict[n]
    end

    fibo_dict[n] = fibonacci(n-1) + fibonacci(n-2)
    return fibo_dict[n]
end

println(fibonacci(5))
println(fibonacci(10))

# 1 1 2 3 5