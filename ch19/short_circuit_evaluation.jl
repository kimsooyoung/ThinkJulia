function factorial(n::Integer)
    # not >= 0 ? then error
    n >= 0 || error("n must not be negative")
    # n == 0 ? then return 1
    n == 0 && return 1
    return n * factorial(n-1)
end

println(factorial(3))