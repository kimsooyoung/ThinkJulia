function ack(m, n)
    if m == 0
        return n + 1
    elseif n == 0
        return ack(m-1, 1)
    elseif n > 0
        return ack(m-1, ack(m, n-1))
    end
end

# println(ack(4,3)) => StackOverflowError
println(ack(3, 4))