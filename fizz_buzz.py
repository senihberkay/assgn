for i in range(1,101):
    if i % 3 == 0 or i % 5 == 0:
        if i % 5 != 0:
            print("Fizz")
        elif i % 3 != 0:
            print("Buzz")
        else:
            print("FizzBuzz")
    else:
        print(i)
