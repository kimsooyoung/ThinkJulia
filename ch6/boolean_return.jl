function isdivisible(x, y)
    if x % y  == 0
        return true
    else
        return false
    end
end

println(isdivisible(4, 2))