function istriangle(a, b, c)
    len_arr = [a, b, c]
    len_arr = sort(len_arr)

    if len_arr[3] > (len_arr[1] + len_arr[2])
        println("No")
    else
        println("Yes")
    end
end

istriangle(3, 4, 8)