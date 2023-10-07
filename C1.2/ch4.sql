-- 25
select 商品コード, 商品名
from 商品
where 商品区分 = '1'
order by 商品コード desc

-- 26
select 注文日, 注文番号, 注文枝番, 商品コード, 数量
from 注文
where 注文日 >= '2022-03-01'
order by 注文番号, 注文枝番

-- 27
select distinct(商品コード)
from 注文
order by 商品コード

-- 28
select 注文日
from 注文
order by 注文日 desc limit 10

-- 29
select *
from 商品
order by 商品区分, 商品コード
limit 15 offset 5

-- 30
select *
from 廃番商品
where
    廃番日 between '2020-12-1' and '2020-12-31' or
    売上個数 >= 100
order by 売上個数 desc

-- 31
select 商品コード
from 商品
where 商品コード not in (
    select distinct(商品コード)
    from 注文
)
order by 商品コード

-- 31.2
select 商品コード
from 商品
except
select 商品コード
from 注文
order by 商品コード

-- 31.3
select 商品.商品コード
from 商品
left join 注文
on 商品.商品コード = 注文.商品コード
where 注文.商品コード is null

-- 32
select distinct(商品コード)
from 注文
order by 商品コード

-- 32.2
select 商品コード
from 商品
except
select 商品コード
from 注文
order by 商品コード

-- 32.3
select 商品.商品コード
from 商品
left join 注文
on 商品.商品コード = 注文.商品コード
where 注文.商品コード is not null

-- 33
select 商品コード, 商品名, 単価
from 商品
where 
    商品区分 = '9' and
    (
        単価 <= 1000 or
        単価 > 10000
    )
order by 単価, 商品コード