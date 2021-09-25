function issort(t)
    if t isa String
        t = collect(t)
    end

    if t == sort(t)
        return true
    else
        return false
    end
end

println(issort("abc"))
println(issort("abcdda"))