create user 'nggw519'@'localhost' identified by '1111';
create user 'nggw519'@'%' identified by '1111';

-- 00_ddl.sql
-- 생성된 계정 확인하기
select user, host from mysql.user;
-- 하단에 생겨난 창에서 user가 생겨난걸 확인할 수 있다.

-- 계정에 권한을 부여
-- grant [부여할 권한] on [대상 테이블] to [권한을 부여할 계정]
grant all privileges on *.* to nggw519@localhost;
grant all privileges on *.* to nggw519@'%';
-- *.* : 앞의 *는 DB를 가리킴 뒤의 *는 table을 가리킴. 즉 모든 대상에 대해 권한을 부여한다는 의미


-- SQL문 작성할 때 한 명령문이 끝나면 ; 으로 종료해야한다.
-- 실행: ctrl + enter
-- 한 줄 주석
# 한 줄 주석
/*
block 주석
*/

-- 데이터베이스를 먼저 만들고, 그안에 테이블을 만들고, 그 테이블을 채우는 식으로 데이터를 생성한다.
#############################
# DB 생성하기
#############################
create database test_db;
create database hr;
create database my_db;
show databases;

#############################
#DB 삭제하기
#############################
drop database hr;
drop database my_db;

#############################
# 자주쓰는 특정 DB가 있는경우
# 앞으로 내가 테이블에 말하면, 이건 test_db에 있는걸 쓴다는 의미야! 라는 것
#############################
use test_db;
-- table 이름 => test_db db의 테이블.
-- sys.sys_config => test_db에서 작업하다가 잠시 다른 db의 테이블 호출할땐, db이름.테이블이름
-- 접속전에 계정 들어가기전에 계정에 마우스 우클릭하여 edit connection을 이용해서 디폴트로서 DB를 설정할 수도 있다.

#############################
# 테이블 생성
#############################
-- create table test_db.member();   ->기본적으론 이렇게 작성한다. but test_db 자꾸쓰기 귀찮아서 use를 쓰자
use test_db;
create table member(
	id varchar(10) primary key, -- tab으로 띄워 가독성 높임(필수는 아니다), 최대 10글자
    password varchar(10) not null, -- not null은 당해 컬럼에 대한 값은 필수입력하라는 소리
    name varchar(50) not null, 
    point int default 1000, -- not null이 없으므로 값을 넣지 않으면 null값을 허용하는데, 디폴트를 설정하여 값을 넣지 않으면 1000을 기본값으로 가진다. null을 넣는다면 디폴트가 아닌 그냥 null값을 가짐
    email varchar(100) not null unique, -- unique는 중복값을 허용하지 않음
	age int check(age>20), -- not null이 아니니까 나이는 생략할 수 있음
    join_date timestamp not null default current_timestamp -- default current_timestamp: 값이 insert되는 시점을 디폴트로서 알아서 저장하도록함. datetime은 이렇게 쓸 수 없다.
);

#############################
# 테이블 조회
#############################
-- 테이블 조회
show tables;
-- 테이블 컬럼정보 조회
desc member; -- member라는 테이블의 컬럼을 조회하기. null의 yes는 null값을 허용한다는 것
-- 테이블 삭제. 없는 테이블 이름을 삭제하라고하면 에러난다. 이때 if exsists를 넣어 에러가 안나고 경고만 나게함.
drop table if exists aaaa;
drop table if exists member;

#############################
# insert 해보기
#############################
-- 모든 컬럼에 값을 다 넣을 경우 컬럼명 생략함
insert into member values ('id-100', '1111', '이순신', 5000, 'lee@aa.com', 30, '2023-12-10 11:22:33');
-- 위 코드를 한번 더 실행하면 error. 왜냐하면 id-100이 이미 저장됐는데 또 저장해서 primary key에 위배되기 때문.

-- point, join_date는 디폴트넣고, age는 null이 나오도록하기
insert into member (id, password, name, email) values ('id-200', '2222', '유관순', 'ryu@aa.com');

-- point는 not null이 아니므로 null을 따로 넣어주면 디폴트 대신 null이 들어간다.
insert into member (id, password, name, point, email) values ('id-300', '3333', '강감찬', null, 'kang@aa.com');

-- age는 >20 조건이 있다. 5를 넣으면 error나옴 확인
insert into member (id, password, name, email, age) values ('id-400', '4444', '왕건', 'wang@aa.com', 5);

-- 조회하기. 아래의 *는 컬럼명 자리인데, *썼으므로 모든 컬럼명을 말함
select * from member; -- 디폴트와 null이 들어간걸 확인
