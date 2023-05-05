/*������ ��� ��������� ���� ��� ��� �������� - ��� ���������, ������� �������� ��� ���������*/
select p.name as "��� ��������", coalesce(c.name, '��������� �����������') as "��� ���������" from product p 
left join productCategories pc on p.id = pc.product_id 
left join category c on pc.category_id = c.id 
-- ����� ������� � ������� ��������� ��� ���������
union all 
select '�������� �����������', c.name from category c 
where c.id not in (select pc.category_id from productCategories pc)