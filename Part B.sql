                /*חלק ג**/

/*שאילתא המציגה עוגות שלא הוזמנו והכי יקרות*/
/*ממיון לפי ת"ז של העוגה ושם עוגה*/
select *
from Cakes
left join order_Cake
on order_Cake.cake_id=Cakes.cake_id
where order_Cake.cake_id is null and Cakes.price between 49 and 90
order by  Cakes.cake_id desc ,Cakes.cake_name

/*שאילתא המציגה את הלקוחות שעזבו את קורס האפייה ובעקבות זה לא קבלו ציון*/
/*ובנוסף מציגה עמודה חדשה עם שם מלא*/
select Customer.customer_name+' '+Customer.customer_LastName as 'Full Name' ,CustCrs.*
from Customer
join CustCrs
on CustCrs.id_customer=Customer.customer_id
where CustCrs.course_num=(select course_num from Course where course_name='Bakery')
and CustCrs.grade is null

/*שאילתא המציגה מי הם 2 לקוחות עם כמות ההזמנה הכי גדולה */
/*ויצירת עמודה חדשה של שם ות"ז*/
select top 2 'Name:'+' '+Customer.customer_name+'   '+ 'ID:'+ CONVERT(varchar(10),Customer.customer_id) as 'Name and Id', "order".* 
from "Order"
left join Customer
on "Order".customer_id=Customer.customer_id
where "order".quantity>8


/*שאילתא המראה את הלקוח שלא ביצע הזמנה אבל נרשם לקורס*/
select Customer.*,"order".order_id,"Order".order_date
from "Order"
full join Customer
on "Order".customer_id=Customer.customer_id
where Customer.customer_id in (select id_customer from CustCrs )
and "Order".customer_id is null 

/*שאילתא המציגה הזמנות שמכילות גם מאפים וגם עוגות העשה סכום */
/*ויוצרת עמודה חדשה של מחיר סופי*/
select "Order".order_id, sum(order_Cake.price+order_past.price) as 'Total price'
from "order"
join order_Cake
on "Order".order_id=order_Cake.order_id
join order_Past
on "Order".order_id=order_Past.order_id
group by "Order".order_id


/*שאילתא המציגה את העוגות שמכילות מרכיבים אלרגניים*/
/*ממויין לפי שם מרכיב*/
select distinct cakes.cake_name,Ingridients.ingri_name,CakeIngr.alerganic
from CakeIngr
left join Ingridients
on CakeIngr.ingri_id=Ingridients.ingri_id
left join Cakes
on CakeIngr.ingri_id=Ingridients.ingri_id
where CakeIngr.alerganic ='yes' 
order by Ingridients.ingri_name


select * from Pastriesselect * from CakeIngrselect * from Cakesselect * from order_Cakeselect * from order_Pastselect * from "Order"select * from Courseselect * from Customerselect * from CustCrsselect * from Ingridientsselect * from CakeIngr
select * from Cakes

select *
from Cakes
left join CakeIngr
on Cakes.cake_id=CakeIngr.cake_id
left join Ingridients
on CakeIngr.ingri_id=Ingridients.ingri_id
where CakeIngr.ingri_id>=432