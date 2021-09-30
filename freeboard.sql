-- 자유게시판 : 테이블 2개(메인글 저장, 댓글)

create table freeboard(
	idx int not null auto_increment,
	name varchar(30) not null,       -- 작성자
	password varchar(10) not null,   -- 글비밀번호
	subject varchar(40) not null,    -- 글제목
	content varchar(2000) not null,  -- 글내용
	readCount int default 0,         -- 조회수
	wdate datetime default current_timestamp, -- 서버의 현재날짜/시간
	ip varchar(15) default '127.0.0.1',   	  -- 작성자 ip
	commentCount smallint default 0,		  -- 댓글 갯수
	primary key(idx)
);
alter table freeboard modify column wdate timestamp default current_timestamp;


insert into freeboard (name,password,subject,content,ip) 
values('honey','1111','웰컴','하이 반가워','192.168.17.3');
insert into freeboard (name,password,subject,content,ip) 
values('사나','1111','welcome','하이 어서와','192.168.22.3');
insert into freeboard (name,password,subject,content,ip) 
values('나나','1111','굿바이','잘가 또봐','192.168.23.3');
insert into freeboard (name,password,subject,content,ip) 
values('nayeon','1111','웰컴홈','하이 난 트와이스','192.168.24.3');
insert into freeboard (name,password,subject,content,ip) 
values('박찬호','1111','헬로우','야구하러가자','192.168.25.4');
insert into freeboard (name,password,subject,content,ip) 
values('세리박','1111','하이요','골프치러가자','192.168.26.7');

select * from freeboard; 
commit;

-- mysql 에는 limit 키워드 : limit 번호,갯수
-- mysql,oracle select 결과에 대해 각행에 순서대로 번호를 부여하는 컬럼(row num)이 만들어집니다.
-- 그래서 limit의 번호는 row num입니다.(mysql은 0부터 시작)
select * from freeboard order by idx desc;
select * from freeboard order by idx desc limit 0,15;  -- 1페이지 목록
select * from freeboard order by idx desc limit 15,15; -- 2페이지 목록
select * from freeboard order by idx desc limit 30,15; -- 3페이지 목록
-- 계산식 : n = 10페이지 글은? (n-1)*15
select * from freeboard order by idx desc limit 135,15; -- 10페이지 목록

-- 글 수정 : subject, content 수정. idx 칼럼을 조건으로 합니다.
update freeboard set subject = '하이골프',content ='골프배울사람?' where idx = 216;

-- 조회수 변경 : 읽을 때마다(url 요청 발생) 카운트 +1
update freeboard set readCount = readCount +1 where idx = 216;
select * from freeboard order by idx desc;

-- 글 삭제 : 글 비밀번호 1)있을때 2) 없을때
delete from freeboard where idx = 215 and password = '1111'; 
delete from freeboard where idx = 215; 

-- 글 비밀번호 체크
select * from freeboard where idx=159 and password ='1111'; -- 옳바른 비번
select * from freeboard where idx=159 and password ='1121'; -- 잘못된 비번

-- 댓글 테이블 : board_comment
create table board_comment(
	idx int not null auto_increment,
	mref int not null, -- 메인글(부모글)의 idx
	name varchar(30) not null,       -- 작성자
	password varchar(10) not null,   -- 글비밀번호
	content varchar(2000) not null,  -- 글내용
	wdate timestamp default current_timestamp, -- 서버의 현재날짜/시간
	ip varchar(15) default '127.0.0.1',   	  -- 작성자 ip
	primary key(idx),
	foreign key(mref) references freeboard(idx)
);
select * from board_comment order by idx desc;

insert into board_comment (mref,name,password ,content,ip) 
values(142,'사나','1234','무사히 보내','192.168.17.11');
insert into board_comment (mref,name,password ,content,ip) 
values(142,'사나','1234','무사히 보내','192.168.17.11');
insert into board_comment (mref,name,password ,content,ip) 
values(142,'사나','1234','무사히 보내','192.168.17.11');

insert into board_comment (mref,name,password ,content,ip) 
values(154,'사나','1234','무사히 보내','192.168.17.11');
-- 1)
insert into board_comment (mref,name,password ,content,ip) 
values(154,'사나','1234','무사히 보내','192.168.17.11');

select * from freeboard order by idx desc limit 0,15;  -- 1페이지 목록
-- 댓글 개수(글목록에서 필요)
select count(*) from board_comment where mref= 142; -- 142번글의 댓글 갯수
select count(*) from board_comment where mref= 154;

-- 2)댓글 리스트
select * from board_comment where mref = 154;
select * from board_comment where mref = 142;

-- 3)글목록 실행하는 dao.getList() 보다 앞에서 댓글갯수를 update
update freeboard set commentCount=(
	select count(*) from board_comment where mref= 142) where idx=142;
update freeboard set commentCount=(
	select count(*) from board_comment where mref= 154) where idx=154;

-- 4) 글 상세보기에서 댓글 입력 후 저장 할 때 
update freeboard set commentCount = commentCount +1 where idx=0;






