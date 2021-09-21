function ispower(a, b)
    
    if a == 1
        return true
    else
        if a % b == 0
            ispower(a/b, b)
        else
            return false
        end
    end
end

println(ispower(81, 3))

# But it only works with Int type inputs 
# println(ispower(1.21, 1.1))
# 
# Julia's float operation doesn't assure accurate precision 
# julia> 1.1^2
# 1.2100000000000002