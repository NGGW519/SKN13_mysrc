# Chapter04_03
# 파이썬 반복문
# While 실습

# while <expr>:
#    <statement(s)>
# if문과 쓰는 방식은 똑같다. 다만 조건이 True인 동안 코드블록을 반복하고, 불만족시 while을 빠져나간다.

# 예제1
n = 5 # 초기값
while n > 0: # 조건식
    print(n)
    n -= 1 # 변화식or증감식

print()

# 예제2
a = ['foo', 'bar', 'baz']
while a: # while True: 와 같은 의미. a가 빈 리스트가 아닌 이상 계속 반복한다.
    print(a.pop()) # 마지막 원소를 빼내므로 a가 하나씩 작아지는 리스트

print()

# 예제2_1
# while문으로 시퀀스 객체의 인덱스 루프 테크닉
example_list = ["가", "나", "다", "라", "마", "바", "사", "아", "자"] # len(example_list) = 9, range(9) -> 0,1,2,3,4,5,6,7,8

idx = 0
while idx < len(example_list):
    print(example_list[idx], end = " ")
    idx +=1

print()
print()

# 예제3
# if 중첩
# break, continue
n = 5
while n > 0:
    n -= 1
    if n == 2:
        break
    print(n)
print('Loop Ended.')

print()

m = 5
while m > 0:
    m -= 1
    if m == 2:
        continue # m==2 일때 이하를 스킵
    print(m)
print('Loop Ended.')

print()

# 예제5
i = 1
while i <= 10:
    print('i :', i)
    if i == 6:
        break
    i += 1

print()

# while - else 구문(for와 같다)

# 예제6
n = 10
while n>0:
    n -= 1
    print(n)
    if n == 5:
        break # while에서 break를 만났기 때문에 else는 출력되지 않는다. 
else:
    print('else out') # break를 안만났다면 else가 출력됐을것 

print()

# 예제7
a = ['foo', 'bar', 'baz', 'qux']
s = 'kim'

i = 0

while i < len(a):
    if a[i] == s:
        break
    i += 1
else:
    print(s, "not found in list") # s 가 a의 원소였으면 break를 만나서 출력되는게 없음

print()

# 무한 반복 조심
# while True:
#    print('foo')  <-  'foo'는 true이므로 'foo'를 계속 출력한다. break 활용 필수

# 예제8
a = ['foo', 'bar', 'baz']

while True:
    if not a:
        break
    print(a.pop())

# 무한 루프의 활용
# input()을 조합하여 원하는 값을 받을 때 까지 입력을 받는 프로그램 구현 

while True:
    input_value = input("q를 입력하면 종료됩니다.")
    if input_value == "q":
        break
print("프로그램을 종료합니다")