function hasduplicate(t)
    if t isa String
        t = collect(t)
    end

    t2 = sort(t)
    i = firstindex(t2)

    while i < length(t2)
        if t2[i] == t2[i+1]
            return false
        end

        i = nextind(t2, i)
    end

    true
end

my_list = "cbeplfokjiaa"
println(hasduplicate(my_list))
println(my_list)