#Easy
#Write a program to create a list of 5 elements
listVar = ['Henry', 'Bergkamp', 'Ljungberg', 'Pires', 'Vieira']
print(listVar)


#Medium
#Update the value at 3rd element of the list
def retVal():
    print(listVar[2])
retVal()
listVar[2] = 'Reyes'
print(listVar)


#Hard
#Create another list of 3 elements. Now create a final result as a concatenation
#of the first two lists
list2 = ['Beckham', 'Giggs', 'Scholes']
#print("Attempt to print " + list2 + " attempt one.")
#listVar.append(list(list2))
listVar2 = listVar + list2
print(listVar2)
