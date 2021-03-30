SELECT MONTH(factura_venta.fecha),registro_servicio.id_usuario,SUM(registro_servicio.precio_servicio) as venta
from peluqueria.registro_servicio 
inner join  usuario on usuario.id_usuario= registro_servicio.id_usuario 
inner join factura_venta on factura_venta.id_factura= registro_servicio.id_factura

where usuario.activo=1 group by  MONTH(factura_venta.fecha),registro_servicio.id_usuario order by MONTH(factura_venta.fecha),venta desc;
