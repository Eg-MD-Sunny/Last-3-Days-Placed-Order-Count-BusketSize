select s.DeliveryWindowStart [SlotStart],
	   s.DeliveryWindowEnd [SlotEnd],
       Count(distinct o.Id) [PlacedOrder],
	   Sum(tr.salePrice)/Count(distinct o.Id) [Baskte size]
	   

from Shipment s 
join [Order] o on o.Id = s.OrderId 
join ThingRequest tr on s.Id = tr.ShipmentId 

where cast(dbo.toBdt(s.DeliveryWindowEnd)as date)  >= '2022-10-01 00:00 +06:00'
and cast(dbo.toBdt(s.DeliveryWindowEnd)as date)  < '2022-10-02 00:00 +06:00'
and s.WarehouseId in (41)

group by s.DeliveryWindowStart,
	     s.DeliveryWindowEnd 

Order by 3 desc


