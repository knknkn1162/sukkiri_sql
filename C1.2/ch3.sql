-- 6
select *
from 商品
where 商品コード = 'W1252'

-- 7
update 商品
set 単価 = 500
where 商品コード = 'S0023'

-- 8
select *
from 商品
where 単価 <= 1000

-- 9
select *
from 商品
where 単価 >= 50000

-- 10
select *
from 注文
where 注文日 >= '2022-1-1'

-- 11
select *
from 注文
where 注文日 < '2021-12-1'

-- 12
select *
from 商品
where 商品区分 != '1'

-- 13
select *
from 注文
where クーポン割引料 is null

-- 14
select *
from 商品
where 商品コード like 'N%'

-- 15
select 商品コード, 商品名, 単価
from 商品
where 商品名 like '%コート%'

-- 16
select 商品コード, 商品区分
from 商品
where 商品区分 in ('2', '3', '9')

-- 17
select *
from 商品
where 商品コード between 'A0100' and 'A0500'

-- 18
select *
from 注文
where 商品コード in ('N0501', 'N1021', 'N0223')
-- 19
select *
from 商品
where 
    商品区分 = '3' and
    商品名 like '%水玉%'
    
-- 20
select *
from 商品
where
    商品名 like '%軽い%' or
    商品名 like '%ゆるふわ%'

-- 21
select *
from 商品
where
    (
        商品区分 = '1' and
        単価 <= 3000
    ) or
    (
        商品区分 = '3' and
        単価 >= 10000
    )

-- 22
select *
from 注文
where 注文日 between '2022-3-1' and '2022-3-31' and
    数量 >= 3

-- 23
select *
from 注文
where
    数量 >= 10 or
    クーポン割引料 is not null

-- 24
-- 商品: 商品コード
-- 注文: 注文番号, 注文枝番