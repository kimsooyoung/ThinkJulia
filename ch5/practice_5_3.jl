function checkfermat(a, b, c, n)
    if n > 2
        if a^n + b^n == c^n
            println("페르마가 틀렸네")
        else
            println("아니요, 안됩니다.")
        end
    else
        println("N must be greater than 2")
    end
end

print("Type a : "); a = parse(Int32, readline())
print("Type b : "); b = parse(Int32, readline())
print("Type c : "); c = parse(Int32, readline())
print("Type n : "); n = parse(Int32, readline())
checkfermat(a, b, c, n)