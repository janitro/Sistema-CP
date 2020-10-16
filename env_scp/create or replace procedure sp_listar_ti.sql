create or replace procedure sp_listar_tipo_profesional(tipo_profesional out SYS_REFCURSOR)
is
begin
    open tipo_profesional for select * from tipo_profesional;
end;




create or replace procedure sp_agregar_profesional(
    v_id number,
    v_nombre varchar2,
    v_email varchar2,
    v_password varchar2,
    v_idcomuna number,
    v_direccion varchar2,
    v_telefono number,
    v_estado varchar2,
    v_id_tipo_profesional number,
    v_contrato_activo boolean,
    v_rut varchar2,
    v_salida out number
    
)
is
begin
    insert into profesional(ID_PROFESIONAL, NOMBRE_COMPLETO, EMAIL_PROF, PASSWORD_PROF, ID_COMUNA, DIRECCION, TELEFONO_PROF, ESTADO, ID_TIPO_PROFESIONAL, CONTRATO_ACTIVO, RUN_PROFESIONAL)
    values(v_id,v_nombre,v_email,v_password,v_idcomuna,v_direccion,v_telefono,v_estado,v_id_tipo_profesional,v_contrato_activo,v_rut);
    v_salida:=1;

    exception

    when others then
        v_salida:=0;
end;
/

create trigger id_prof 
before insert on profesional
for each row
begin
select seq_prof.nextval into :new.id_profesional from profesional;


create or replace procedure sp_listar_profesional(v_run varchar2,profesional out SYS_REFCURSOR)
is
begin
    open profesional for select * from profesional;
end;