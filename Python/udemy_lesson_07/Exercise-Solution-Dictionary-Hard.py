# Create a dictionary to store the age of 5 employees
ageOfEmployees = {'Ben': 25, 'Matthew': 32, 'Mark': 28, 'Mary': 21, 'Leon': 23}
# Update the age of Matthew
ageOfEmployees['Matthew'] = 35
copyOfAgeOfEmployees = ageOfEmployees.copy()
ageOfEmployees.clear()
print('copyOfAgeOfEmployees = {}'.format(copyOfAgeOfEmployees))
print('ageOfEmployees = {}'.format(ageOfEmployees))

# Output => copyOfAgeOfEmployees = {'Ben': 25, 'Matthew': 35, 'Mark': 28, 'Mary': 21, 'Leon': 23}
#        => ageOfEmployees = {}
