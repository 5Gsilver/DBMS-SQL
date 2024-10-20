DROP DATABASE IF EXISTS i1;

CREATE DATABASE i1;

USE i1;

# 회원 -> 아이디, 비밀번호, 이름

CREATE TABLE `member` (
  loginId VARCHAR(30),
  loginPw VARCHAR(30),
  nickname VARCHAR(30)
);

SELECT *
FROM `member`;

# 테스트 데이터 1, user1, pass1, 김철수
# 테스트 데이터 2, user2, pass2, 이현철

INSERT INTO `member`
SET loginId = 'user1',
loginPw = 'pass1',
nickname = '김철수';

INSERT INTO `member`
SET loginId = 'user2',
loginPw = 'pass2',
nickname = '이현철';

# 랜덤 유저 만들기
INSERT INTO `member`
SELECT CONCAT('user_', SUBSTR(UUID(), 1, 8)), 'pass3', '익명' FROM `member`;

SELECT SQL_NO_CACHE *
FROM `member`
WHERE loginId = 'user2';

SELECT SQL_NO_CACHE *
FROM `member`
WHERE nickname = '이현철';

# loginId에 인덱스 걸기
CREATE INDEX loginId_index ON `member`(loginId);


# 인덱스를 걸기 좋은 컬럼
# PK는 무조건 인덱스가 생성됨.
# 중복값이 최대한 적은 (없는게 가장 좋음) 컬럼 선택
# where에 자주 언급되는 컬럼
# 삽입, 삭제가 거의 일어나지 않는 테이블

# SQL 전문가, DB 전문가
# 개발자들도 테이블 검색 하니까 인덱스 개념을 알아두고 사용하자.

DESC `member`;

# 조인 > 서브쿼리 -> 조인은 인덱스 타고, 서브쿼리는 안탄다.

EXPLAIN SELECT SQL_NO_CACHE *
FROM `member`
WHERE loginId = 'user2';

EXPLAIN SELECT SQL_NO_CACHE *
FROM `member`
WHERE nickname = '이현철';
