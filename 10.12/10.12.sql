DROP DATABASE mall;

CREATE DATABASE mall;

USE mall;

CREATE TABLE t_shopping(
id INT(5) PRIMARY KEY AUTO_INCREMENT,
userId CHAR(30) NOT NULL,
userPw CHAR(30) NOT NULL,
userName CHAR(30) NOT NULL,
address CHAR(50) NOT NULL,
pname CHAR(50) NOT NULL,
price INT(5) NOT NULL
);

INSERT INTO t_shopping 
SET userId = 'user1',
userPw = 'pass1',
userName = '손흥민',
address = '런던',
pname = '운동화',
price = 1000000;

INSERT INTO t_shopping 
SET userId = 'user2',
userPw = 'pass2',
userName = '설현',
address = '서울',
pname = '코트',
price = 100000;

INSERT INTO t_shopping 
SET userId = 'user3',
userPw = 'pass3',
userName = '원빈',
address = '대전',
pname = '반바지',
price = 30000;

INSERT INTO t_shopping 
SET userId = 'user4',
userPw = 'pass4',
userName = '송혜교',
address = '대구',
pname = '스커트',
price = 15000;

INSERT INTO t_shopping 
SET userId = 'user5',
userPw = 'pass5',
userName = '소지섭',
address = '부산',
pname = '코트',
price = 100000;

INSERT INTO t_shopping 
SET userId = 'user6',
userPw = 'pass6',
userName = '김지원',
address = '울산',
pname = '티셔츠',
price = 9000;

INSERT INTO t_shopping 
SET userId = 'user6',
userPw = 'pass6',
userName = '김지원',
address = '울산',
pname = '운동화',
price = 200000;

INSERT INTO t_shopping 
SET userId = 'user1',
userPw = 'pass1',
userName = '손흥민',
address = '런던',
pname = '코트',
price = 100000;

INSERT INTO t_shopping 
SET userId = 'user4',
userPw = 'pass4',
userName = '송혜교',
address = '울산',
pname = '스커트',
price = 15000;

INSERT INTO t_shopping 
SET userId = 'user1',
userPw = 'pass1',
userName = '손흥민',
address = '런던',
pname = '운동화',
price = 1000000;

INSERT INTO t_shopping 
SET userId = 'user5',
userPw = 'pass5',
userName = '소지섭',
address = '부산',
pname = '모자',
price = 30000;

CREATE TABLE `product`(
id INT PRIMARY KEY AUTO_INCREMENT
, pname CHAR(100) NOT NULL
, price INT NOT NULL
, brand CHAR(100) NOT NULL
);

CREATE TABLE `user`(
id INT PRIMARY KEY AUTO_INCREMENT
, userId CHAR(200) NOT NULL
, userPw CHAR(200) NOT NULL
, userName CHAR(100) NOT NULL
, addr CHAR(200) NOT NULL
);

CREATE TABLE `order`(
id INT PRIMARY KEY AUTO_INCREMENT
, userId CHAR(200) NOT NULL
, productId INT NOT NULL
);

SELECT * FROM `product`;
SELECT * FROM `user`;
SELECT * FROM `order`;

INSERT INTO `product`
( pname, price, brand) VALUES('운동화', 1000000, '나이키');
INSERT INTO `product`
( pname, price, brand) VALUES('코트', 100000, '버버리');
INSERT INTO `product`
( pname, price, brand) VALUES('스커트', 15000, '자라');
INSERT INTO `product`
( pname, price, brand) VALUES('티셔츠', 9000, '지오다노');
INSERT INTO `product`
( pname, price, brand) VALUES('운동화', 200000, '아디다스');
INSERT INTO `product`
( pname, price, brand) VALUES('코트', 100000, '톰보이');
INSERT INTO `product`
( pname, price, brand) VALUES('스커트', 30000, '크로커다일');
INSERT INTO `product`
( pname, price, brand) VALUES('반바지', 30000, '유니클로');

INSERT INTO `user`
( userId, userPw, userName, addr) VALUES('user1', 'pass1', '손흥민', '런던');
INSERT INTO `user`
( userId, userPw, userName, addr) VALUES('user2', 'pass2', '설현', '서울');
INSERT INTO `user`
( userId, userPw, userName, addr) VALUES('user3', 'pass3', '원빈', '대전');
INSERT INTO `user`
( userId, userPw, userName, addr) VALUES('user4', 'pass4', '송혜교', '대구');
INSERT INTO `user`
( userId, userPw, userName, addr) VALUES('user5', 'pass5', '소지섭', '부산');
INSERT INTO `user`
( userId, userPw, userName, addr) VALUES('user6', 'pass6', '김지원', '울산');

INSERT INTO `order`
( userId, productId) VALUES('user1', 1);
INSERT INTO `order`
( userId, productId) VALUES('user2', 2);
INSERT INTO `order`
( userId, productId) VALUES('user3', 8);
INSERT INTO `order`
( userId, productId) VALUES('user4', 3);
INSERT INTO `order`
( userId, productId) VALUES('user5', 6);
INSERT INTO `order`
( userId, productId) VALUES('user6', 4);
INSERT INTO `order`
( userId, productId) VALUES('user6', 5);
INSERT INTO `order`
( userId, productId) VALUES('user1', 7);
# 1. 손흥민의 주문 개수는? ???
SELECT * FROM `product`;
SELECT * FROM `user`;
SELECT * FROM `order`;

SELECT COUNT(*) 
FROM `order`
WHERE userId = `user1`;


# 2. 손흥민이 산 상품은? ???
SELECT p.pname, p.price 
FROM `order` o
JOIN `product` p ON o.productId = p.id 
WHERE o.userId = 'user1';


# 3. 스커트를 산 사람은? ???
SELECT DISTINCT o.userId, u.userName 
FROM `order` o
JOIN `product` p ON o.productId = p.id 
JOIN `user` u ON o.userId = u.userId 
WHERE p.pname = '스커트';



# 4. 가장 많이 주문한 사람의 아이디와 이름, 주문개수는? ???
SELECT o.userId, u.userName, COUNT(*) AS order_count 
FROM `order` o
JOIN `user` u ON o.userId = u.userId 
GROUP BY o.userId 
ORDER BY order_count DESC 
LIMIT 1;



# 5. 소지섭이 사용한 총 금액은? ???
SELECT SUM(p.price) AS total_amount 
FROM `order` o
JOIN `product` p ON o.productId = p.id 
WHERE o.userId = 'user5';
