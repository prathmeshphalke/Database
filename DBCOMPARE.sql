CREATE OR REPLACE PROCEDURE dbcompare AS

    v_table_name    VARCHAR2(2000);
    v_sql           VARCHAR2(4000);
    v_column_name   VARCHAR2(4000);
    v_col_count     INT;
    v_old_count     INT;
    v_new_count     INT;
    v_count_diff    INT;
    v_sql_old       VARCHAR2(4000);
    v_sql_new       VARCHAR2(4000);
    v_sql_stmt      VARCHAR2(4000);
    v_result        VARCHAR2(4000);
    CURSOR cur_tablename IS
        SELECT
            table_name
        FROM
            user_tables
        WHERE
            table_name IN (
                'PRODUCTS'
            );

    CURSOR cur_columnname IS
        SELECT
            column_name
        FROM
            user_tab_cols
        WHERE
                table_name = v_table_name
           AND  data_type != 'DATE'
            AND
                ROWNUM <= 50
            AND
                column_name NOT LIKE 'SYS_%'
            AND
                column_name NOT IN (
                    SELECT
                        ucc.column_name AS column_name
                    FROM
                        user_cons_columns ucc
                        JOIN user_constraints uc ON ucc.constraint_name = uc.constraint_name
                    WHERE
                            uc.constraint_type IN (
                                'P','U'
                            )
                        AND
                            ucc.table_name = v_table_name
                );
       
    /*
       
       
       
        SELECT
            column_name
        FROM
            user_tab_cols
        WHERE
                table_name = v_table_name
            AND
                data_type = 'VARCHAR2'
            AND
                ROWNUM <= 50
            AND 
                COLUMN_NAME NOT LIKE 'SYS_%';
*/
BEGIN
    OPEN cur_tablename;
    LOOP
        FETCH cur_tablename INTO v_table_name;
        EXIT WHEN cur_tablename%notfound;
     --  Open second cursor
        v_sql_new := 'SELECT COUNT(1) FROM ' || v_table_name;
        v_sql_old := 'SELECT COUNT(1) FROM ' || v_table_name || '@RPTQ_N';
        EXECUTE IMMEDIATE v_sql_new INTO
            v_new_count;
        EXECUTE IMMEDIATE v_sql_old INTO
            v_old_count;
        v_count_diff := abs(v_old_count - v_new_count);
      --  dbms_output.put_line(v_old_count || v_new_count);
        IF
            ( v_new_count != 0 AND v_old_count != 0 )
        THEN
            OPEN cur_columnname;
            LOOP
                FETCH cur_columnname INTO v_column_name;
                EXIT WHEN cur_columnname%notfound;
                IF
                    cur_columnname%rowcount = 1
                THEN
                    v_sql := 'SELECT ' || v_column_name;
                ELSE
                    v_sql := v_sql || ',' || v_column_name;
                END IF;

                v_sql_stmt := 'SELECT COUNT(1) FROM ('
                 || v_sql
                 || ' FROM '
                 || v_table_name
                 || ' MINUS '
                 || v_sql
                 || ' FROM '
                 || v_table_name
                 || '@RPTQ_N'
                 || ' UNION '
                 || v_sql
                 || ' FROM '
                 || v_table_name
                 || '@RPTQ_N'
                 || ' MINUS '
                 || v_sql
                 || ' FROM '
                 || v_table_name
                 || ' )';

            END LOOP;

            dbms_output.put_line(v_sql_stmt);
            EXECUTE IMMEDIATE v_sql_stmt INTO
                v_result;
            IF
                ( v_result = 0 AND v_new_count != 0 AND v_old_count != 0 )
            THEN
               -- dbms_output.put_line('3');
                INSERT INTO compare_results (
                    run_date,
                    table_name,
                    results,
                    datadiffrows,
                    old_obiee_cnt,
                    new_obiee_cnt,
                    sql_query,
                    countdiff
                ) VALUES (
                    SYSDATE,
                    v_table_name,
                    'MATCHED',
                    v_result,
                    v_old_count,
                    v_new_count,
                    v_sql_stmt,
                    v_count_diff
                );

                dbms_output.put_line('INSERT MATCH');
            ELSIF ( v_result != 0 AND v_new_count != 0 AND v_old_count != 0 ) THEN
             --   dbms_output.put_line('5');
                INSERT INTO compare_results (
                    run_date,
                    table_name,
                    results,
                    datadiffrows,
                    old_obiee_cnt,
                    new_obiee_cnt,
                    sql_query,
                    countdiff
                ) VALUES (
                    SYSDATE,
                    v_table_name,
                    'UNMATCHED',
                    v_result,
                    v_old_count,
                    v_new_count,
                    v_sql_stmt,
                    v_count_diff
                );

                dbms_output.put_line('INSERT UNMATCH');
            END IF;

            CLOSE cur_columnname;
        END IF;

        IF
            ( v_new_count = 0 AND v_old_count = 0 )
        THEN
            INSERT INTO compare_results (
                run_date,
                table_name,
                results,
                datadiffrows,
                old_obiee_cnt,
                new_obiee_cnt,
                sql_query,
                countdiff
            ) VALUES (
                SYSDATE,
                v_table_name,
                'ZERO ROWS',
                0,
                0,
                0,
                NULL,
                0
            );

        END IF;

        dbms_output.put_line(v_table_name);
    END LOOP;

    CLOSE cur_tablename;
EXCEPTION
    WHEN OTHERS THEN
        raise_application_error(
            -20001,
            'An error was encountered - '
             || sqlcode
             || ' -ERROR- '
             || sqlerrm
        );
END dbcompare;