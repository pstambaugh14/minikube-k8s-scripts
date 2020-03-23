#DICTIONARY - Exercise
#Easy
#Write a program to create a dictionary with 5 key-value pairs
londonKitColors = {"Arsenal":"Red and White", "Chelsea":"Blue", "Spuds":"White", "Fulham":"Black and White", "West Ham":"Red and Blue"}
print(londonKitColors)
print(type(londonKitColors))
#Medium
#Update the value of a key
londonKitColors["Spuds"] = "Blank"
print(londonKitColors)
print(type(londonKitColors))

#Hard
#Copy this dictionary to another dictionary and clear the first dictionary
copyOfLondonKitColors = londonKitColors.copy()
print('copy OfLondonKitColors = {}'.format(copyOfLondonKitColors))
print('copy-type = {}'.format(type(copyOfLondonKitColors)))
londonKitColors.clear()
print('original londonKitColors = {}'.format(londonKitColors))
print(type(londonKitColors))




#print('copyOfAgeOfEmployees = {}'.format(copyOfAgeOfEmployees))
#print('ageOfEmployees = {}'.format(ageOfEmployees))
