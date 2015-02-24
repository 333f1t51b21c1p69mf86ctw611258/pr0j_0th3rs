DROP FUNCTION LIVESCREEN.SPLIT_TO_NUMBER_ARR;

CREATE OR REPLACE FUNCTION LIVESCREEN.SPLIT_TO_NUMBER_ARR (p_in_list  IN  VARCHAR2)
  RETURN t_tbl_nums
AS
  l_tab   t_tbl_nums := t_tbl_nums();
  l_text  VARCHAR2(32767) := p_in_list || ',';
  l_idx   NUMBER;
BEGIN
  LOOP
    l_idx := INSTR(l_text, ',');
    EXIT WHEN NVL(l_idx, 0) = 0;
    l_tab.extend;
    l_tab(l_tab.last) := to_number(TRIM(SUBSTR(l_text, 1, l_idx - 1)));
    l_text := SUBSTR(l_text, l_idx + 1);
  END LOOP;

  RETURN l_tab;
END;
/

CREATE OR REPLACE PUBLIC SYNONYM SPLIT_TO_NUMBER_ARR FOR LIVESCREEN.SPLIT_TO_NUMBER_ARR;
