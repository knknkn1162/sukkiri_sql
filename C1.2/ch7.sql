-- 55
select 商品コード,商品名,単価,
    (
        select count(*)
        from 注文
        where 商品コード = 'S0604'
    ) as 数量
from 商品
where 商品コード = 'S0604'

-- 56
update 注文
set 商品コード = (
    select 商品コード
    from 商品
    where 商品区分 = '2' and
        商品名 like '%ブーツ%' and
        商品名 like '%雨%' and
        商品名 like '%安心%'
)
where
    注文日 = '2022-03-15' and
    注文番号 = '202203150014' and
    注文枝番 = '1'

-- 57
select 注文日, 商品コード
from 注文
where 商品コード in (
    select 商品コード
    from 商品
    where 商品名 like '%あったか%'
)
order by 注文日

-- 57.2
select 注文日, 商品.商品コード
from 注文
join 商品
on 商品.商品コード = 注文.商品コード
where 商品名 like '%あったか%'
order by 注文日

-- 58
select 商品コード, sum(数量)
from 注文
group by 商品コード
having sum(数量) > all(
    select avg(数量)
    from 注文
    group by 商品コード
)

-- 59
select sum(数量) as 割引による販売数,
    sum(クーポン割引料)/sum(数量) as 平均割引額
from 注文
where 商品コード = 'W0746' and
    クーポン割引料 is not null

-- 60
insert into 注文
values (
    '2022-03-21', '202203210080',
    coalesce(
        (select 注文枝番
        from 注文
        where 注文番号 = '202203210080'
        order by 注文枝番 desc limit 1),
        0
    )+1,
    'S1003',1,NULL
);
insert into 注文
values (
    '2022-03-22', '202203220901',
    coalesce(
        (select 注文枝番
        from 注文
        where 注文番号 = '202203220901'
        order by 注文枝番 desc limit 1),
        0
    )+1,
    'A0052',2, 500
);