CREATE DATABASE Project_Baskin_mysql;
USE Project_Baskin_mysql;

CREATE TABLE product(
	product_number INT PRIMARY KEY AUTO_INCREMENT,
	product_name VARCHAR(20),
	product_stock INT,			/*재고량*/
	product_sold INT,			/*판매량*/
	product_regdate DATE,		/*등록날짜*/
	product_info1 INT,			/*1회 제공량*/
	product_info2 INT,			/*열량(kcal)*/
	product_info3 INT,			/*당류(g)*/
	product_info4 INT,			/*단백질(g)*/
	product_info5 INT,			/*포화지방(g)*/
	product_info6 INT,			/*나트륨(mg)*/
	product_info7 VARCHAR(30),	/*알레르기 성분*/
	product_image VARCHAR(40),				
	product_contentimage1 VARCHAR(50),
	product_contentimage2 VARCHAR(50),
	product_contentimage3 VARCHAR(50)
);
select * from product;

INSERT INTO product VALUES(0, '엄마는 외계인', 100, 0, '2024-06-17', 115, 296, 23, 5, 11, 114, '우유, 대두, 밀', 'iceCream_img/main/0.png', 'iceCream_img/detail/0/1.PNG', 'iceCream_img/detail/0/2.png', 'iceCream_img/detail/0/3.PNG');
INSERT INTO product VALUES(0, '아몬드 봉봉', 100, 0, '2024-06-17', 115, 312, 26, 5, 8, 94, '우유, 대두', 'iceCream_img/main/1.png', 'iceCream_img/detail/1/1.PNG', 'iceCream_img/detail/1/2.png', 'iceCream_img/detail/1/3.PNG');
INSERT INTO product VALUES(0, '민트 초콜릿칩', 100, 0, '2024-06-17', 115, 259, 23, 4, 9, 81, '우유, 대두', 'iceCream_img/main/2.png', 'iceCream_img/detail/2/1.PNG', 'iceCream_img/detail/2/2.png', 'iceCream_img/detail/2/3.PNG');
INSERT INTO product VALUES(0, '슈팅스타', 100, 0, '2024-06-17', 115, 260, 27, 3, 7, 65, '우유, 대두, 밀', 'iceCream_img/main/3.png', 'iceCream_img/detail/3/1.PNG', 'iceCream_img/detail/3/2.png', 'iceCream_img/detail/3/3.PNG');
INSERT INTO product VALUES(0, '체리쥬빌레', 100, 0, '2024-06-17', 115, 239, 28, 3, 7, 48, '우유', 'iceCream_img/main/4.png', 'iceCream_img/detail/4/1.PNG', 'iceCream_img/detail/4/2.png', 'iceCream_img/detail/4/3.PNG');
INSERT INTO product VALUES(0, '바람과 함께 사라지다', 100, 0, '2024-06-17', 115, 269, 25, 4, 8, 95, '우유, 대두, 밀, 계란', 'iceCream_img/main/5.png', 'iceCream_img/detail/5/1.PNG', 'iceCream_img/detail/5/2.png', 'iceCream_img/detail/5/3.PNG');
INSERT INTO product VALUES(0, '뉴욕 치즈케이크', 100, 0, '2024-06-17', 115, 295, 23, 6, 10, 102, '우유, 대두, 밀', 'iceCream_img/main/6.png', 'iceCream_img/detail/6/1.PNG', 'iceCream_img/detail/6/2.png', 'iceCream_img/detail/6/3.PNG');
INSERT INTO product VALUES(0, '오레오 쿠키앤크림', 100, 0, '2024-06-17', 115, 228, 18, 5, 8, 127, '우유, 대두, 밀', 'iceCream_img/main/7.png', 'iceCream_img/detail/7/1.PNG', 'iceCream_img/detail/7/2.png', 'iceCream_img/detail/7/3.PNG');

SELECT * FROM product;

CREATE TABLE productMenu(
	productMenu_number INT PRIMARY KEY AUTO_INCREMENT,
	productMenu_selectSize INT,
	productMenu_price INT
);

INSERT INTO productMenu VALUES(0, 0, 3900);		/*싱글레귤러*/
INSERT INTO productMenu VALUES(0, 1, 4700);		/*싱글킹*/
INSERT INTO productMenu VALUES(0, 2, 5100);		/*더블주니어*/
INSERT INTO productMenu VALUES(0, 3, 7300);		/*더블레귤러*/
INSERT INTO productMenu VALUES(0, 4, 9800);		/*파인트*/
INSERT INTO productMenu VALUES(0, 5, 18500);	/*쿼터*/
INSERT INTO productMenu VALUES(0, 6, 26000);	/*패밀리*/
INSERT INTO productMenu VALUES(0, 7, 31500);	/*하프갤런*/

SELECT * FROM productMenu;

CREATE TABLE cart(
	cart_number INT PRIMARY KEY AUTO_INCREMENT,
	cart_buyer VARCHAR(20),
	cart_selectSize INT,
	cart_buycount INT,
	cart_productNumber INT
);

SELECT * FROM cart;

CREATE TABLE ordermenu(
	order_number INT PRIMARY KEY AUTO_INCREMENT,
	order_deliverynumber INT,
	order_productNumber INT,
	order_selectSize INT,
	order_buycount INT,
	order_buyer VARCHAR(20)
);

SELECT * FROM ordermenu;

CREATE TABLE admin (
	admin_id VARCHAR(20) PRIMARY KEY
    ,admin_pw VARCHAR(20)
    ,admin_name VARCHAR(20)
    ,admin_email VARCHAR(20)
);
INSERT INTO admin VALUES('admin', 'admin', '관리자', 'admin@naver.com');
SELECT * FROM admin;

CREATE TABLE member (
	member_number INT PRIMARY KEY AUTO_INCREMENT 
	,member_id VARCHAR(20)
    ,member_pw VARCHAR(20)
    ,member_name VARCHAR(20)
    ,member_email VARCHAR(20)
    ,member_phone VARCHAR(20)
    ,member_addr1 VARCHAR(20)
    ,member_addr2 VARCHAR(50)
    ,member_addr3 VARCHAR(50)
    ,member_gender INT
    ,member_marketing INT
);
INSERT INTO member VALUES(0, 'qwer1234', 'Qwer1234!', '홍길동', 'qwer@naver.com', '01012345678', '02830', '서울 성북구 아리랑로 3', '100동 209호', 1, 1);
INSERT INTO member VALUES(0, 'abcd1234', 'Abcd1234!', '김수정', 'abcd@naver.com', '01012345678', '02830', '서울 성북구 아리랑로 3', '100동 209호', 1, 0);
INSERT INTO member VALUES(0, 'hello1234', 'Hello1234!', '박철수', 'hello@naver.com', '01012345678', '02830', '서울 성북구 아리랑로 3', '100동 209호', 1, 1);
SELECT * FROM member;



-- 로그인
SELECT * FROM member WHERE member_id = 'qwer1234' AND member_pw = 'Qwer1234!';

-- 회원가입
INSERT INTO member (member_id, member_pw, member_name, member_email, member_phone, member_addr1, member_addr2, member_addr3, member_gender, member_route, member_marketing) 
VALUES('test1234', 'Test1234!', '고유동', 'test@naver.com', '0102345678', '02830', '서울 성북구 아리랑로 3', '100동 209호', 1, 1, 0);

-- 아이디 중복 검사
SELECT * FROM member WHERE member_id = 'sdefd2';
-- 이메일 중복 검사
SELECT * FROM member WHERE member_email = 'sdefd2@naver.com';


SELECT max(delivery_number) from delivery;

SELECT * FROM board ORDER BY board_ref DESC , board_level ASC;


SELECT MAX(board_ref) FROM board;


SELECT * FROM board;


CREATE TABLE board (
	board_number INT PRIMARY KEY AUTO_INCREMENT
    ,board_writer VARCHAR(20)
    ,board_subject VARCHAR(50)
    ,board_content VARCHAR(500)
    ,board_date VARCHAR(20)
    ,board_readcount INT
    ,board_ref INT
    ,board_step INT
    ,board_level INT
    ,board_remove INT
);
INSERT INTO board VALUES(0, '작성자01', '제목01', '내용01', '2024-05-01 10:30:21', 0, 1, 1, 1, 0);
INSERT INTO board VALUES(0, '작성자02', '제목02', '내용02', '2024-05-02 11:30:21', 0, 2, 1, 1, 0);
INSERT INTO board VALUES(0, '작성자03', '제목03', '내용03', '2024-05-03 12:30:21', 0, 3, 1, 1, 0);

INSERT INTO board VALUES(0, '작성자04', '제목04', '내용04', now(), 0, 4, 1, 1, 0);

UPDATE board SET board_remove = 1 WHERE board_number = 1;

SELECT * FROM board;

SELECT * FROM board WHERE board_number = 1;

CREATE TABLE boardimage (
	 boardimage_number INT PRIMARY KEY AUTO_INCREMENT
    ,boardimage_boardnumber INT
    ,boardimage_name VARCHAR(20)
);

SELECT * FROM boardimage;


create table customList(
   
    custom_number int auto_increment primary key,
   custom_name varchar(50),
    custom_imageFileName varchar(50),
    custom_description varchar(50),
    custom_userId varchar(50),
    custom_regDate date
    
)auto_increment=101;
select * from customList





