try
    f = open("error.txt")
    line = readline(f)
catch e
    println("Error : $e")
finally
    println("Done")
end