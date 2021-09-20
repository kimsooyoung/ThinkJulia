function area(radius)
    a = π * radius^2
    return a
end

function absolute(num)
    if num > 0
        return num
    else
        return -num
    end
end

println(area(9))
println(absolute(-9))