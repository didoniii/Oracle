select deptno, sum(sal) �޿��հ�, avg(sal) �޿����, count(empno) �ο��� from emp group by deptno ;

select dname, loc, job, max(sal) �ִ�޿�, min(sal) �ּұ޿� from emp e, dept d where e.deptno= d.deptno group by dname, job, loc;

select substr(hiredate,1,2) H_YEAR, count(*),min(sal),max(sal),avg(sal) from emp group by substr(hiredate,1,2) order by 1;

select hiredate from emp;