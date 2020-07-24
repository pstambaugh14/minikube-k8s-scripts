#example of when to use elif conditions

#Variable for Total Marks
totalMarks = 60
#IF Condition whereas if statement = true, then execute within block
if totalMarks >= 90:
    print("Congrats!")
#ELIF condition where it is as: "Else IF." If some other condition is TRUE.
elif totalMarks >= 40:
    print("Meh...")
#ELSE executes only if no other conditions have been met, therefore "anything else..."    
else:
    print("Sadface")
