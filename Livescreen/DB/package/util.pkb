DROP PACKAGE BODY LIVESCREEN.UTIL;

CREATE OR REPLACE PACKAGE BODY LIVESCREEN.util is

  FUNCTION SPLIT_TO_STRING_ARR(p_in_string VARCHAR2, p_delim VARCHAR2)
    RETURN t_array IS
  
    i      number := 0;
    pos    number := 0;
    lv_str varchar2(50) := p_in_string;
  
    strings t_array;
  
  BEGIN
  
    -- determine first chuck of string  
    pos := instr(lv_str, p_delim, 1, 1);
  
    -- while there are chunks left, loop 
    WHILE (pos != 0) LOOP
    
      -- increment counter 
      i := i + 1;
    
      -- create array element for chuck of string 
      /*strings(i) := substr(lv_str, 1, pos);*/
      strings(i) := substr(lv_str, 1, pos - 1);
    
      -- remove chunk from string 
      lv_str := substr(lv_str, pos + 1, length(lv_str));
    
      -- determine next chunk 
      pos := instr(lv_str, p_delim, 1, 1);
    
      -- no last chunk, add to array 
      IF pos = 0 THEN
      
        strings(i + 1) := lv_str;
      
      END IF;
    
    END LOOP;
  
    -- return array 
    RETURN strings;
  
  END SPLIT_TO_STRING_ARR;

  FUNCTION SPLIT_TO_NUMBER_ARR(p_in_string VARCHAR2, p_delim VARCHAR2)
    RETURN number_array IS
  
    i      number := 0;
    pos    number := 0;
    lv_str varchar2(50) := p_in_string;
  
    numbers number_array;
  
  BEGIN
  
    -- determine first chuck of string  
    pos := instr(lv_str, p_delim, 1, 1);
  
    -- while there are chunks left, loop 
    WHILE (pos != 0) LOOP
    
      -- increment counter 
      i := i + 1;
    
      -- create array element for chuck of string 
      numbers(i) := to_number(substr(lv_str, 1, pos - 1));
    
      -- remove chunk from string 
      lv_str := substr(lv_str, pos + 1, length(lv_str));
    
      -- determine next chunk 
      pos := instr(lv_str, p_delim, 1, 1);
    
      -- no last chunk, add to array 
      IF pos = 0 THEN
      
        numbers(i + 1) := to_number(lv_str);
      
      END IF;
    
    END LOOP;
  
    -- return array 
    RETURN numbers;
  
  END SPLIT_TO_NUMBER_ARR;

end util;
/
