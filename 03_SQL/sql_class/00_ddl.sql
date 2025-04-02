create user 'nggw519'@'localhost' identified by '1111';
create user 'nggw519'@'%' identified by '1111';

-- 생성된 계정 확인하기
select user, host from mysql.user;
-- 하단에 생겨난 창에서 user가 생겨난걸 확인할 수 있다.

-- 계정에 권한을 부여
-- grant [부여할 권한] on [대상 테이블] to [권한을 부여할 계정]
grant all privileges on *.* to nggw519@lacalhost;
grant all privileges on *.* to nggw519@'%';
-- *.* : 앞의 *는 DB를 가리킴 뒤의 *는 table을 가리킴. 즉 모든 대상에 대해 권한을 부여한다는 의미


-- SQL문 작성할 때 한 명령문이 끝나면 ; 으로 종료해야한다.
-- 실행: ctrl + enter
-- 한 줄 주석
# 한 줄 주석
/* block 주석 */