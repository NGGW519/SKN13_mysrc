/* *************************************
SELECT 기본 구문 - 연산자, 컬럼 별칭

  select 컬럼명, 컬럼명 [, .....]  => 조회할 컬럼 지정. *: 모든 컬럼
  from   테이블명                 => 조회할 테이블 지정.

- 컬럼명 [as 별칭] => 컬럼명으로 조회한 것을 별칭으로 보여준다. 
- distinct 컬럼명 => 중복된 결과를 제거한다.

참고: 
- Sql은 대소문자 구분 안함.
- sql문 실행: control+enter
*************************************** */

-- EMP 테이블의 모든 컬럼의 모든 항목을 조회.
use hr;
select * from emp;

-- EMP 테이블의 직원 ID(emp_id), 직원 이름(emp_name), 업무(job) 컬럼의 값을 조회.
select emp_id, emp_name, job
from emp; 
-- select 내용은 컬럼을 순서대로 쓸 필요는 없고, 내가 보고싶은 순서대로 적으면 된다.
-- 여러줄로 하든, 띄어쓰기를 몇개를 하든 상관이 없으므로 가독성 좋게 쓰는 것이 좋다.

-- EMP 테이블의 업무(job) 어떤 값들로 구성되었는지 조회. - 동일한 값은 하나씩만 조회되도록 처리.(distinct 사용)
select distinct job from emp;
-- 범주형 컬럼에서 범주값이 어떻게 구성되었는지 확인하는것.
select distinct job, dept_name from emp; -- job과 dept_name을 묶어서 그 묶음이 같은것끼리 합쳐서 보여준다.


-- EMP 테이블에서 emp_id는 직원ID, emp_name은 직원이름, hire_date는 입사일, salary는 급여, dept_name은 소속부서 별칭으로 조회결과를 출력 한다.
-- 아래의 as는 생략이 가능하다.
-- 별칭에 _를 제외한 특수문자를 넣을 수 없다. 띄어쓰기 같은 공백도 불가. 하고싶다면? 큰따옴표로 묶어주면 된다.
-- 띄어쓰기등이 없으면 안 묶어도 되지만, 묶으려면 다같이 묶는게 보기 좋다. 어쨌건 중요한건 가독성.
select emp_id as "직원 ID",
	   emp_name as "직원 이름",
       hire_date as "입사일",
       salary as "급여",
       dept_name as "소속 부서"
from emp;


/* **************************************
연산자 
- 산술 연산자 
	- +, -, *, /, %, mod, div (몫 연산)
- 여러개 값을 합쳐 문자열로 반환
	- concat(값, 값, ...)
- 피연산자가 null인 경우 결과는 null
- 연산은 그 컬럼의 모든 값들에 일률적으로 적용된다.
- 같은 컬럼을 여러번 조회할 수 있다.
************************************** */

-- cf. 10 + null = 10 더하기 모르는 값 = 따라서 결과는 그냥 모르는 값(null)

-- EMP 테이블에서 직원의 이름(emp_name), 급여(salary), 급여(salary)을 연봉으로 조회. (곱하기 12)
select emp_name,
	   salary,
       salary * 12
from emp;
-- salary를 여러개 조회할 수도 있고, 다양한 연산을 한 것들을 뽑아낼 수 있다.
select salary as 월급,
	   salary*12 as 연봉,
       salary/30 as 일당,
       salary/30/24 as 시급
from emp;


-- EMP 테이블에서 직원의 ID(emp_id), 이름(emp_name), 급여(salary), 커미션_PCT(comm_pct), 급여에 커미션_PCT를 곱한 값을 조회.
select emp_id as ID,
	   emp_name as 이름,
       salary as 급여,
	   comm_pct as 커미션_PCT,
       salary * comm_pct as 커미션
from emp;

-- 직원 이름(emp_name)과 salary앞에 '$'를 붙여서 출력.
-- 파이썬이라면, "$" + str(salary) 이렇게만 했음 됐지만, mysql은 안된다. +는 숫자끼리만! 함수를 써야한다.
-- concat() : ,를 기준으로 문자열을 나열해놓으면 합쳐진다. ex) concat('$', salary, '달러') -> $salary달러
select emp_name as 이름,
       concat('$', salary) as salary  -- 별칭은 안넣으면 "'$', salary" 얘가 table에 들어간다.
from emp;

-- 아직까진 특정 컬럼만 뽑아왔다. 컬럼을 뽑으면, 그 컬럼의 모든 행을 보여준다.
-- 원하는 행만을 보고싶다면? 아래의 where 절 사용!

/* *************************************
where 절을 이용한 행 선택 

주의 : mysql은 비교시 대소문자를 가리지 않는다.
      ex) select * from emp where emp_name = 'steven'; Steven 조회된다.
     대소문자 구별해서 비교하게 하려면 컬럼명 앞에 BINARY를 붙인다.
	  ex) where BINARY emp_name = 'Steven' and BINARY job_id = 'aD_PRES';
          위의 예시는 emp_name과 job_id를 대소문자 구별해서 조회한다.
************************************* */

#######################
-- EMP 테이블에서 직원_ID(emp_id)가 110인 직원의 이름(emp_name)과 부서명(dept_name)을 조회
select emp_id as 직원_ID,
	   emp_name as 이름,
       dept_name as 부서명
from emp
where emp_id = 110;
 
 
#######################
-- EMP 테이블에서 'Sales' 부서에 속하지 않은 직원들의 ID(emp_id), 이름(emp_name),  부서명(dept_name)을 조회.
select emp_id as ID,
	   emp_name as 이름,
       dept_name as 부서명
from emp
where dept_name != 'Sales';


#######################
-- EMP 테이블에서 급여(salary)가 $10,000를 초과인 직원의 ID(emp_id), 이름(emp_name)과 급여(salary)를 조회
select emp_id as ID,
	   emp_name as 이름,
       salary as 급여
from emp
where salary > 10000;


#######################
-- EMP 테이블에서 커미션비율(comm_pct)이 0.2~0.3 사이인 직원의 ID(emp_id), 이름(emp_name), 커미션비율(comm_pct)을 조회.
select emp_id as ID,
	   emp_name as 이름,
	   comm_pct as 커미션비율
from emp
where comm_pct between 0.2 and 0.3;
-- where comm_pct>= 0.2 and comm_pct<= 0.3 과 같은 말이다.
-- where 0.2 =< comm_pct =< 0.3; 얘는 안됨


#######################
-- EMP 테이블에서 업무(job)가 'IT_PROG' 거나 'ST_MAN' 인 직원의  ID(emp_id), 이름(emp_name), 업무(job)을 조회.
select emp_id as ID,
	   emp_name as 이름,
       job as 업무
from emp
where job in ('IT_PROG', 'ST_MAN');
-- where job = 'IT_PROG' or job = 'ST_MAN'; 와 같은 것.


#######################
-- EMP 테이블에서 직원 이름(emp_name)이 S로 시작하는 직원의  ID(emp_id), 이름(emp_name)을 조회.
select emp_id as ID,
	   emp_name as 이름
from emp
where emp_name like 'S%';
-- '%' : 0글자 이상의 모든 글자들.
	-- ex) 'Sha%' Sha다음에 뭐가 오든 상관없다. 아무것도 안와도됨.
	-- '%Sha%' 앞뒤로 뭐가 와도 상관없이 Sha를 포함하는 것들. Sha로 시작하든 끝나는 상관없다.
-- '_' : 한글자의 모든 글자.
	-- '_A__B_C': ABC가 쓰인 자리외엔 뭐가 오든 상관없이 한글자가 있으면된다.



#######################
-- EMP 테이블에서 직원 이름(emp_name)의 세 번째 문자가 “e”인 모든 사원의 이름을 조회
select emp_name as "직원 이름"
from emp
where emp_name like '__e%';


#######################
-- EMP 테이블에서 직원의 이름에 '%' 가 들어가는 직원의 ID(emp_id), 직원이름(emp_name) 조회
--    %나 _ 를 검색하는 값으로 사용할 경우.
-- 일단 이름에 %가 들어가는 경우를 찾으려면 앞뒤로 % 붙이고
-- 당해 %에 아무 문자를 붙인 뒤 escape라고 언급해준다.
select emp_id as ID,
	   emp_name as 직원이름
from emp
where emp_name like '%!%%' escape '!';   -- !는 내가 선택하는 것.


#######################
-- EMP 테이블에서 부서명(dept_name)이 null인 직원의 ID(emp_id), 이름(emp_name), 부서명(dept_name)을 조회.
select emp_id as ID,
	   emp_name as 이름,
       dept_name as 부서명
from emp
where dept_name is null;
-- where dept_name = null; 라고 쓰면 안돼! 조회가 안된다. 에러가 뜨지도 않음.


#######################
-- EMP 테이블에서 커미션이 있는(comm_pct가 null이 아닌)  직원들을 모든 컬럼값들을 조회
select *
from emp
where comm_pct is not null;



#######################
-- EMP 테이블에서 업무(job)가 'IT_PROG'인 직원들의 모든 컬럼값들을 조회. 
select *
from emp
where job = 'IT_PROG';


#######################
-- EMP 테이블에서 2004년에 입사한 직원들의 ID(emp_id), 이름(emp_name), 입사일(hire_date)을 조회.
-- 참고: date/datatime에서 년도만 추출: year(컬럼명) <- 이함수를 사용해보자 cf. month() 등도 있다.
select emp_id as ID,
	   emp_name as 이름,
       hire_date as 입사일
from emp
where year(hire_date) = 2004;
-- where hire_date between '2004-01-01' and '2004-12-31'; 위의 내용과 같은 것



#######################
-- EMP 테이블에서 연봉(salary * 12) 이 200,000 이상인 직원들의 모든 정보를 조회.
select * from emp
where (salary *12) >= 200000;



/* ******************************************
 WHERE 조건이 여러개인 경우 AND 나 OR 로 조건들을 묶어준다.
 
 AND: 두 조건이 모두 True인 행만 조회
 OR: 두 조건 중 하나이상이 True인 행을 조회
 
 연산 우선순위: AND > OR
 	where 조건1 and 조건2 or 조건3
	  1. 조건 1 and 조건2
	  2. 1결과 or 조건3
 
 or를 먼저 하려면 where 조건1 and (조건2 or 조건3)
 *******************************************/
 
-- EMP 테이블에서 'SA_REP' 업무를 담당하는 직원들 중 급여(salary)가 $9,000인 직원의 직원의 ID(emp_id), 이름(emp_name), 업무(job), 급여(salary)를 조회.
select emp_id,
       emp_name,
	   job,
       salary
from emp
where job='SA_REP' and salary = 9000;


#######################
-- EMP 테이블에서 업무(job)가 'FI_ACCOUNT' 거나 급여(salary)가 $8,000 이상인 직원의 ID(emp_id), 이름(emp_name), 업무(job), 급여(salary)를 조회.
select emp_id,
       emp_name,
	   job,
       salary
from emp
where job = 'FI_ACCOUNT' or salary >= 8000;


#######################
-- EMP 테이블에서  'Sales' 부서 직원 중 업무(job)가 'SA_MAN' 이고 급여가 $13,000 이하인 모든 정보를 조회
select * from emp
where dept_name = 'Sales' -- and 내려써도 상관없음
and job = 'SA_MAN' 
and salary <= 13000;
-- =<는 안됨. 부등호가 먼저 와야한다.


#######################
-- EMP 테이블에서 업무(job)에 'MAN'이 들어가는 직원들 중에서 부서(dept_name)가 'Shipping' 이고 2005년이후 입사한 
--           직원들의 ID(emp_id), 이름(emp_name), 업무(job), 입사일(hire_date),부서(dept_name)를 조회
select emp_id,
	   emp_name,
       job,
       hire_date,
       dept_name
from emp
where job like '%MAN%' 
and dept_name = 'Shipping' 
and year(hire_date) >= 2005;
	-- hire_date >= 2005-01-01

#######################
-- EMP 테이블에서 업무(job)에 'MAN'이 들어가는 직원들 중에서 'Marketing' 이나 'Sales' 부서에 소속된 직원들의 ID(emp_id), 이름(emp_name), 업무(job), 부서(dept_name)를 조회
select emp_id,
	   emp_name,
       job,
       dept_name
from emp
where job like "%MAN%"
and dept_name in ('Marketing', 'Sales');
	-- whrer job like '%MAN%' and (dept_name = 'Marketing' or dept_name = 'Sales')  괄호 안묶으면 우선순위에 의해 and 먼저 거른다!

/* *******************************************************************
order by를 이용한 정렬
- order by절은 select문의 마지막 구문으로 온다.
- order by 정렬기준컬럼 정렬방식 [, ...]
    - 정렬기준컬럼 지정 단위: 컬럼이름, 컬럼의순번(select절의 선언 순서)
     `select salary, hire_date from emp ...` 에서 salary 컬럼 기준 정렬을 설정할 경우. 
     `order by salary 또는 order by 1` 로 작성.
	 
    - 정렬방식
        - ASC : 오름차순, 기본방식(생략가능)
        - DESC : 내림차순
		
문자열 오름차순 : 숫자 -> 대문자 -> 소문자 -> 한글     
Date 오름차순 : 과거 -> 미래
null 오름차순 : null이 먼저 나온다.  GUIDE: 오라클은 반대.

ex)
order by salary asc, emp_id desc
- salary로 전체 정렬을 하고 salary가 같은 행은 emp_id로 정렬.
******************************************************************* */

--  직원들의 전체 정보를 직원 ID(emp_id)가 큰 순서대로 정렬해 조회
select * from emp
order by emp_id desc;


#######################
--  직원들의 id(emp_id), 이름(emp_name), 업무(job), 급여(salary)를 
--  업무(job) 순서대로 (A -> Z) 조회하고 업무(job)가 같은 직원들은 급여(salary)가 높은 순서대로 2차 정렬해서 조회.
select emp_id,
	   emp_name,
       job,
       salary
from emp
order by job asc, salary desc;



#######################
-- 부서명을 부서명(dept_name)의 오름차순으로 정렬해 조회하시오.
select dept_name from emp
order by dept_name;  -- asc는 생략가능. null이 가장 먼저 나옴을 확인.


#######################
-- 급여(salary)가 $5,000을 넘는 직원의 ID(emp_id), 이름(emp_name), 급여(salary)를 급여가 높은 순서부터 조회
select emp_id, emp_name, salary
from emp
where salary > 5000
-- order by salary desc;
order by 3 desc;  -- 내가 select한 컬럼 중 3번째 것을 기준으로 정렬하란 의미.

-- 2개 위의 내용도 숫자로 정렬해보자
select emp_id,
	   emp_name,
       job,
       salary
from emp
-- order by job asc, salary desc;
order by 3 asc, 4 desc;

