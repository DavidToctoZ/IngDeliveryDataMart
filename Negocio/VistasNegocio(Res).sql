
--Total de ventas, promedio de ventas, cantidad de ventas
create view negocio.v_ventas_localidad as
select departamento, provincia, distrito, sum(total) total_ventas_soles, avg(total) promedio_ventas_soles, count(total) cantidad_ventas
from 
NEGOCIO.F_VENTAS_DESC
group by distrito, departamento, provincia;



--Muestra a los clientes por categoria
create view negocio.v_clientes_categoria as
SELECT NOMBRE_C,APELLIDO_C, NRO_VENTAS,
CASE WHEN NRO_VENTAS > 15 THEN 'CLIENTE PREMIUM'
WHEN NRO_VENTAS > 10 THEN 'CLIENTE PLATA'
ELSE 'CLIENTE REGULAR' END Tipo_Cliente
FROM
(SELECT 
NOMBRE_C,
APELLIDO_C,
COUNT(ID_CLIENTE) NRO_VENTAS
FROM NEGOCIO.F_VENTAS_DESC
GROUP BY NOMBRE_C, APELLIDO_C
HAVING COUNT(ID_CLIENTE)> 5) a
ORDER BY NRO_VENTAS DESC;
