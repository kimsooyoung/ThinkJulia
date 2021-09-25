function isanagram(a, b)
    if a isa String
        a = collect(a)
    end

    if b isa String
        b = collect(b)
    end

    if sort(a) == sort(b)
        return true
    else
        return false
    end
end

println(isanagram("abc", "cba"))