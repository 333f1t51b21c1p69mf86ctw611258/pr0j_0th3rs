DROP PROCEDURE LIVESCREEN.DELETE_MENU_ITEMS_MANUAL;

CREATE OR REPLACE PROCEDURE LIVESCREEN.delete_menu_items_manual
   (P_menu_items_id menu_items.menuitems_id%type)
   IS

   v_id VARCHAR2(50);
   v_i INTEGER := 1;
   v_parent_id varchar2(50);
    
   cursor cur is select menu_items.menuitems_id
        from menu_items
        where menu_items.parent_id = v_parent_id
            and menu_items.menuitems_id <> v_parent_id
        order by indexs; 
   
BEGIN
     select menu_items.parent_id into v_parent_id
     from menu_items
     where menu_items.menuitems_id = P_menu_items_id;
     
    OPEN cur;
    LOOP
        FETCH cur INTO v_id;
        EXIT WHEN cur%NOTFOUND;
        begin
            if(v_id <> P_menu_items_id) then
                update menu_items set indexs = v_i
                where menu_items.menuitems_id = v_id;
                -- dbms_output.put_line('i: '||v_i || ':' || v_id || ':' || P_menu_items_id);
                v_i := v_i + 1;
            end if;
        end;
    END LOOP;
    CLOSE cur;
    
    --delete menu_items where menu_items.menuitems_id = P_menu_items_id;
    
    delete menu_items where menu_items.menuitems_id in (
        select menuitems_id
        from menu_items 
        start with menu_items.menuitems_id = P_menu_items_id
        connect by prior menu_items.menuitems_id = menu_items.parent_id);

    commit;
        
END; -- Procedure
/

CREATE OR REPLACE PUBLIC SYNONYM DELETE_MENU_ITEMS_MANUAL FOR LIVESCREEN.DELETE_MENU_ITEMS_MANUAL;
