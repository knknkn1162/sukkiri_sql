-- 34
select 商品コード, 単価,
    trunc(単価*0.95) as キャンペーン価格
from 商品
order by 商品コード

-- 35
update 注文
set クーポン割引料 = クーポン割引料+300
where
    クーポン割引料 is not null and
    数量 >= 2 and
    注文日 between '2022-3-12' and '2022-3-14'
    
-- 36
update 注文
set 数量 = 数量-1
where
    注文番号 = '202202250126' and
    商品コード = 'W0156'
    
-- 37
select
    注文番号 || '-' || 注文枝番 as label
from 注文
where 注文番号 between '202110010001' and '202110319999'

-- 38
select distinct 商品区分 as 区分,
    case 商品区分
        when '1' then '衣類'
        when '2' then '靴'
        when '3' then '雑貨'
        when '9' then '未分類'
    end as 区分名
from 商品

-- 39
select 商品コード, 商品名, 単価,
    (
        case
            when 単価 < 3000 then 'S'
            when 単価 < 10000 then 'M'
            else 'L'
        end
    ) as 販売価格ランク,
    (
        商品区分 || ':' || case 商品区分
            when '1' then '衣類'
            when '2' then '靴'
            when '3' then '雑貨'
            when '9' then '未分類'
        end
    ) as 商品区分
from 商品
order by 単価, 商品コード

-- 40
select 商品名, length(商品名) as len
from 商品
where length(商品名) > 10
order by len

-- 41
select 注文日,
    right(注文番号, 4) as 注文番号
from 注文

-- 42
update 商品
set 商品コード = 'E' || substring(商品コード,2)
where substring(商品コード,1,1) = 'M'

-- 43
select right(注文番号,4)
from 注文
order by right(注文番号,4)

-- 44
update 廃番商品
set 廃番日 = current_date
where 商品コード = 'S1990'

-- 45
select 商品コード,商品名,
    単価 as 現在の単価,
    trunc(単価 * 0.7) as 値下げした単価
from 商品
where 単価 >= 10000