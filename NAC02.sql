/*

ALUNO: Júlio César Schincariol Filho
RM: 75583
TURMA: 2TDSF

*/

--1.
SET serveroutput ON
SET feed OFF
SET verify OFF
ACCEPT n PROMPT 'Número de funcionários:'

DECLARE
    v_n_funcionarios NUMBER(3) := &n;

 CURSOR empCursor IS
    SELECT e.last_name, e.salary
    FROM EMP e
    WHERE e.salary IS NOT NULL
    ORDER BY e.salary DESC;

    v_total_funcionarios NUMBER(3) := 0;
BEGIN
    SELECT COUNT(*) 
    INTO v_total_funcionarios 
    FROM emp;
    
    IF v_n_funcionarios <= 0 THEN
        DBMS_OUTPUT.PUT_LINE('Número de funcionários deve ser maior que 0.');
        EXECUTE IMMEDIATE 'TRUNCATE TABLE TOP_DOGS';
        DBMS_OUTPUT.PUT_LINE('Tabela TOP_DOGS esvaziada!');
    ELSIF v_n_funcionarios > v_total_funcionarios THEN
        DBMS_OUTPUT.PUT_LINE('Número de funcionários deve ser menor ou igual ao total de registros.');
        EXECUTE IMMEDIATE 'TRUNCATE TABLE TOP_DOGS';
        DBMS_OUTPUT.PUT_LINE('Tabela TOP_DOGS esvaziada!');
    ELSE
        FOR v_registro_emp IN empCursor
        LOOP
            DBMS_OUTPUT.PUT_LINE(v_registro_emp.last_name || ' ' || v_registro_emp.salary);
            INSERT INTO TOP_DOGS d (d.name, d.salary) VALUES(v_registro_emp.last_name, v_registro_emp.salary);
        EXIT WHEN empCursor%ROWCOUNT = v_n_funcionarios OR empCursor%NOTFOUND;
        END LOOP;
 
        COMMIT;
    END IF;
END;
/
SET verify ON
SET feed ON
SET serveroutput OFF

--2.
TRUNCATE TABLE TOP_DOGS;

SET serveroutput ON
SET feed OFF
SET verify OFF
ACCEPT n PROMPT 'Número de funcionários:'

DECLARE
    v_n_funcionarios NUMBER(3) := &n;

 CURSOR empCursor IS
    SELECT e.last_name, e.salary
    FROM EMP e
    WHERE e.salary IS NOT NULL
    ORDER BY e.salary DESC;

    v_total_funcionarios NUMBER(3) := 0;
    
    v_salary_buff emp.salary%TYPE := 0;
    v_repetidos NUMBER(1) := 0;
BEGIN
    SELECT COUNT(*) 
    INTO v_total_funcionarios 
    FROM emp;
    
    IF v_n_funcionarios <= 0 THEN
        DBMS_OUTPUT.PUT_LINE('Número de funcionários deve ser maior que 0.');
        EXECUTE IMMEDIATE 'TRUNCATE TABLE TOP_DOGS';
        DBMS_OUTPUT.PUT_LINE('Tabela TOP_DOGS esvaziada!');
    ELSIF v_n_funcionarios > v_total_funcionarios THEN
        DBMS_OUTPUT.PUT_LINE('Número de funcionários deve ser menor ou igual ao total de registros.');
        EXECUTE IMMEDIATE 'TRUNCATE TABLE TOP_DOGS';
        DBMS_OUTPUT.PUT_LINE('Tabela TOP_DOGS esvaziada!');
    ELSE
        FOR v_registro_emp IN empCursor
        LOOP           
            DBMS_OUTPUT.PUT_LINE(v_registro_emp.last_name || ' ' || v_registro_emp.salary);
            INSERT INTO TOP_DOGS d (d.name, d.salary) VALUES(v_registro_emp.last_name, v_registro_emp.salary);
        
            IF v_salary_buff = v_registro_emp.salary THEN
                v_repetidos := v_repetidos +1;
            ELSE
                v_salary_buff := v_registro_emp.salary;
            END IF;
            
        EXIT WHEN empCursor%ROWCOUNT = v_n_funcionarios + v_repetidos OR empCursor%NOTFOUND;
        
        END LOOP;
 
        COMMIT;
    END IF;
END;
/

--SELECT * FROM TOP_DOGS;

SET verify ON
SET feed ON
SET serveroutput OFF
