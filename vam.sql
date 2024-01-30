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

-- ȸ������ ����(Oracle)
insert into book_member values('admin23', 'admin', 'admin', 'admin', 'admin', 'admin', 'admin', 1, sysdate, 1000000, 1000000);

-- ������ ���� ����
UPDATE book_member SET adminck = 1 where memberid = 'admin';

-- ���� ���̺� ����
create table vam_nation(
   nationId varchar2(2) primary key,
    nationName varchar2(50)
);
 
-- ���� ���̺� ������ ����
insert into vam_nation values ('01', '����');
insert into vam_nation values ('02', '����');
 
-- �۰� ���̺� ����
create table vam_author(
    authorId number generated as identity (start with 1) primary key,
    authorName varchar2(50),
    nationId varchar2(2),
    authorIntro long,
    foreign key (nationId) references vam_nation(nationId)
);

alter table vam_author add regDate date default sysdate;
alter table vam_author add updateDate date default sysdate;

insert into vam_author(authorName, nationId, authorIntro) values('��ȫ��', '01', '�۰� �Ұ��Դϴ�' );
insert into vam_author(authorName, nationId, authorIntro) values('�賭��', '01', '�۰� �Ұ��Դϴ�' );
insert into vam_author(authorName, nationId, authorIntro) values('��ũ��׸�', '02', '�۰� �Ұ��Դϴ�' );

delete from vam_author;
 
    ALTER TABLE vam_author MODIFY(authorId GENERATED AS IDENTITY (START WITH 1));
 
    insert into vam_author(authorName, nationId, authorIntro) values('��ȫ��', '01', '�۰� �Ұ��Դϴ�' );
    insert into vam_author(authorName, nationId, authorIntro) values('�賭��', '01', '�۰� �Ұ��Դϴ�' );
    insert into vam_author(authorName, nationId, authorIntro) values('��ũ��׸�', '02', '�۰� �Ұ��Դϴ�' );
 
    select * from vam_author;

select * from USER_INDEXES;
--��� ����
insert into vam_author(authorname, nationid)(select authorname, nationid from vam_author);

-- Oracle
-- ��ǰ ���̺� 
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
-- ī�װ� ���̺�
create table vam_bcate(
    tier number(1) not null,
    cateName varchar2(30) not null,
    cateCode varchar2(30) not null,
    cateParent varchar2(30) ,
    primary key(cateCode),
    foreign key(cateParent) references vam_bcate(cateCode) 
);

-- ������ ����
insert into vam_bcate(tier, cateName, cateCode) values (1, '����', '100000');
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '�Ҽ�', '101000','100000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�ѱ��Ҽ�', '101001','101000');
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '���̼Ҽ�', '101002','101000');
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�Ϻ��Ҽ�', '101003','101000');
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '��/������', '102000','100000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�ѱ���', '102001','102000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�ؿܽ�', '102002','102000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '����/�濵', '103000','100000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�濵�Ϲ�', '103001','103000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�濵�̷�', '103002','103000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�����Ϲ�', '103003','103000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�����̷�', '103004','103000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '�ڱ���', '104000','100000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '����/ó��', '104001','104000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�ڱ�ɷ°��', '104002','104000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�ΰ�����', '104003','104000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '�ι�', '105000','100000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�ɸ���', '105001','105000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '������', '105002','105000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, 'ö��', '105003','105000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '����/��ȭ', '106000','100000');
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�����Ϲ�', '106001','106000');
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�����', '106002','106000');
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�ѱ���', '106003','106000');
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '����', '107000','100000');
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�����̷�', '107001','107000');
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '����', '107002','107000');
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '������', '107003','107000');
insert into vam_bcate(tier, cateName, cateCode) values (1, '����', '200000');
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '����', '201000','200000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�Ҽ�', '201001','201000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '��', '201002','201000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '���', '201003','201000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '�ι�/��ȸ', '202000','200000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '����', '202001','202000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, 'ö��', '202002','202000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '����/�濵', '203000','200000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '������', '203001','203000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�濵��', '203002','203000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '����', '203003','203000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '����/���', '204000','200000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�������', '204001','204000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '������', '204002','204000');    
insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '����', '204003','204000');

select * from VAM_BOOK;

alter table vam_book add foreign key (authorId) references vam_author(authorId);
alter table vam_book add foreign key (cateCode) references vam_bcate(cateCode);

--��� ����
insert into vam_book(bookName, authorId, publeYear, publisher, cateCode, bookPrice, bookStock, bookDiscount,bookIntro, bookContents)
(select bookName, authorId, publeYear, publisher, cateCode, bookPrice, bookStock, bookDiscount,bookIntro, bookContents from vam_book);

SELECT * FROM USER_INDEXES WHERE TABLE_NAME = 'VAM_BOOK';

commit;

 select /*+INDEX_DESC(vam_book SYS_C008337)*/ rownum as rn, bookId, bookName,
		        (select authorName from vam_author where vam_book.authorId = vam_author.authorId) authorName,
		        (select cateName from vam_bcate where vam_book.cateCode = vam_bcate.cateCode) cateName,bookStock,regDate
		    from vam_book ;

--�̹��� ���̺�            
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

insert into vam_image values (324, '�ν�Ÿ.png', '2021\07\25', 'test1');
insert into vam_image values (324, '����.png', '2021\07\25', 'test2');

insert into vam_image values (324, '�ν�Ÿ.png', '2024\01\25', 'test01');
insert into vam_image values (324, '����.png', '2024\01\25', 'test02'); 

commit;