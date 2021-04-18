CREATE DEFINER=`root`@`localhost` PROCEDURE `usuario_con_mas_servicios`()
BEGIN

Declare  mes integer default 1;

contador : loop

IF  mes >= 13 THEN 
			LEAVE  contador;
		END  IF;
SELECT count(peluqueria.registro_servicio.id_usuario) as cantidad,peluqueria.registro_servicio.id_usuario
FROM peluqueria.registro_servicio 
where peluqueria.registro_servicio .id_factura in
 (select  peluqueria.factura_venta.id_factura from
 peluqueria.factura_venta where MONTH(peluqueria.factura_venta.fecha) =mes )
 group by peluqueria.registro_servicio.id_usuario order by cantidad desc limit 1;
set mes= mes+1;
 end loop;

END