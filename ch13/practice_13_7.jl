function processfile(filename)
    my_dict = Dict()
    for line in eachline(filename)
        processline(line, my_dict)
    end
    my_dict
end

function processline(line, dict)
    if line == ""
        return nothing
    end

    line = replace(line, '-'=>' ')
    for word in split(line)
        word = string(filter(isletter, [word...])...)
        word = lowercase(word)
        dict[word] = get!(dict, word, 0) + 1
    end
end

function search_value(num, arr)
    mid = floor(Int, length(arr) / 2)
    if arr[mid] < num ≤ arr[mid+1]
        return arr[mid+1]
    elseif arr[mid] == num
        return arr[mid]
    elseif arr[mid+1] < num
        return search_value(num, arr[mid+1:end])
    elseif num < arr[mid]
        return search_value(num, arr[1:mid])
    end
end

function randomword(h)
    sum = 0
    accumul_arr = []
    words = collect(keys(h))

    for count in values(h)
        sum += count
        push!(accumul_arr, sum)  
    end

    rand_num = rand(1:sum) # 27223, 87394

    val = search_value(rand_num, accumul_arr)
    result = (findall(isequal(val), accumul_arr))[1]

    words[result]
end

my_dict = processfile("emma.txt")

for i in 1:10
    println(randomword(my_dict))
end
