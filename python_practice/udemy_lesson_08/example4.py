#Check if a number is a multiple of 3.  If it is, also check if it is a multiple of 7.
# 6 % 3 = 0; 10 % 3 =2;
print("Enter a number: ")
number = int(input())
if number % 3 is 0:
    print("Number is a multiple of 3")
    if number % 7 is 0:
        print("Number is also a multiple of 7")
    else:
        print("Number is a multiple of 3, but not a multiple of 7")
