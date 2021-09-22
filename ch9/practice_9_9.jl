function reverseage(x, y)
    count = 0
    x_now = 0
    y_now = 0

    if x >= y
        return 0
    end

    if y > 99
        return 0
    end

    while y <= 99
        if reverse(string(x)) == string(y)
            count += 1
            if count == 6
                x_now = x
                y_now = y
            end
        end

        x += 1; y += 1
    end

    if count == 8
        println(x_now, " ", y_now)
    end 

    count

end

function puzzler3()

    for y in 21:99
        for x in 12:99
            reverseage(x, y)
        end
    end
end

puzzler3()