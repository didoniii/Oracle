set serveroutput ondbms_o
create or replace procedure emp_info
  (  v_empno  in emp.empno%type)

is
    v_emp emp%rowtype;
begin
    select empno, ename, hiredate 
    into v_emp.empno, v_emp.ename, v_emp.hiredate
    from emp
    where empno = v_empno;

    dbms_output.put_line ('사번: '||v_emp.empno);
    dbms_output.put_line ('이름 : '||v_emp.ename);
    dbms_output.put_line ('입사일 : ' ||v_emp.hiredate);
end;
/   

execute emp_info(7788); 