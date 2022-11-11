weight = float(input("What is your weight? "))
type = input("(K)g or (L)bs: ")
if type == "K" or "k":
    converted = weight * 2.2
    print("Weight in lbs: " + str(converted))
else:
    converted = weight * 0.45
    print("Weight in kg: " + str(converted))
