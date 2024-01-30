CREATE TABLE BOOK_MEMBER(
  memberId VARCHAR2(50),
  memberPw VARCHAR2(100) NOT NULL,
  memberName VARCHAR2(30) NOT NULL,
  memberMail VARCHAR2(100) NOT NULL,
  memberAddr1 VARCHAR2(100) NOT NULL,
  memberAddr2 VARCHAR2(100) NOT NULL,
  memberAddr3 VARCHAR2(100) NOT NULL,
  adminCk NUMBER NOT NULL,
  regDate DATE NOT NULL,
  money number NOT NULL,
  point number NOT NULL,
  PRIMARY KEY(memberId)
);
select  * from book_member;

-- 회원가입 쿼리(Oracle)
insert into book_member values('admin23', 'admin', 'admin', 'admin', 'admin', 'admin', 'admin', 1, sysdate, 1000000, 1000000);

-- 관리자 계정 생성
UPDATE book_member SET adminck = 1 where memberid = 'admin';

-- 국가 테이블 생성
create table vam_nation(
   nationId varchar2(2) primary key,
    nationName varchar2(50)
);
 
-- 국가 테이블 데이터 삽입
insert into vam_nation values ('01', '국내');
insert into vam_nation values ('02', '국외');
 
-- 작가 테이블 생성
create table vam_author(
    authorId number generated as identity (start with 1) primary key,
    authorName varchar2(50),
    nationId varchar2(2),
    authorIntro long,
    foreign key (nationId) references vam_nation(nationId)
);

alter table vam_author add regDate date default sysdate;
alter table vam_author add updateDate date default sysdate;

insert into vam_author(authorName, nationId, authorIntro) values('유홍준', '01', '작가 소개입니다' );
insert into vam_author(authorName, nationId, authorIntro) values('김난도', '01', '작가 소개입니다' );
insert into vam_author(authorName, nationId, authorIntro) values('폴크루그먼', '02', '작가 소개입니다' );

delete from vam_author;
 
    ALTER TABLE vam_author MODIFY(authorId GENERATED AS IDENTITY (START WITH 1));
 
    insert into vam_author(authorName, nationId, authorIntro) values('유홍준', '01', '작가 소개입니다' );
    insert into vam_author(authorName, nationId, authorIntro) values('김난도', '01', '작가 소개입니다' );
    insert into vam_author(authorName, nationId, authorIntro) values('폴크루그먼', '02', '작가 소개입니다' );
 
    select * from vam_author;

select * from USER_INDEXES;
--재귀 복사
insert into vam_author(authorname, nationid)(select authorname, nationid from vam_author);

-- Oracle
-- 상품 테이블 
create table vam_book(
    bookId number generated as identity (start with 1) primary key,
    bookName varchar2(50)   not null,
    authorId number,
    publeYear Date not null,
    publisher varchar2(70) not null,
    cateCode varchar2(30),
    bookPrice number not null,
    bookStock number not null,
    bookDiscount number(2,2),
    bookIntro clob,
    bookContents clob,
    regDate date default sysdate,
    updateDate date default sysdate
);

-- Oracle
-- 카테고리 테이블
create table vam_bcate(
    tier number(1) not null,
    cateName varchar2(30) not null,
    cateCode varchar2(30) not null,
    cateParent varchar2(30) ,
    primary key(cateCode),
    foreign key(cateParent) references vam_bcate(cateCode) 
);

-- 데이터 삽입
insert into vam_bcate(tier, cateName, cateCode) values (1, '국내', '100000');
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '소설', '101000','100000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '한국소설', '101001','101000');
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '영미소설', '101002','101000');
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '일본소설', '101003','101000');
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '시/에세이', '102000','100000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '한국시', '102001','102000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '해외시', '102002','102000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '경제/경영', '103000','100000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '경영일반', '103001','103000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '경영이론', '103002','103000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '경제일반', '103003','103000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '경제이론', '103004','103000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '자기계발', '104000','100000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '성공/처세', '104001','104000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '자기능력계발', '104002','104000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '인간관계', '104003','104000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '인문', '105000','100000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '심리학', '105001','105000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '교육학', '105002','105000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '철학', '105003','105000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '역사/문화', '106000','100000');
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '역사일반', '106001','106000');
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '세계사', '106002','106000');
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '한국사', '106003','106000');
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '과학', '107000','100000');
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '과학이론', '107001','107000');
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '수학', '107002','107000');
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '물리학', '107003','107000');
insert into vam_bcate(tier, cateName, cateCode) values (1, '국외', '200000');
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '문학', '201000','200000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '소설', '201001','201000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '시', '201002','201000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '희곡', '201003','201000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '인문/사회', '202000','200000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '교양', '202001','202000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '철학', '202002','202000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '경제/경영', '203000','200000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '경제학', '203001','203000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '경영학', '203002','203000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '투자', '203003','203000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '과학/기술', '204000','200000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '교양과학', '204001','204000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '물리학', '204002','204000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '수학', '204003','204000');

select * from VAM_BOOK;

alter table vam_book add foreign key (authorId) references vam_author(authorId);
alter table vam_book add foreign key (cateCode) references vam_bcate(cateCode);

--재귀 복사
insert into vam_book(bookName, authorId, publeYear, publisher, cateCode, bookPrice, bookStock, bookDiscount,bookIntro, bookContents)
(select bookName, authorId, publeYear, publisher, cateCode, bookPrice, bookStock, bookDiscount,bookIntro, bookContents from vam_book);

SELECT * FROM USER_INDEXES WHERE TABLE_NAME = 'VAM_BOOK';

commit;

 select /*+INDEX_DESC(vam_book SYS_C008337)*/ rownum as rn, bookId, bookName,
		        (select authorName from vam_author where vam_book.authorId = vam_author.authorId) authorName,
		        (select cateName from vam_bcate where vam_book.cateCode = vam_bcate.cateCode) cateName,bookStock,regDate
		    from vam_book ;

--이미지 테이블            
create table vam_image(
        bookId int ,
        fileName varchar2(100) not null,
        uploadPath varchar2(200) not null,
        uuid varchar2(100)not null ,
        primary key (uuid),
        foreign key (bookId) references vam_book(bookId)
    );
    
Select TABLE_NAME, COLUMN_NAME, DATA_DEFAULT from USER_TAB_COLUMNS
where TABLE_NAME = 'VAM_BOOK';

SELECT ISEQ$$_77154.NEXTVAL FROM dual;

SELECT ISEQ$$_77154.CURRVAL FROM dual;

delete from vam_image;

insert into vam_image values (324, '인스타.png', '2021\07\25', 'test1');
insert into vam_image values (324, '애플.png', '2021\07\25', 'test2');

insert into vam_image values (324, '인스타.png', '2024\01\25', 'test01');
insert into vam_image values (324, '애플.png', '2024\01\25', 'test02'); 

commit;