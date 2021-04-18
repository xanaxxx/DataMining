SELECT MONTHNAME(factura_venta.fecha),SUM(precioTotal) FROM peluqueria.factura_venta 
 group by  MONTH(factura_venta.fecha);
 
 
 
 

