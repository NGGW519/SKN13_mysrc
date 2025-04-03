# Chaptr03-6
# set 특징
# set 자료형(순서x, 중복x, 추가o, 삭제o)
# 중복x, 순서x라서 비시퀀스형이다. 따라서 인덱스를 갖지 않음.

# 선언
a = set() #빈세트는 이렇게 함수형으로 적어야한다. 그냥 a = {}이렇게 적으면 딕셔너리다.
a_dict = {}
b = set([1, 2, 3, 4, 4, 4])
c = set([1, 4, 5, 6])
d = set([1, 2, 'Pen', 'Cap', 'Plate'])
e = {'foo', 'bar', 'baz', 'foo', 'qux'} # 중괄호 사용시 딕셔너리와 형식이 다르다
f = {42, 'foo', (1, 2, 3), 3.14159}

print('a - ', type(a), a, 2 in a)
print('a_dict - ', type(a_dict), a_dict, 2 in a)
print('b - ', type(b), b) # 중복을 허용하지 않기에 정리돼서 출력
print('c - ', type(c), c)
print('d - ', type(d), d)
print('e - ', type(e), e)
print('f - ', type(f), f)

# 튜플 변환(set > tuple)
t = tuple(b)
print('t - ', type(t), t)
print('t - ', t[0], t[1:3])

# 리스트 변환(set > list)
l = list(c)
l2 = list(e)

print('l - ', l)
print('l2 - ', l2)

# 길이
print(len(a))
print(len(b))
print(len(c))
print(len(d))
print(len(e))
print(len(f))

# 집합 자료형 활용
s1 = set([1, 2, 3, 4, 5, 6])
s2 = set([4, 5, 6, 7, 8, 9])

# 교집합
print('s1 & s2 :', s1 & s2)
print('s1 & s2 :', s1.intersection(s2))
print()

# 합집합
print('s1 | s2 :', s1 | s2)
print('s1 | s2 :', s1.union(s2))
print()

# 차집합
print('s1 - s2 :', s1 - s2)
print('s1 - s2 :', s1.difference(s2))
print()

# 합집합을 만들어 .앞의 set으로 대체한다. 말그래도 합집합으로 업데이트
# 이 연산은 print에 직접 넣어 출력 불가.
# s1 |= s2 또는 s1.update(s2)를 단독으로 선언후에 print(a) 한다.
s1 = set([1, 2, 3, 4, 5, 6])
s2 = set([4, 5, 6, 7, 8, 9])

s1.update(s2) # 또는 s1 |= s2
print('s1:', s1)
print()

# 교집합을 만들어 .앞의 set으로 대체한다. 말그래도 교집합으로 업데이트
# 이 연산은 print에 직접 넣어 출력 불가.
# s1 &= s2 또는 s1.intersection_update(s2)를 단독으로 선언후에 print(a) 한다.
s1 = set([1, 2, 3, 4, 5, 6])
s2 = set([4, 5, 6, 7, 8, 9])

s1.intersection_update(s2) # 또는 s1 &= s2
print('s1:', s1)
print()

# 차집합을 만들어 .앞의 set으로 대체한다. 말그래도 차집합으로 업데이트
# 이 연산은 print에 직접 넣어 출력 불가.
# s1 -= s2 또는 s1.difference_update(s2)를 단독으로 선언후에 print(a) 한다.
s1 = set([1, 2, 3, 4, 5, 6])
s2 = set([4, 5, 6, 7, 8, 9])

s1.difference_update(s2) # 또는 s1 -= s2
print('s1:', s1)
print()

# 중복 원소 존재 확인 - true가 나오면 없음, false가 나오면 있음(단어에 dis가 있음)
s1 = set([1, 2, 3, 4, 5, 6])
s2 = {4, 5, 6}
print('s1 & s2 :', s1.isdisjoint(s2))
print()

# 집합 관계 확인
s1 = set([1, 2, 3, 4, 5, 6])
s2 = {4, 5, 6}

print('subset :', s1.issubset(s2)) # s1이 s2의 부분집합이냐
print('superset :', s1.issuperset(s2)) # s1이 s2을 포함하냐
print('equal:', s1 == s2) # 둘이 같은 집합이냐
print()

# 추가, 제거
s1 = set([1, 2, 3, 4])

s1.add(5) # 요소를 추가
print('s1 -', s1)
s1.remove(2) # 제거, 없는거 제거하려고하면 에러뜬다. 없애려는 것 있는지 확인가능
print('s1 -', s1)

s1.discard(7) #제거, 없는거 제거하려 해도 에러 안뜬다. 안전하게 코딩 진행
print('s1 -', s1)

s1.pop() #set은 순서 없으므로 랜덤으로 하나씩 반환하고 제거한다. 더이상 삭제할게 없으면 에러.
print('s1 -', s1)

s1.clear() # 공집합 만들기. 다 지우기. 리스트도 가능
print('s1 -', s1)