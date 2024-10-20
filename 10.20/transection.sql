# 트랜잭션 예제

# 트랜잭션이란? - 하나의 업무단위를 뜻함. 하나의 업무에 사용되는 다수의 query는 모두 성공하거나 모두 실패해야한다는 뜻.

# 데이터의 무결성을 보장하기 위함.

DROP DATABASE IF EXISTS t1;
CREATE DATABASE t1;
USE t1;

CREATE TABLE ACCOUNT(
accountNo INT PRIMARY KEY AUTO_INCREMENT,
amount INT NOT NULL
);

DELETE FROM ACCOUNT;

INSERT INTO ACCOUNT SET amount = 20000;
INSERT INTO ACCOUNT SET amount = 10000;

SELECT \* FROM ACCOUNT;

SELECT @@autocommit;
SET autocommit = 1;

# 1 -> 2로 10000원 계좌 이체 #트랜잭션 시작

START TRANSACTION;

# 1의 계좌에 10000원 감소

UPDATE ACCOUNT
SET amount = amount - 10000
WHERE accountNo = 1;

SELECT \* FROM ACCOUNT;

# 만일 여기서 어떤 이유로 작업이 중단된다면

# 1의 계좌에서 10000원이 감소된 상태로 처리가 끝내가 되고, 2는 10000원을 받지 못하게 된다.

ROLLBACK; # 만일 여기서 문제가 생기면 START TRANSACTION 부분으로 모든 작업을 되돌린다.

SELECT \* FROM ACCOUNT;

# 2의 계좌에 20000원 증가

UPDATE ACCOUNT
SET amount = amount + 10000
WHERE accountNo = 2;

COMMIT; # 여기까지 문제 없이 진행되면 START TRANSACTION ~ COMMIT 사이에 있는 모든 내용을 DB에 반영한다. 그렇지 않고 도중에 작업이 중단되면 중단된 시점에 처음으로 ROLLBACK을 수행한다.

SELECT \* FROM ACCOUNT;

#################################

# 트랜잭션 시작 2

START TRANSACTION;

# 세이브포인트1

SAVEPOINT svpt1;

#

UPDATE `account`
SET amount = 2
WHERE accountNo = 2;

# 세이브포인트2

SAVEPOINT svpt2;

UPDATE `account`
SET amount = 1
WHERE accountNo = 1;

# 세이브포인트3

SAVEPOINT svpt3;

SELECT \* FROM ACCOUNT;

ROLLBACK TO svpt1;

ROLLBACK TO svpt2;

ROLLBACK TO svpt3;

COMMIT;
