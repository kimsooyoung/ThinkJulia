function gcd(a, b)
    if a == b
        return a
    end

    if a > b
        r = a % b
    else
        r = b % a
        b = a
    end
    @show a b r
    
    if r == 0
        return b
    else
        gcd(b, r)
    end
    
end

println(gcd(26, 34))