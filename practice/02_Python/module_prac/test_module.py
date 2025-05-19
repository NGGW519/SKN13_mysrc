
PI = 3.141592

def number_input():
    output = input("Enter number>")
    return float(output)

def get_circumference(radius):
    return 2 * PI * radius

def get_circle_area(radius):
    return PI * radius ** 2
