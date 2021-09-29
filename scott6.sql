select deptno, sum(sal) 급여합계, avg(sal) 급여평균, count(empno) 인원수 from emp group by deptno ;

select dname, loc, job, max(sal) 최대급여, min(sal) 최소급여 from emp e, dept d where e.deptno= d.deptno group by dname, job, loc;

select substr(hiredate,1,2) H_YEAR, count(*),min(sal),max(sal),avg(sal) from emp group by substr(hiredate,1,2) order by 1;

select hiredate from emp;