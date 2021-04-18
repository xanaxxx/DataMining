CREATE DEFINER=`root`@`localhost` PROCEDURE `TOP3ServiciosMenosRealizados`()
BEGIN

Declare  mes integer default 1;

contador : loop

IF  mes >= 13 THEN 
			LEAVE  contador;
		END  IF;
SELECT count(peluqueria.registro_servicio.id_servicio) as cantidad,peluqueria.registro_servicio.id_servicio
FROM peluqueria.registro_servicio 
where peluqueria.registro_servicio .id_factura in
 (select  peluqueria.factura_venta.id_factura from
 peluqueria.factura_venta where MONTH(peluqueria.factura_venta.fecha) =mes )
 group by peluqueria.registro_servicio.id_servicio order by cantidad asc limit 3;
set mes= mes+1;
 end loop;
END