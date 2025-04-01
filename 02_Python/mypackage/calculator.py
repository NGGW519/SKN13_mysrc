# mypackage/calculator.py

# 변수 정의(Global)
__version__ = 0.1 #꼭 넣어야하는건 아니지만, 버전을 지정하기도 한다.

# 함수 정의
def plus(num1, num2):
    return num1 + num2

def minus(num1, num2):
    return num1 - num2

def multiply(num1, num2):
    return num1 * num2

def divide(num1, num2):
    return num1 / num2

if __name__ == "__main__": # 이하의 코드는 현재의 모듈이 메인모듈일때만 실행되고, 서브 모듈로서 import된 경우에는 실행되지 않게함
    print(">>>>>name<<<<<", __name__)
    print(plus(30,5))
    print(minus(20,10))
    print(multiply(20,3))