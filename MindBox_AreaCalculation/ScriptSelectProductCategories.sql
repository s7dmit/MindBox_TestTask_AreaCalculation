/*Запрос для получения всех пар Имя продукта - Имя категории, включая продукты без категории*/
select p.name as "Имя продукта", coalesce(c.name, 'категория отсутствует') as "Имя категории" from product p 
left join productCategories pc on p.id = pc.product_id 
left join category c on pc.category_id = c.id 
-- Также добавим в выборку категории без продуктов
union all 
select 'продукты отсутствуют', c.name from category c 
where c.id not in (select pc.category_id from productCategories pc)