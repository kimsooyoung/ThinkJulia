known = Dict()

function ack(m, n)
    if m == 0
        known[(0, n)] = n + 1
        return known[(0, n)]
    elseif n == 0
        known[(m, 0)] = ack(m-1, 1)
        return known[(m, 0)]
    elseif n > 0
        known[(m, n)] = ack(m-1, ack(m, n-1))
        return known[(m, n)]
    end
end

# println(ack(4,3)) 
println(ack(3, 5))
# => StackOverflowError