fout = open("output.txt", "w")

word = "Kim Soo Young"
line1 = "This is test line\n"
line2 = "Hello Julia from File System\n"
write(fout, line1)
print(fout, line2 )
print(fout, "I am $(word)\n")

close(fout)