import streamlit as st
import pandas as pd
import numpy as np

st.set_page_config(page_title="Layout&Cache", layout="wide")
##################################################
# Layout 나누기
# 일단 디폴트는 한줄에 하나씩만 나온다.
# 행을 여러 열로 나눠서 출력한다.
# st.columns(나눌 개수)
##################################################


col1, col2 = st.columns(2)
# print(type(col1))
col11, col12 = col1.columns(2) # col1을 2개로 또 나누기기
col11.title("제목")
col11.header("중제목")
col11.subheader("소제목")
col11.text("일반 글1")
col11.text("일반 글2")
col11.markdown("**볼드체**")

col12.write("# 제목")
col12.write("## 중제목")
col12.write("### 소제목")
col12.write("일반글")


st.divider() # 창을 여길 기준으로 위아래 나누기. 가로줄이 길게 생긴다.
st.title("환율")
col1, col2, col3, col4 = st.columns(4)
col1.metric(label="달러USD", value="1,228 원", delta="-12.00 원")
col2.metric(label="유럽연합EUR", value="1,335.82 원", delta="11.44 원")
col3.metric(label="중국CNY", value="191.90 원", delta="0.0 원")
col4.metric(label="일본JPY(100엔)", value="958.63 원", delta="-7.44 원")

# with 문을 이용하면 with block 안의 내용은 그 컬럼내에 출력된다.
# 위에 보면, 'col1.' 'col12.' 과 같이 하나하나 설정했지만, with을 이용하여 묶어서 한 번에 설정할 수 있다.
st.title("With Block이용")
col1, col2 = st.columns(2)
with col1:
    st.header("col1")
    st.write("안녕하세요.")
    
with col2:
    st.header("col2")
    st.write("Hello World")

#########################################################
# Cache (https://docs.streamlit.io/develop/concepts/architecture/caching)
#  Streamlit은 사용자와 상호작용을 하는 경우(ex: 버튼 클릭, 데이터 입력) 전체 코드를 재실행한다. 
#  재실행 할 때마다 함수를 재호출 하고 데이터를 재생성 하게 된다.  
#  재호출할 필요 없는 함수, 재생성 할 필요가 없는 데이터가 있을 경우 다음 decorator를 함수에 선언하여 막아 줄 수 있다.
#  메모리에 한 번 올려 놓은걸 계속 재사용하여 쓴다.
#
# @st.cache_data
#   - data를 반환하는 함수에 사용
#   - 값과 연결할 때!
#   - 파이썬 value, DataFrame
# @st.cache_resource
#   - 위의 data를 제외한 나머지
#   - resource를 반환하는 함수에 사용
#   - 머신러닝/딥러닝 모델, Database 연결등
#  
# Database에 저장할 수있는 객체이면 st.cache_data, 아니면 st.cache_resource
#########################################################


# 데이터를 제공하는 함수.
@st.cache_data
def get_data():
    print("get_data")
    df = pd.read_csv("data/boston_housing.csv") 
    return df.head(15) # csv로부터 정보를 읽어와서 15글자를 반환


st.divider()

st.title("보스톤 지역 주거지역 정보")
btn = st.checkbox("정보를 확인 할까요?") 
if btn:
    data = get_data() # streamlit 상에서 체크박스를 체크하고 비우는 과정을 진행할 때마다 위의 get_data 함수를 계속 호출함
    st.dataframe(data)
    

# 캐시를 다시 지워주어야할 땐 streamlit 우측 상단에 있는 점을 눌러 캐시 삭제 가능