function compare(x, y)
    if x > y
        return 1
    elseif x == y
        return 0
    else
        return -1
    end
end

println(compare(1,2))
println(compare(2,1))
println(compare(2,2))