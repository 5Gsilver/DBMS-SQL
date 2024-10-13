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