function fibonacci(c::Channel)
    a = 0
    b = 1
    put!(c, a)
    while true
        put!(c, b)
        (a, b) = (b, a + b)
    end
end

fib = Channel(fibonacci)
println(take!(fib))
println(take!(fib))

for val in Channel(fibonacci)
    println(val)
    val ≥ 20 && break
end