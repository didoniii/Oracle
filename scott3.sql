--8장 9p
--1
create table my_data1 (id number(4) not null, name varchar2(10), userid varchar2(30), salary number(10,2));
select * from my_data1;

drop table my_data1;

drop table emp01;
drop table dept01;
drop table dept02;
drop table juso;
drop table

--8장 18p
create table emp01 as select empno, ename,sal from emp;
--19p
create table dept01 (deptno number(2), dname varchar2(14), loc varchar(13));

create table dept02  as select * from dept where 1=0;
--30
alter table emp01 add(job varchar2(10));
alter table dept02 add(dmgr varchar2(20));

--31
alter table emp01 modify(job varchar2(30));
alter table dept02 modify(dmgr number(20));
--32
alter table emp01 drop(job);
alter table dept02 drop(dmgr);

--33
alter table emp02 set unused(job);
select* from emp02;
alter table emp02 drop unused columns;

--38
create table juso (no number(3), name varchar2(10),addr varchar2(20), email varchar2(5)); 
alter table juso add(phoone varchar2(10));
alter table juso modify(email varchar2(20));
alter table juso drop (addr);
select * from juso;
drop table juso;

--39

create table emp_demo as select empno, ename, job,mgr,hiredate,deptno from emp;
create table emp_dept as select empno, ename, job, dname, loc from emp e, dept d where e.deptno= d.deptno;
create table emp_grade as select empno, ename, job, sal, comm, grade from emp, salgrade where sal between losal and hisal;
alter table emp_grade modify(sal number(16,4));
drop table emp_demo;
drop table emp_dept;
drop table emp_grade;


--45
desc all_tables;
select owner, table_name from all_tables;





--9장
--15
drop table sam01;
create table sam01 as select empno, ename, job, sal from emp where 1=0;
insert into sam01 values ( 1000,'APPLE','POLICE',10000);
insert into sam01 values ( 1010,'BANANA','NURSE',15000);
insert into sam01 values ( 1020,'ORANGE','DOCTOR',25000);
--16
insert into sam01 values ( 1030,'VERY',NULL,25000);
insert into sam01 values ( 1040,'CAT',NULL,2000);


select &a,&b from emp;
set verify off;
accept sal prompt '급여기준 입력해'
select *from emp where sal > &sal;

--25
insert into sam01 select empno, ename, job,sal from emp where deptno=10;

--37
update sam01 set sal=sal-5000 where sal>=10000;
--39 
update dept01 set loc=(select loc from dept01 where deptno=40) where deptno=20;

--42
drop table sam02;
create table sam02 as select ename, sal, hiredate, deptno from emp;
select *from sam02;
desc sam02;
--43
update sam02 set sal= sal+1000 where deptno = (select deptno from dept where loc='DALLAS');
--44
select * from dept01;
update dept01 set (dname,loc)= (select dname, loc from dept where deptno=40) where deptno=20;

--45
update sam02 set (sal, hiredate) = (select sal, hiredate from emp where ename = 'KING');

--51
select* from sam01;
delete sam01 where job is null;
--53
select* from sam02;
delete from sam02 where deptno= (select deptno from dept where dname='RESEARCH');


--98
delete from dept01 where deptno=40;
commit;
select *from dept01;
insert into dept01 select deptno, dname, loc from dept;

delete from dept01 where deptno=30;
savepoint c1;
delete from dept01 where deptno =20;
savepoint c2;
delete from dept01 where deptno=10;
select *from dept01;
rollback to c2;
rollback to c1;
rollback;

--102
insert into dept01 values(99, '관리과','대구');
select *from dept01;
update dept01 set dname='회계과' where deptno=99;
delete from dept01 where deptno=99;

--103

create table my_data (id number(4) not null, name varchar2(10), userid varchar2(30), salary number(10,2));
desc my_data;
insert into my_data values(1,'scott','sscott',10000.00);
select * from my_data;
insert into my_data values(2,'scott','sscott',10000.00);
insert into my_data values(3,'ford','sscott',10000.00);
insert into my_data values(4,'patel','sscott',10000.00);
insert into my_data values(5,'','sscott',10000.00);




--11장
--37
create view emp_view as select empno, ename, job, deptno from emp;
select * from emp_view where deptno = 10;
select rownum ranking, empno, ename, sal from(select empno, ename, sal from emp order by sal desc) where rownum<=3;  ;
select * from emp;


--40
select * from (select empno, ename, sal, rank()over ( order by sal desc) as rank from emp) where rank between 6 and 10;

--44
create view emp_view as select empno, ename, job, deptno from emp;
select * from emp_view where deptno=10;
create view emp_dept_name as select ename, job, sal, dname, loc from emp e, dept d where e.deptno= d.deptno; 
select * from emp_dept_name; 

--45
create view dname_ename_vu as select dname, ename from emp e, dept d where e.deptno= d.deptno;
select * from dname_ename_vu;
create view worker_manager_vu as select w.ename 사원명, m.ename 사수명 from emp w, emp m where w.mgr= m.empno; 
select* from worker_manager_vu;
select empno, ename, hiredate from emp order by hiredate desc;
select * from (select rownum,empno, ename, hiredate from emp order by hiredate desc) where rownum<=5; 
select * from (select rownum,empno, ename, hiredate from emp order by hiredate desc) where rownum between 6 and 10;
select * from (select rownum rn, a.* from (select empno, ename, hiredate from emp order by hiredate desc) a) 
where rn between 6 and 10; 

--65
create sequence emp_seq start with 1 increment by 1 maxvalue 100000;
drop table emp01;
create table emp01 (empno number(4) primary key, ename varchar(10), hiredate date);
insert into emp01 values(emp_seq.nextval, 'JULIA', sysdate);
select * from emp01;
drop sequence dept_deptno_seq;
--66
create sequence tes_seq start with 1 increment by 1 maxvalue 999999;
select * from user_sequences;
drop sequence tes_seq;

--memojang
create sequence test_seq1;
create sequence test_seq2 start with 10 increment by 5 maxvalue 100 nocycle nocache;
select test_seq1.nextval from dual;
select test_seq1.currval from dual;
select test_seq2.currval from dual;
select test_seq2.nextval from dual;
alter sequence test_seq2 increment by 10;
drop sequence test_seq2;

--72
create table dept_example( deptno number(4) primary key, dname varchar(15), loc varchar(15));
create sequence dept_example_seq ;
insert into dept_example values( dept_example_seq.nextval, '&dname', '&loc');
select * from dept_example;

--86
select index_name, table_name, column_name from user_ind_columns where table_name in('EMP','DEPT');

--87
create index ind_emp01_ename on emp01(ename);
select * from emp01;

drop index ind_emp01_ename;

--88
create index idx_dept01_com on dept01(deptno, dname);
select index_name, column_name from user_ind_columns where table_name = 'DEPT01';

--90
drop table emp01;
create table emp01 as select *from emp;
create index idx_emp01_annsal on emp01(sal*12);
select index_name, column_name from user_ind_clomns where table_name = 'EMP01';