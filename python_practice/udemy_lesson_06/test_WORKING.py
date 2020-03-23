#Easy
#Write a program to create a tuple of 4 elements

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
listName = list(tupleName)
print(listName)
print(type(listName))

#Hard
#Now delete the first element in this list and convert it back to tuple
#listName.remove[0]

listName.remove("blue")
### Apparently works too: 'del listName[0]'' ###
#print(listName)
tupleName = tuple(listName)
print(tupleName)
print(type(tupleName))
