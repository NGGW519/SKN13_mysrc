
#1 사용자로부터 파일명을 입력받는다.
print("저장할 파일이름을 입력하세요")
print("="*25, "CLI 메모장", "="*25)
file_path = input("저장할 파일경로:")

#2 한줄씩 입력받으며 파일에 저장
#3 끝내는 명령어 설정

with open(file_path, "wt", encoding="utf-8") as fw: #저장할 파일을 연결
    print("="*25, "저장할 내용을 한 줄씩 입력하세요.", "="*25)
    while True:
        txt = input(">")
        if txt =="!q":
            break
        fw.write(txt+"\n")

print("="*25, "저장되었습니다.", "="*25)

#4 잘 저장됐는지 확인
