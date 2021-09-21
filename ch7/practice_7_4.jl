function estimatepi()
    term = 1
    output = 0
    k = 0

    while term > 1e-15
        term = (factorial(4k)*(1103+26390k))/((factorial(k)^4)*(396^(4k)))
        output = output + (2*sqrt(2))/(9801) * term
        k = k + 1
    end

    return 1 / output
end

print(estimatepi(), " ", 1pi)