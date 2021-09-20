function fact(n)
    if !(n isa Int64)
        error("Input type Error, Input must have Int64 type")
    elseif n < 0
        error("Input cannot be a negative number")
    elseif n == 0
        return 1
    else
        return n * fact(n - 1)
    end
end

# result = fact(5.3)
# result = fact(-5)
result = fact(5)
print(result)