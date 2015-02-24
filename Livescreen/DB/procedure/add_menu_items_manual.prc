DROP PROCEDURE LIVESCREEN.ADD_MENU_ITEMS_MANUAL;

CREATE OR REPLACE PROCEDURE LIVESCREEN.add_menu_items_manual
   (P_MENUITEMS_ID menu_items.menuitems_id%TYPE
    , P_PARENT_ID menu_items.parent_id%TYPE
    , P_ACTIONTYPE menu_items.actiontype%TYPE
    , P_SYNTAX menu_items.syntax%TYPE
    , P_CONTENT menu_items.content%TYPE
    , P_SHORTCODE menu_items.shortcode%TYPE
    , P_LEVELS menu_items.levels%TYPE
    , P_TITLE menu_items.title%TYPE
    , P_PROGRAM_ID menu_items.program_id%TYPE
    )
   IS
    v_indexs number;
    
    v_id number;
    v_strid varchar2(50);
    
BEGIN
    select count(*) into v_indexs from menu_items
    where menu_items.parent_id = P_PARENT_ID;
    
    if(v_indexs = 0) then
        v_indexs := 0;
    else
        select max(indexs) into v_indexs from menu_items where
            menu_items.parent_id = P_PARENT_ID;
    end if;
    
    v_indexs := v_indexs + 1;
    
    select 'MAN ' ||  LPAD(trim(to_char(SEQ_PROGRAM.NEXTVAL,'XXXXXXXXX')),8,'0')  into v_strid from dual;
    
    
    INSERT INTO MENU_ITEMS(MENUITEMS_ID, PARENT_ID, ACTIONTYPE, SYNTAX, CONTENT
        , SHORTCODE, LEVELS, TITLE, PROGRAM_ID,MENU_ITEMS.indexs) 
    VALUES (v_strid, P_PARENT_ID,P_ACTIONTYPE,P_SYNTAX,P_CONTENT
        ,P_SHORTCODE, P_LEVELS,P_TITLE,P_PROGRAM_ID,v_indexs);
    
    commit;
END; -- Procedure
/

CREATE OR REPLACE PUBLIC SYNONYM ADD_MENU_ITEMS_MANUAL FOR LIVESCREEN.ADD_MENU_ITEMS_MANUAL;
