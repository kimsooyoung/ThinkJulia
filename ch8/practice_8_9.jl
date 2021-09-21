function isapalindrome(word)
    word === word[end:-1:1]
end

println(isapalindrome("noon"))
println(isapalindrome("onion"))