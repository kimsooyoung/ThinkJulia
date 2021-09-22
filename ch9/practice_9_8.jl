function ispalindrome(word)
    if word == reverse(word)
        return true
    end

    false
end

function puzzler2(word)
    num1 = string(word) # 4
    num2 = string(word+1) # 5
    num3 = string(word+2) # middle 4
    num4 = string(word+3) # 6

    # @show num1 num2 num3 num4

    if ispalindrome(num1[end-3:end]) && ispalindrome(num2[end-4:end]) && ispalindrome(num3[end-4:end-1]) && ispalindrome(num4)
        return true
    end
    false
end

function puzzlercheck()
    for i in 100000:999999
        if puzzler2(i) == true
            println(i)
        end
    end
end

puzzlercheck()