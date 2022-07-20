-- 테이블 생성
create table member
(
    member_idx int         default nextval('seq_member_idx'::regclass)
        constraint member_pk
            primary key,
    id         varchar(50)           not null,
    pass       varchar(50)           not null,
    name       varchar(50)           not null,
    gender     int                   not null,
    email1     varchar(50)           not null,
    email2     varchar(50) default 'gmail.com',
    column_8   int,
    address1   text                  not null,
    address2   text,
    profile    text,
    permission int         default 0 not null,
    position   int         default 0
);

comment on table member is '회원정보 테이블';

comment on column member.member_idx is 'member 고유 번호';

comment on column member.gender is '0 : 여자 / 1 : 남자';

comment on column member.email1 is 'email 앞자리';

comment on column member.email2 is '이메일 뒷자리(도메인)';

comment on column member.address1 is '기본 주소';

comment on column member.address2 is '상세주소';

comment on column member.profile is 'profile 이미지 주소';

comment on column member.permission is '권한 / 0 : 일반인 / 1 : 직원 / 2 : 관리자 ';

comment on column member.position is '직급 / 0 : 초기값';

-- 토큰 컬럼 추가
alter table member
    add token text;

comment on column member.token is '토큰 인증용';

-- 전체 조회
select * from member;

-- 개별 조회
select * from member where member_idx = 1;

-- 리스트 조회
select * from(select row_number() over () as rn, tt.* from (select * from member order by member_idx asc)tt)rn where rn >=1 and rn <= 5;

