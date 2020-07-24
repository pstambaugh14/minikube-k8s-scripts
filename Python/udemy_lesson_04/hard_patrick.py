#WORKING BUT THERE ARE TWO METHODS

#METHOD 1
print("Starting Method One...")
string = "Python programming is easy"
slicePeriod = string[0:26]
print(slicePeriod)
final = " and powerful."
print(slicePeriod + final)

print("---------------------------------------------------")

print("Starting Method Two...")

#METHOD 2
string = "Python programming is easy"
slice = string[22:26]
print(slice)
slice = slice.replace('easy',' and powerful')
final = string + slice
print(final)
