try
    cmd = `echo hello`
    run(cmd)
    # output = read(cmd, String)
    # println(output)
catch e
    println("Error Occured $e")
finally
    println("Done...")
end
