#CONDITIONALS - Exercise
#Easy
#Write a program to check if a number is less than 10
print("Please Enter a Number: ")
number = int(input())
if number < 10:
    print('{} is less than 10!'.format(number))
elif number == 10:
#    if number == 10:
        print('{} equals 10!'.format(number))
else:
    print('{} is greater than 10!'.format(number))

#Medium
#Write a program to check if a given number is odd or even
if number % 2 is 0:
    print('{} is an even number!'.format(number))
else:
    print('{} is an odd number!'.format(number))

#Hard
#Write a program to check if a number is divisible by both 10 as well as 50. If it is
#divisible by 30 as well, print “This number is divisible by 10, 50 and 30”. If not, print
#“This number divisible by 10 and 50 but not 30”
if number % 10 is 0 and number % 50 is 0 and number % 30 is 0:
    print("This number is divisible by 10, 50 and 30")
elif number % 10 is 0 and number % 50 is 0:
    print("This number is divisible by 10 and 50 but not 30")
else:
    print("This number is useless")
