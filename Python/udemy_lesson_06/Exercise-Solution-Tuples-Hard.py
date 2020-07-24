# Create a tuple of 4 elements
leapYear = (2016, 2020, 2024, 2028)
# To convert the tuple into a list, perform a typecasting
leapYearList = list(leapYear)
# Delete first element of list
del leapYearList[0]
# To convert the list to tuple, perform a typecasting
convertedLeapYearTuple = tuple(leapYearList)
print(convertedLeapYearTuple)

# Output => (2020, 2024, 2028)
