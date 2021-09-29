been_called = false
const known = Dict(0=>0, 1=>1)

function example()
    # global been_called
    been_called = true
end

function example2()
    known[2] = 3
end

println(been_called)
example()
println(been_called)

println(known)
example2()
println(known)
