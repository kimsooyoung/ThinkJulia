function hasduplicates(arr)
    dict = Dict()

    for val in arr
        if val ∉ keys(dict)
            dict[val] = 1
        else
            return true
        end
    end

    false
end

my_list = "cbeplfokjia"
println(hasduplicates(my_list))
println(my_list)