function isbetween(x, y, z)
    if x ≤ y ≤ z
        return true
    else
        return false
    end
end

println(isbetween(1,2,3))