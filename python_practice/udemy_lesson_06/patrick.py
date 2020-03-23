#Easy
#Write a program to create a tuple of 4 elements
skyColor = "blue"
cloudColor = "white"
earthColor = "green"
fireColor = "red"

#(f-string) syntax to insert variable values.
#An f at the beginning of the string tells Python to allow any currently
#valid variable names as variable names within the string.
#tupleName = (f"{skyColor}, {cloudColor}, {earthColor}, {fireColor}")

tupleName = ("blue", "white", "green", "red")

print(tupleName)
print(type(tupleName))

#temperature = int(25.77) - helped note how to assign data type as
#Medium
#Convert this tuple into a list
tuple0 = str(tupleName[0])
tuple1 = str(tupleName[1])
tuple2 = str(tupleName[2])
tuple3 = str(tupleName[3])

print(type(tuple0))
#listName = [f"{tuple0}, {tuple1}, {tuple2}, {tuple3}"]
print("{}".format(tuple0))
print("{}".format(tuple1))
print("{}".format(tuple2))
print("{}".format(tuple3))
listName = [f"{tuple0}, {tuple1}, {tuple2}, {tuple3}"]
print(listName)
print(type(listName))
#print("0:0 is equal to" + listName)

print(tupleName)
print(type(tupleName))
#Hard
#Now delete the first element in this list and convert it back to tuple
#listName.remove[0]
